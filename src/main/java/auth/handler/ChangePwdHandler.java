package auth.handler;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;
import member.model.User;
import member.test.MemberDao_help;
import mvc.controller.CommandHandler;

public class ChangePwdHandler implements CommandHandler {
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/changePwdForm.jsp";
		}else if (req.getMethod().equalsIgnoreCase("post")) {
			String newPwd = req.getParameter("confirmPassword");
			String password = req.getParameter("password");
			Connection conn =null;
			MemberDao_help dao = MemberDao_help.getInstance();
			try{
				conn = ConnectionProvider.getConnection();
				dao.updatePwdById(conn, newPwd, password);
				return "/WEB-INF/view/changePwdSuccess.jsp";
				
			}finally {
				JdbcUtil.close(conn);
			}
		}
		return null;
		
	}

}
