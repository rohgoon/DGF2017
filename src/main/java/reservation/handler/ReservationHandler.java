package reservation.handler;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import festival.model.Days;
import festival.model.DaysDao;
import festival.model.Seat;
import festival.model.SeatDao;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;

public class ReservationHandler implements CommandHandler {
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {
			int fno = Integer.parseInt(req.getParameter("fesno"));
			List<Days> daysListByFno = new ArrayList<>();
			List<Seat> seatList = new ArrayList<>();
			SqlSession session = null;
			try {
				session = MySqlSessionFactory.openSession();
				DaysDao daysDao = session.getMapper(DaysDao.class);
				daysListByFno = daysDao.selectListByFno(fno);
				req.setAttribute("daysInfo", daysListByFno);
				SeatDao seatDao = session.getMapper(SeatDao.class);
				seatList = seatDao.selectListAll();
				req.setAttribute("seatInfo", seatList);
				
				
			}catch (Exception e) {
				session.rollback();
				e.printStackTrace();
			
			}finally {
				session.close();
			}
			
			return "/WEB-INF/reservation/reservationForm.jsp";
		}else if (req.getMethod().equalsIgnoreCase("post")) {
			
		}
		return null;
	}

}
