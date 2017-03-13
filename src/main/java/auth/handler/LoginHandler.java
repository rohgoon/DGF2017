package auth.handler;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mvc.controller.CommandHandler;

public class LoginHandler implements CommandHandler {
	private final String FORM_VIEW = "/WEB-INF/view/login.jsp";
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {
			return FORM_VIEW;
		}else if (req.getMethod().equalsIgnoreCase("post")) {
			String id = req.getParameter("id");
			String password = req.getParameter("password");
			Connection conn =null;
			
			try{
			/*	conn = ConnectionProvider.getConnection();
				Member member = dao.selectAllById(conn, id);
				if (member == null) {
					req.setAttribute("notJoin", true);
					return FORM_VIEW;
				}
				if (!member.matchPassword(password)) {
					req.setAttribute("idOrPwdNotMatch", true);
					return FORM_VIEW;
				}
				User user =new User(id, member.getName());
				req.getSession().setAttribute("auth", user);
				return "index.jsp";
				*/
			}finally {
				//JdbcUtil.close(conn);
			}
		}
		return null;
	}

}
