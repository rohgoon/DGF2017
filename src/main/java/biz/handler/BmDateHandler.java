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
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		System.out.println("BmDateHandler>>>>>>>>>>>>>>>>>>>>");
			String bm = req.getParameter("bm");
			SqlSession session = null;
			try {
				session = MySqlSessionFactory.openSession();
				BmYearViewDao yearViewDao = session.getMapper(BmYearViewDao.class);
				List<BmYearView> bmYearViews = yearViewDao.selectListAll();
				int lineCheck =0;
				for (int i = 0; i < bmYearViews.size(); i++) {
					if (bmYearViews.get(i).getYear() != lineCheck) {
						bmYearViews.get(i).setFirstLine(true);
						lineCheck = bmYearViews.get(i).getYear();
					}else{
						bmYearViews.get(i).setFirstLine(false);
					}									
				}
				req.setAttribute("bmYear", bmYearViews);

				BmMonthViewDao monthViewDao = session.getMapper(BmMonthViewDao.class);
				List<BmMonthView> bmMonthViews = monthViewDao.selectListAll();
				lineCheck =0;
				for (int i = 0; i < bmMonthViews.size(); i++) {
					if (Integer.parseInt(bmMonthViews.get(i).getYmDate()) != lineCheck) {
						bmMonthViews.get(i).setFirstLine(true);
						lineCheck = Integer.parseInt(bmMonthViews.get(i).getYmDate());
					}else{
						bmMonthViews.get(i).setFirstLine(false);
					}									
				}
				req.setAttribute("bmMonth", bmMonthViews);

				BmDayViewDao dayViewDao = session.getMapper(BmDayViewDao.class);
				List<BmDayView> bmDayViews = dayViewDao.selectListAll();
				lineCheck =0;
				for (int i = 0; i < bmDayViews.size(); i++) {
					if (Integer.parseInt(bmDayViews.get(i).getYmdDate()) != lineCheck) {
						bmDayViews.get(i).setFirstLine(true);
						lineCheck = Integer.parseInt(bmDayViews.get(i).getYmdDate());
					}else{
						bmDayViews.get(i).setFirstLine(false);
					}									
				}
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
			/*case "search":
				return "/WEB-INF/biz/bm/bmSearch.jsp";*/
			default:
				return null;
			}

	}
}
