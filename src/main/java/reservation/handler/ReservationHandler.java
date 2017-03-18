package reservation.handler;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import festival.model.Days;
import festival.model.DaysDao;
import festival.model.Seat;
import festival.model.SeatDao;
import member.model.MemberDao;
import member.model.User;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;
import reservation.model.Reservation;
import reservation.model.ReservationDao;

public class ReservationHandler implements CommandHandler {
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {
			int fno = Integer.parseInt(req.getParameter("fesno"));
			List<Days> daysListByFno = new ArrayList<>();
			List<Seat> seatList = new ArrayList<>();
			String id = req.getParameter("id");			
			SqlSession session = null;
			try {
				session = MySqlSessionFactory.openSession();
				DaysDao daysDao = session.getMapper(DaysDao.class);
				daysListByFno = daysDao.selectListByFno(fno);
				req.setAttribute("daysInfo", daysListByFno);
				SeatDao seatDao = session.getMapper(SeatDao.class);
				seatList = seatDao.selectListAll();
				req.setAttribute("seatInfo", seatList);
				MemberDao memberDao = session.getMapper(MemberDao.class);
				User user = memberDao.selectAllById(id);
				req.setAttribute("user", user);
				
			}catch (Exception e) {
				session.rollback();
				e.printStackTrace();
			
			}finally {
				session.close();
			}
			
			return "/WEB-INF/reservation/reservationForm.jsp";
		}else if (req.getMethod().equalsIgnoreCase("post")) {
			int sno =Integer.parseInt(req.getParameter("seatNoResult"));
			int soldOut = Integer.parseInt(req.getParameter("seatSoldOut"));
			//soldOut에 구매 티켓 수를 빼야함
			int howMany = Integer.parseInt(req.getParameter("howMany"));//
			int uno = Integer.parseInt(req.getParameter("uno"));
			Date rtime = new Date();
			System.out.println(rtime);
			SqlSession session = null;
			try {
				session = MySqlSessionFactory.openSession();
				SeatDao seatDao = session.getMapper(SeatDao.class);
				Seat seatBefore = seatDao.selectBySno(sno);
				Reservation reservation = new Reservation(uno, sno, rtime);
				boolean ticket = false;
				if ((seatBefore.getMax()-seatBefore.getSold()) > 0 && howMany < (seatBefore.getMax()-seatBefore.getSold())) {
					seatBefore.setSold(soldOut+howMany);//팔린 티켓 수를 클래스변수에 삽입
					seatDao.updateBySno(seatBefore);//팔린 티켓 수 업데이트
					session.commit();
					System.out.println("팔린 티켓수 업데이트 완료 : "+soldOut);
					//reservation 테이블로 update
					ReservationDao reservationDao =session.getMapper(ReservationDao.class);
										
					for (int i = 0; i < howMany; i++) {
						reservationDao.insert(reservation);						
					}										
					ticket = true;					
					session.commit();
					System.out.println("예매 테이블 삽입 완료 : "+reservation.getRtimeString());
				} else {
					ticket = false;
				}
				req.setAttribute("reservationInfo", reservation);
				req.setAttribute("seatInfo", seatBefore);
				req.setAttribute("ticket", ticket);// true면 예매 완료, false면 매진으로 예매 불가
				
				
				
			}catch (Exception e) {
				session.rollback();
				e.printStackTrace();
			
			}finally {
				session.close();
			}
			
			return "/WEB-INF/reservation/reservationSuccess.jsp";
		}
		return null;
	}

}
