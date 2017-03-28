package admin.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import festival.model.Seat;
import festival.model.SeatDao;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;

public class SeatDelHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {			
			return "/WEB-INF/admin/adminFestivalForm.jsp";
		}else if (req.getMethod().equalsIgnoreCase("post")) {
			int sno = Integer.parseInt(req.getParameter("no"));
			SqlSession session = null;
			try {
				session = MySqlSessionFactory.openSession();
				SeatDao seatDao = session.getMapper(SeatDao.class); 
				seatDao.deleteBySno(sno);
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
