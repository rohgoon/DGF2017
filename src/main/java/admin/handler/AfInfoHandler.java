package admin.handler;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import biz.model.SeatDetailView;
import biz.model.SeatDetailViewDao;
import festival.model.Festival;
import festival.model.FestivalDao;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;

public class AfInfoHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		int fno = Integer.parseInt(req.getParameter("fno"));
		int fCount = Integer.parseInt(req.getParameter("fCount"));
		SqlSession session = null;
		try {
			session = MySqlSessionFactory.openSession();
			// 티켓 정보 변경시
			FestivalDao festivalDao = session.getMapper(FestivalDao.class);			
			Festival festival = festivalDao.selectListByFno(fno);
			int fCountMax = festivalDao.selectCountAll();
			List<Festival> fList = festivalDao.selectList();
			req.setAttribute("fesInfo", festival);
			req.setAttribute("fCount", fCount);
			
			Date now = new Date();
			now.setHours(0);
			now.setMinutes(0);
			now.setSeconds(0);
			List<Festival> fesNowList = festivalDao.selectListBiggerThanNow(now);
			req.setAttribute("fesNowList", fesNowList);				
			int startFCount = fCountMax-fesNowList.size();
			req.setAttribute("startFCount", startFCount+1);
			
			
			SeatDetailViewDao seatDetailViewDao = session.getMapper(SeatDetailViewDao.class);
			List<SeatDetailView> seatDetailViews = seatDetailViewDao.selectAllByFno(fno);
			int lc = 0;
			for (int i = 0; i < seatDetailViews.size(); i++) {
				if (seatDetailViews.get(i).getDno() != lc) {
					seatDetailViews.get(i).setLineChecker(true);
					lc = seatDetailViews.get(i).getDno();
				} else {
					seatDetailViews.get(i).setLineChecker(false);
				}
			}
			req.setAttribute("fesDetailList", seatDetailViews);

		} finally {
			session.close();
		}
		return "/WEB-INF/admin/afInfo.jsp";
	}

}
