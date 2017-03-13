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
			
		}
		return null;
	}

}
