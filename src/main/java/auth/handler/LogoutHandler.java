package auth.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mvc.controller.CommandHandler;

public class LogoutHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		HttpSession session = req.getSession(false);
		
		if (session != null) {
			session.invalidate();//세션 삭제
		}
				
		return null;
	}

}
