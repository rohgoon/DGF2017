package admin.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import biz.model.SeatDetailView;
import biz.model.SeatDetailViewDao;
import festival.model.Festival;
import festival.model.FestivalDao;
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
			FestivalDao festivalDao = session.getMapper(FestivalDao.class);
			Festival festival = festivalDao.selectListByFno(fno);
			List<Festival> fList = festivalDao.selectList();
			req.setAttribute("fesInfo", festival);
			req.setAttribute("fCount", fList.size());
			SeatDetailViewDao seatDetailViewDao = session.getMapper(SeatDetailViewDao.class);
			List<SeatDetailView> seatDetailViews = seatDetailViewDao.selectAllByFno(fno);
			req.setAttribute("fesDetailList", seatDetailViews);
			
		}finally {
			session.close();
		}
		return "/WEB-INF/admin/afInfo.jsp";
	}

}
