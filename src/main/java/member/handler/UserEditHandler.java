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
			SqlSession session = null;
			try {
				int uno = Integer.parseInt(req.getParameter("uno"));
				session = MySqlSessionFactory.openSession();
				MemberDao memberDao = session.getMapper(MemberDao.class);
				User user =memberDao.selectAllByUno(uno);
				req.setAttribute("user", user);
				String[] phoneArr = user.getPhone().split("-");
				req.setAttribute("phone", phoneArr);
			} finally {
				session.close();
			}
			
			
			return "/WEB-INF/view/userEdit.jsp";
		}else if (req.getMethod().equalsIgnoreCase("post")) {
			int uno = Integer.parseInt(req.getParameter("uno"));
			SqlSession session = null;
			try {
				session = MySqlSessionFactory.openSession();
				session = MySqlSessionFactory.openSession();
				MemberDao memberDao = session.getMapper(MemberDao.class);				
				User user = new User();
				user.setUno(uno);
				if (req.getParameter("repassword").equals("") || req.getParameter("repassword").isEmpty()) {
					
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
			} finally {
				session.rollback();
				session.close();
			}
			
			return "front.do"; // 경로 수정
		}
		
		return null;
	}

}
