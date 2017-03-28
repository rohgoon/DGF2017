package admin.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import member.model.MemberDao;
import member.model.User;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;
import reservation.model.ReservationViewDao;

public class UrMngHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {
			SqlSession session = null;
			try {
				session = MySqlSessionFactory.openSession();
				MemberDao memberDao = session.getMapper(MemberDao.class);
				List<User> users =memberDao.selectList();
				req.setAttribute("userList", users);
			} finally {
				session.close();
			}
			
			
			return "/WEB-INF/admin/urMng.jsp";
		}else if (req.getMethod().equalsIgnoreCase("post")) {
			SqlSession session = null;
			try {
				session = MySqlSessionFactory.openSession();
				ReservationViewDao reservationViewDao = session.getMapper(ReservationViewDao.class);
				//List<ReservationView> rvDate = reservationViewDao.selectListByDate(sdate, edate);
				//List<ReservationView> rvUno = reservationViewDao.selectDetailListbyUno(uno);
				

			} finally {
				session.close();
			}
			
			return "afInfo.do";
		}
		
		
		return null;
	}

}
