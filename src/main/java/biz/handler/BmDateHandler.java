package biz.handler;

import java.util.ArrayList;
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
			SqlSession session = null;
			try {
				session = MySqlSessionFactory.openSession();
				BmYearViewDao yearViewDao = session.getMapper(BmYearViewDao.class);
				List<BmYearView> bmYearViews = yearViewDao.selectListAll();
				int lineCheck =0;
				for (int i = 0; i < bmYearViews.size(); i++) {
					if (bmYearViews.get(i).getFno() != lineCheck) {
						bmYearViews.get(i).setFirstLine(true);
						lineCheck = bmYearViews.get(i).getFno();
					}else{
						bmYearViews.get(i).setFirstLine(false);
					}
					
					
				}
				req.setAttribute("bmYear", bmYearViews);

				BmMonthViewDao monthViewDao = session.getMapper(BmMonthViewDao.class);
				List<BmMonthView> bmMonthViews = monthViewDao.selectListAll();
				req.setAttribute("bmMonth", bmMonthViews);

				BmDayViewDao dayViewDao = session.getMapper(BmDayViewDao.class);
				List<BmDayView> bmDayViews = dayViewDao.selectListAll();
				req.setAttribute("bmDay", bmDayViews);
			} finally {
				session.close();
			}

			// return을 switch로 할것
			switch (bm) {
			case "year":
				return "/WEB-INF/biz/bm/bmYear.jsp";
					
			case "month":
				return "/WEB-INF/biz/bm/bmMonth.jsp";

			case "day":
				return "/WEB-INF/biz/bm/bmDay.jsp";

			}

		}
		return null;
	}
	/*private ArrayList<T> setLine(List<T> bmList){
		int lineCheck =0;
		for (int i = 0; i < bmList.size(); i++) {
			if (bmList.get(i).getFno() != lineCheck) {
				bmList.get(i).setFirstLine(true);
				lineCheck = bmList.get(i).getFno();
			}else{
				bmList.get(i).setFirstLine(false);
			}
			
			
		}
		
	}*/


}
