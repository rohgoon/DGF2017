package admin.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import festival.model.DaysDao;
import festival.model.SeatDao;
import member.model.MemberDao;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;

public class DaysDelHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {			
			return "/WEB-INF/admin/adminFestivalForm.jsp";
		}else if (req.getMethod().equalsIgnoreCase("post")) {
			int dno = Integer.parseInt(req.getParameter("dno"));
			SqlSession session = null;
			try {
				session = MySqlSessionFactory.openSession();
				DaysDao daysDao = session.getMapper(DaysDao.class);
				daysDao.deleteDays(dno);
				session.commit();
			} catch (Exception e) {
				session.rollback();
				e.getStackTrace();
			} finally {
				session.close();
			}
			return "/WEB-INF/admin/adminFestivalSuccess.jsp";
		}
		return null;
	}

}
