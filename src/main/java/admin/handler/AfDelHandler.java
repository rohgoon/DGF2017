package admin.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import biz.model.SeatDetailView;
import biz.model.SeatDetailViewDao;
import festival.model.DaysDao;
import festival.model.FestivalDao;
import festival.model.SeatDao;
import lineup.model.LineupDao;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;
import reservation.model.ReservationView;
import reservation.model.ReservationViewDao;

public class AfDelHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		int fno  = Integer.parseInt(req.getParameter("fno"));
		int fCount = Integer.parseInt(req.getParameter("fCount"));
		
		SqlSession session = null;
		try {
		session =MySqlSessionFactory.openSession();
				
		ReservationViewDao reservationViewDao = session.getMapper(ReservationViewDao.class);
		List<ReservationView> reservationViews = reservationViewDao.selectListByFno(fno);
			if (reservationViews.size() > 0 ) {
				return "/WEB-INF/admin/errorAf.jsp";
			}else{
				SeatDetailViewDao seatDetailViewDao = session.getMapper(SeatDetailViewDao.class);
				List<SeatDetailView> seatDetailViews = seatDetailViewDao.selectAllByFno(fno);
				
				SeatDao seatDao = session.getMapper(SeatDao.class);
				for (SeatDetailView s : seatDetailViews) {
					seatDao.deleteByDno(s.getDno());					
				}
				session.commit();
				LineupDao lineupDao = session.getMapper(LineupDao.class);
				for (SeatDetailView s : seatDetailViews) {
					lineupDao.deleteLineupByDno(s.getDno());
				}
				session.commit();
				DaysDao daysDao = session.getMapper(DaysDao.class);				
				daysDao.deleteDaysByFno(fno);
				session.commit();
				FestivalDao festivalDao = session.getMapper(FestivalDao.class);
				festivalDao.deleteFestival(fno);
				session.commit();
			}
			
		}catch (Exception e) {
			
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return "afInfo.do?fno=2&fCount=2"; // 임시용
	}

}
