package auth.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import auth.model.LoginUser;
import member.model.MemberDao;
import member.model.User;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;

public class LoginHandler implements CommandHandler {
	
	private final String FORM_VIEW = "/WEB-INF/view/login.jsp";
	
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {
			
			return FORM_VIEW;
			
		}else if (req.getMethod().equalsIgnoreCase("post")) {
			String id = req.getParameter("id");
			String password = req.getParameter("password");
			SqlSession session = null;			
			try{
				session = MySqlSessionFactory.openSession();
				MemberDao dao = session.getMapper(MemberDao.class);
				User user = dao.selectAllById(id);
				if (user == null) {
					req.setAttribute("notJoin", true);
					return FORM_VIEW;
				}
				if (!user.matchPassword(password)) {
					req.setAttribute("idOrPwdNotMatch", true);
					return FORM_VIEW;
				}
				LoginUser loginUser =new LoginUser(id, user.getUname());
				req.getSession().setAttribute("auth", user);
				return "front.jsp";
			
			}finally {
				session.close();
			}
		}
		return null;
	}

}
