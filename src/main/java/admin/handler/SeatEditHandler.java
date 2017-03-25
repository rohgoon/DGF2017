package admin.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import festival.model.Seat;
import festival.model.SeatDao;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;

public class SeatEditHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {	
			int sno = Integer.parseInt(req.getParameter("sno"));
			SqlSession session = null;
			try {
				session = MySqlSessionFactory.openSession();
				SeatDao seatDao = session.getMapper(SeatDao.class);
				Seat seat = seatDao.selectBySno(sno);
				req.setAttribute("seat", seat);
			} finally {
				session.close();
			}
			
			
			return "/WEB-INF/admin/afInfoSeat.jsp";
		}else if (req.getMethod().equalsIgnoreCase("post")) {
			
			return "afInfo.do";
		}
		return null;
	}

}
