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

public class BmSearchHandler implements CommandHandler {
	private final String FORM_VIEW = "/WEB-INF/biz/bm/bmSearch.jsp";

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {
			return FORM_VIEW;
		} else if (req.getMethod().equalsIgnoreCase("post")) {
			System.out.println("BmSearchHandler>>>>>>>>>");
			String sdate = req.getParameter("sdate");
			String edate = req.getParameter("edate");
			String[] sdArr = sdate.split("-");
			String[] edArr = edate.split("-");			
			String symd = sdArr[0]+sdArr[1]+sdArr[2];
			String eymd = edArr[0]+edArr[1]+edArr[2];
			SqlSession session = null;
			try {
				session = MySqlSessionFactory.openSession();
				BmDayViewDao dayViewDao = session.getMapper(BmDayViewDao.class);
				List<BmDayView> bmDayViews = dayViewDao.selectListByYmdDate(symd, eymd);
				bmDayViews.get(bmDayViews.size()-1).setFirstLine(true);
				int sumTt = bmDayViews.size();
				int sumTp = 0;				
				for (BmDayView b : bmDayViews) {					
					sumTp += b.getPrice();
				}
				bmDayViews.get(0).setFirstLine(true);
				bmDayViews.get(0).setTotalCount(sumTt);
				bmDayViews.get(0).setTotalPrice(sumTp);
				for (int i = 1; i < bmDayViews.size(); i++) {
					bmDayViews.get(i).setFirstLine(false);
				}
				
				
				req.setAttribute("bmSearch", bmDayViews);
				req.setAttribute("sdate", sdate);
				req.setAttribute("edate", edate);
				
			} finally {
				session.close();
			}
			return "/WEB-INF/biz/bm/bmSearchSuccess.jsp";
		}
		return null;
	}

}
