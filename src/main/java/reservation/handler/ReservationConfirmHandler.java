package reservation.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import member.model.MemberDao;
import member.model.User;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;
import reservation.model.RCountView;
import reservation.model.RCountViewDao;
import reservation.model.ReservationView;
import reservation.model.ReservationViewDao;

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
			RCountViewDao rCountViewDao = session.getMapper(RCountViewDao.class);
			List<RCountView> reservationViews = rCountViewDao.selectListByUno(uno);
			req.setAttribute("reservationList", reservationViews);
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return "/WEB-INF/reservation/reservationConfirm.jsp";

	}

}
