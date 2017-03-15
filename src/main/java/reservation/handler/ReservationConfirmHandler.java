package reservation.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import member.model.MemberDao;
import member.model.User;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;
import reservation.model.ReservationDao;
import reservation.model.ReservationView;

public class ReservationConfirmHandler implements CommandHandler {
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
			
			int uno = Integer.parseInt(req.getParameter("uno"));
			SqlSession session = null;
			try {
				session = MySqlSessionFactory.openSession();
				MemberDao memberDao = session.getMapper(MemberDao.class);
				User user = memberDao.selectAllByUno(uno);
				req.setAttribute("userInfo", user);
				ReservationDao reservationDao = session.getMapper(ReservationDao.class);
				List<ReservationView> reservationViews = reservationDao.selectDetailListbyUno(uno);
				req.setAttribute("reservationList", reservationViews);
				/*List<Reservation> reservationList = reservationDao.selectAllbyUno(uno);
				req.setAttribute("reservationList", reservationList);*/
				
				
			}catch (Exception e) {
				session.rollback();
				e.printStackTrace();
			
			}finally {
				session.close();
			}
			return "/WEB-INF/reservation/reservationConfirm.jsp";
		
	}

}
