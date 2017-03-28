package auth.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import auth.model.LoginUser;
import member.model.MemberDao;
import member.model.User;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;

public class IdCheckHandler implements CommandHandler  {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String id = req.getParameter("id");
		SqlSession session = null;
		try{
			session = MySqlSessionFactory.openSession();
			MemberDao dao = session.getMapper(MemberDao.class);
			String findId = dao.selectId(id);
			req.setAttribute("findId", findId);
			return "WEB-INF/login/checkId.jsp";
		}finally{
			session.close();
		}
	}
}