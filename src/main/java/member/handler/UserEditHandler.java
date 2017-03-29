package member.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import member.model.MemberDao;
import member.model.User;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;
import reservation.model.ReservationViewDao;

public class UserEditHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		
		if (req.getMethod().equalsIgnoreCase("get")) {
			User sessionUser = (User)req.getSession().getAttribute("auth");
			req.setAttribute("user", sessionUser);
			String[] phoneArr = sessionUser.getPhone().split("-");
			req.setAttribute("phone", phoneArr);
			return "/WEB-INF/view/myinfo.jsp";
			
			
		}else if (req.getMethod().equalsIgnoreCase("post")) {
			int uno = Integer.parseInt(req.getParameter("uno"));
			SqlSession session = null;
			try {
				session = MySqlSessionFactory.openSession();
				MemberDao memberDao = session.getMapper(MemberDao.class);				
				User user = new User();
				user.setUno(uno);
				if (req.getParameter("repassword").equals("") || req.getParameter("repassword").isEmpty()) {
					user.setUpassword(req.getParameter("password"));
				}else{
					user.setUpassword(req.getParameter("repassword"));
				}
				user.setEmail(req.getParameter("email"));
				user.setPhone(
						req.getParameter("phone1")+"-"+
						req.getParameter("phone2")+"-"+
						req.getParameter("phone3")						
						);
				memberDao.updateInfoById(user);
				session.commit();
				req.getSession().invalidate();
			} finally {
				session.rollback();
				session.close();
			}
			
			return "front.do"; // 경로 수정
		}
		
		return null;
	}

}
