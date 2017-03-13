package reservation.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import auth.model.LoginUser;
import member.model.MemberDao;
import member.model.User;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;

public class ReservationHandler implements CommandHandler {
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/reservation/reservationForm.jsp";
		}else if (req.getMethod().equalsIgnoreCase("post")) {
			
		}
		return null;
	}

}
