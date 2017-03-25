package admin.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import biz.model.SeatDetailView;
import biz.model.SeatDetailViewDao;
import festival.model.Festival;
import festival.model.FestivalDao;
import member.model.MemberDao;
import member.model.User;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;
import reservation.model.ReservationView;
import reservation.model.ReservationViewDao;

public class AfEditHandler implements CommandHandler {
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		if (req.getMethod().equalsIgnoreCase("get")) {
			//form으로 던질 것 준비
			int fno = Integer.parseInt(req.getParameter("fno"));
			int fCount =Integer.parseInt(req.getParameter("fCount"));
			SqlSession session = null;
			try {
				session = MySqlSessionFactory.openSession();
				FestivalDao festivalDao = session.getMapper(FestivalDao.class);
				Festival festival = festivalDao.selectListByFno(fno);
				req.setAttribute("fesInfo", festival);
				req.setAttribute("fCount", fCount);
				//세부일정 받아오기
				SeatDetailViewDao seatDetailViewDao = session.getMapper(SeatDetailViewDao.class);
				List<SeatDetailView> seatDetailViews = seatDetailViewDao.selectAllByFno(fno);
				int lc = 0;
				for (int i = 0; i < seatDetailViews.size(); i++) {
					if (seatDetailViews.get(i).getDno() != lc) {
						seatDetailViews.get(i).setLineChecker(true);
						lc = seatDetailViews.get(i).getDno();
					} else {
						seatDetailViews.get(i).setLineChecker(false);
					}

				}

				req.setAttribute("fesDetailList", seatDetailViews);
				
			} catch (Exception e) {
				
				e.printStackTrace();
			} finally {
				session.close();
			}
			return "/WEB-INF/admin/afInfoEdit.jsp";
		}else if (req.getMethod().equalsIgnoreCase("post")) {
			//form에서 받아 온것들로 수정
			int fno = Integer.parseInt(req.getParameter("fno"));
			String place = req.getParameter("place");
			SqlSession session = null;
			try {
				session = MySqlSessionFactory.openSession();
				FestivalDao festivalDao = session.getMapper(FestivalDao.class);
				Festival festival = festivalDao.selectListByFno(fno);
				festival.setPlace(place);
				festivalDao.updateFestival(festival);
				session.commit();
				
				req.setAttribute("fesInfo", festival);
				List<Festival> fList = festivalDao.selectList();
				req.setAttribute("fCount", fList.size());
				SeatDetailViewDao seatDetailViewDao = session.getMapper(SeatDetailViewDao.class);
				List<SeatDetailView> seatDetailViews = seatDetailViewDao.selectAllByFno(fno);
				int lc = 0;
				for (int i = 0; i < seatDetailViews.size(); i++) {
					if (seatDetailViews.get(i).getDno() != lc) {
						seatDetailViews.get(i).setLineChecker(true);
						lc = seatDetailViews.get(i).getDno();
					} else {
						seatDetailViews.get(i).setLineChecker(false);
					}
				}
				req.setAttribute("fesDetailList", seatDetailViews);
				
				
			} catch (Exception e) {
				session.rollback();
				e.printStackTrace();
			} finally {
				session.close();
			}
			
			
			return "/WEB-INF/admin/afInfo.jsp";
		}
		return null;
	}

}
