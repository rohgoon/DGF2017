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
				int[] dnoForReservation = new int[seatList.size()];
				for (int i = 0; i < seatList.size(); i++) {
					dnoForReservation[i] = seatList.get(i).getDno();
				}
				req.setAttribute("seatDno", dnoForReservation);
				int[] snoForReservation = new int[seatList.size()];
				for (int i = 0; i < seatList.size(); i++) {
					snoForReservation[i] = seatList.get(i).getSno();
				}
				req.setAttribute("seatSno", snoForReservation);
				String[] greadeForReservation = new String[seatList.size()];
				for (int i = 0; i < seatList.size(); i++) {
					greadeForReservation[i] = seatList.get(i).getGrade();
				}
				req.setAttribute("seatGrade", greadeForReservation);
				int[] priceForReservation = new int[seatList.size()];
				for (int i = 0; i < seatList.size(); i++) {
					priceForReservation[i] = seatList.get(i).getSno();
				}
				req.setAttribute("seatPrice", priceForReservation);
				int[] maxForReservation = new int[seatList.size()];
				for (int i = 0; i < seatList.size(); i++) {
					maxForReservation[i] = seatList.get(i).getMax();
				}
				req.setAttribute("seatMax", maxForReservation);
				int[] soldForReservation = new int[seatList.size()];
				for (int i = 0; i < seatList.size(); i++) {
					soldForReservation[i] = seatList.get(i).getSold();
				}
				req.setAttribute("seatSold", soldForReservation);
				
				
				
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
