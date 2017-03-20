package biz.handler;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import biz.model.BmFestival;
import biz.model.SeatDetailView;
import biz.model.SeatDetailViewDao;
import biz.model.SeatPerGrade;
import festival.model.Festival;
import festival.model.FestivalDao;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;

public class BizManageHandler implements CommandHandler {
	private final String FORM_VIEW = "/WEB-INF/view/bmFront.jsp";
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {
			SqlSession session = null;			
			try{
				session = MySqlSessionFactory.openSession();
				//bmFestival 시작
				FestivalDao festivalDao = session.getMapper(FestivalDao.class);
				List<Festival> festivals = festivalDao.selectList();
				List<SeatDetailView> seatDetailViewList = new ArrayList<>();
				SeatDetailViewDao seatDetailViewDao = session.getMapper(SeatDetailViewDao.class);
				SeatDetailView seatDetailView = new SeatDetailView();
				List<BmFestival> bmFestivals = new ArrayList<>();
				for (int i = 1; i <= festivals.size(); i++) {//페스티벌 총 횟수만큼 반복
					seatDetailViewList = seatDetailViewDao.selectAllByFno(i);					
					List<SeatPerGrade> seatList = new ArrayList<>();
					SeatPerGrade seatPerGrade = new SeatPerGrade();
					int totalTicket = 0;
					int totalPrice = 0;
					for (int j = 0; j < seatDetailViewList.size(); j++) {						
						String g = seatDetailViewList.get(j).getGrade();
						int s = seatDetailViewList.get(j).getSoldSeat();
						int p = seatDetailViewList.get(j).getPrice();
						seatPerGrade.setGrade(g);
						seatPerGrade.setSoldSeat(s);
						seatPerGrade.setPrice(p);
						seatList.add(seatPerGrade);
						totalTicket += s;
						totalPrice += seatPerGrade.getHowMuch();
					}// BmFestival 클래스에 들어갈 seatPerGrade Map 생성
					//totalTicket, totalPrice도 반복문으로 처리
					//BmFestival(fno, sday, eday, seatPerGrade, totalTicket, totalPrice)
					bmFestivals.add(
							new BmFestival(i, seatDetailViewList.get(0).getSday(), seatDetailViewList.get(0).getEday(),
									seatList, totalTicket, totalPrice)
							);
				}
				req.setAttribute("bmFestivals", bmFestivals);
			//bmFestival 처리
				
				
			}finally {
				session.close();
			}
			
			return FORM_VIEW;
		}else if (req.getMethod().equalsIgnoreCase("post")) {
			
		}
		return null;
	}

}
