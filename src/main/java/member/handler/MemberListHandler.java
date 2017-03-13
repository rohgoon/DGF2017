package member.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import member.model.User;
import member.model.MemberDao;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;

public class MemberListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		SqlSession session = MySqlSessionFactory.openSession();
		try {
			MemberDao dao = session.getMapper(MemberDao.class);
			
			List<User> list = null;
			list = dao.selectList();
			req.setAttribute("viewData", list);			
		} finally {
			session.close();
		}
		return "/WEB-INF/view/memberList.jsp";
	}
}
