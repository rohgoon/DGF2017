package auth.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import member.model.MemberDao;
import member.model.User;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;

public class ChangePwdHandler implements CommandHandler {
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/changePwdForm.jsp";
		}else if (req.getMethod().equalsIgnoreCase("post")) {
			String newPwd = req.getParameter("confirmPassword");
			String password = req.getParameter("password");
			
			SqlSession session = null;			
			try{
				session = MySqlSessionFactory.openSession();
				MemberDao dao = session.getMapper(MemberDao.class);
				dao.updatePwdById(newPwd, password);
				session.commit();
				return "/WEB-INF/view/changePwdSuccess.jsp";
				
			}finally {
				session.close();
			}
		}
		return null;
		
	}

}
