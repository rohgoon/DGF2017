package biz.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import biz.model.BmDayView;
import biz.model.BmDayViewDao;
import biz.model.BmMonthView;
import biz.model.BmMonthViewDao;
import biz.model.BmYearView;
import biz.model.BmYearViewDao;
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
			String sym = sdArr[0]+sdArr[1];
			String eym = edArr[0]+edArr[1];
			String symd = sdArr[0]+sdArr[1]+sdArr[2];
			String eymd = edArr[0]+edArr[1]+edArr[2];
			SqlSession session = null;
			try {
				session = MySqlSessionFactory.openSession();
				BmYearViewDao yearViewDao = session.getMapper(BmYearViewDao.class);
				List<BmYearView> bmYearViews = yearViewDao.selectListByYear(sy, ey);
				req.setAttribute("bmYear", bmYearViews);

				BmMonthViewDao monthViewDao = session.getMapper(BmMonthViewDao.class);
				List<BmMonthView> bmMonthViews = monthViewDao.selectListByYmDate(sym, eym);
				req.setAttribute("bmMonth", bmMonthViews);

				BmDayViewDao dayViewDao = session.getMapper(BmDayViewDao.class);
				List<BmDayView> bmDayViews = dayViewDao.selectListByYmdDate(symd, eymd);
				req.setAttribute("bmDay", bmDayViews);
			} finally {
				session.close();
			}

			// return을 switch로 할것
			switch (bm) {
			case "year":
				return "/WEB-INF/view/bmYear.html";
					
			case "month":
				return "/WEB-INF/view/bmMonth.html";

			case "day":
				return "/WEB-INF/view/bmDay.html";

			}

		}
		return null;
	}

}
