package admin.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import biz.model.SeatDetailView;
import biz.model.SeatDetailViewDao;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;

public class afInfoHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		int fno = Integer.parseInt(req.getParameter("fno"));
		SqlSession session = null;			
		try{
			session = MySqlSessionFactory.openSession();
			//티켓 정보 변경시
			SeatDetailViewDao seatDetailViewDao = session.getMapper(SeatDetailViewDao.class);
			List<SeatDetailView> seatDetailView = seatDetailViewDao.selectAllByFno(fno);
			req.setAttribute("fesInfo", seatDetailView);
			
		}finally {
			session.close();
		}
		return "/WEB-INF/admin/afInfo.jsp";
	}

}
