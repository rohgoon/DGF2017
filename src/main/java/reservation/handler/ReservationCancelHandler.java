package reservation.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import festival.model.Seat;
import festival.model.SeatDao;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;
import reservation.model.RCountView;
import reservation.model.RCountViewDao;
import reservation.model.Reservation;
import reservation.model.ReservationDao;

public class ReservationCancelHandler implements CommandHandler {
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
			int uno = Integer.parseInt(req.getParameter("uno"));
			int rno = Integer.parseInt(req.getParameter("rno"));
			
			
			int seatNo = Integer.parseInt(req.getParameter("sno"));
			SqlSession session = null;
			try {
				session = MySqlSessionFactory.openSession();
				RCountViewDao rCountViewDao = session.getMapper(RCountViewDao.class);
				RCountView rCountView = rCountViewDao.selectListByRno(rno);
				//System.out.println("출력테스트>>>>"+rno);
				
				Reservation reservationForDel = new Reservation();				
				reservationForDel.setUno(uno);
				reservationForDel.setRtime(rCountView.getRtime());
				ReservationDao reservationDao = session.getMapper(ReservationDao.class);				
				List<Reservation> reservationForDelList = reservationDao.selectAllByUnoAndRtime(reservationForDel);
				
				for (Reservation reservation : reservationForDelList) {
					seatNo = reservation.getSno();
					reservationDao.delectByRno(reservation.getRno());
					
				}
				session.commit();// delete reservation
				SeatDao seatDao = session.getMapper(SeatDao.class);// update seat.sold
				Seat seatBefore = seatDao.selectBySno(seatNo);
				int beforSold = seatBefore.getSold();
				int resultSold = beforSold-reservationForDelList.size();
				Seat seatAfter = new Seat();
				seatAfter.setSold(resultSold);
				seatAfter.setSno(seatNo);
				seatDao.updateSoldBySno(seatAfter);//해당 seat테이블은 어차피 하나뿐임
				session.commit();// reservaion을 uno, rtime 통한 select문으로 받아오고 그 정보를 통해서 seat의 sold 차감시킴.
				
			}catch (Exception e) {
				session.rollback();
				e.printStackTrace();
			}finally {
				session.close();
			}
			
			return "reservationConfirm.do?uno="+uno+"";
		
	}

}
