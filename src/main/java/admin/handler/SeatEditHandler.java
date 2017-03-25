package admin.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import biz.model.SeatDetailView;
import biz.model.SeatDetailViewDao;
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
			int sno = Integer.parseInt(req.getParameter("sno"));
			String grade = req.getParameter("grade");
			int price = Integer.parseInt(req.getParameter("price"));
			int max = Integer.parseInt(req.getParameter("max"));
			SqlSession session = null;
			try {
				session = MySqlSessionFactory.openSession();
				SeatDao seatDao = session.getMapper(SeatDao.class);
				Seat seat = new Seat();
				seat.setSno(sno);
				seat.setGrade(grade);
				seat.setPrice(price);
				seat.setMax(max);				
				seatDao.updateBySno(seat);
				session.commit();
				
				SeatDetailViewDao seatDetailViewDao = session.getMapper(SeatDetailViewDao.class);
				SeatDetailView seatDetailView = seatDetailViewDao.selectAllBySno(sno);
				req.setAttribute("fno", seatDetailView.getFno());
				
				
			}catch (Exception e) {
				session.rollback();
				e.getStackTrace();
			}finally {
				
				session.close();
			}
			
			return "afInfo.do";
		}
		return null;
	}

}
