package admin.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import member.model.MemberDao;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;

public class afEditHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {			
			return "/WEB-INF/admin/adminFestivalForm.jsp";
		}else if (req.getMethod().equalsIgnoreCase("post")) {
			
			return "/WEB-INF/admin/adminFestivalSuccess.jsp";
		}
		return null;
	}

}
