package member.handler;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import member.model.Member;
import member.model.MemberDao;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;

public class JoinHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/join.jsp";
		}else if (req.getMethod().equalsIgnoreCase("post")) {
			String phone = req.getParameter("phone1")+"-"+req.getParameter("phone2")+"-"+req.getParameter("phone3");
			Member mem = new Member(req.getParameter("id"), 
					req.getParameter("name"), req.getParameter("password"),
					req.getParameter("email"), phone, 
					new Date());
			SqlSession session = null;
			try {
				session = MySqlSessionFactory.openSession();
				MemberDao dao = session.getMapper(MemberDao.class);
				dao.insert(mem);
				session.commit();
			}catch (Exception e) {
				session.rollback();
				e.printStackTrace();
			
			}finally {
				session.close();
			}
			return "/WEB-INF/view/joinSuccess.jsp";
		}
		return null;
	}

}
