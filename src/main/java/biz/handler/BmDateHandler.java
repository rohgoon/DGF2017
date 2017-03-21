package biz.handler;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import biz.model.BmFestival;
import biz.model.SeatDetailView;
import biz.model.SeatDetailViewDao;
import biz.model.SeatPerGrade;
import festival.model.Festival;
import festival.model.FestivalDao;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;

public class BmDateHandler implements CommandHandler {
	private final String FORM_VIEW = "/WEB-INF/biz/bmFront.jsp";

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {
			
			return FORM_VIEW;
		} else if (req.getMethod().equalsIgnoreCase("post")) {
			String bm = req.getParameter("bm");
			String sdate = req.getParameter("sdate");
			String edate = req.getParameter("edate");
			String[] sdArr = sdate.split("-");
			String[] edArr = edate.split("-");
			int sy = Integer.parseInt(sdArr[0]);
			int ey = Integer.parseInt(edArr[0]);
			int sm = Integer.parseInt(sdArr[1]);
			int em = Integer.parseInt(edArr[1]);
			int sd = Integer.parseInt(sdArr[2]);
			int ed = Integer.parseInt(sdArr[2]);
			SqlSession session = null;
			try {
				session = MySqlSessionFactory.openSession();
				// bmDate 시작
				SeatDetailViewDao seatDetailViewDao = session.getMapper(SeatDetailViewDao.class);				
				switch (bm) {
				case "year":					
					sdate = sy+"-01-01";
					edate = ey+"-12-31";
					break;
				case "month":
					sdate = sy+"-"+sm;
					edate = ey+"-"+(em+1);
					break;				
				case "day":
					sdate = sy+"-"+sm+"-"+sd;
					edate = ey+"-"+em+"-"+ed;
					break;
				}
				List<SeatDetailView> seatDetailView = seatDetailViewDao.selectListByDate(sdate, edate);
				for (SeatDetailView sdv : seatDetailView) {
					
				}
				
				

			} finally {
				session.close();
			}
			
			
			
			
			return "/WEB-INF/view/bmDate.html";

		}
		return null;
	}

}
