package biz.handler;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import biz.model.SeatDetailView;
import biz.model.SeatDetailViewDao;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;

public class BmDateHandler implements CommandHandler {
	private final String FORM_VIEW = "/WEB-INF/biz/bmFront.jsp";

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {
			
			return FORM_VIEW;
		} else if (req.getMethod().equalsIgnoreCase("post")) {
			String bm = req.getParameter("bm");
			String sdate = req.getParameter("sdate");
			String edate = req.getParameter("edate");
			String[] sdArr = sdate.split("-");
			String[] edArr = edate.split("-");
			int sy = Integer.parseInt(sdArr[0]);
			int ey = Integer.parseInt(edArr[0]);
			int sm = Integer.parseInt(sdArr[1]);
			int em = Integer.parseInt(edArr[1]);
			int sd = Integer.parseInt(sdArr[2]);
			int ed = Integer.parseInt(sdArr[2]);
			SqlSession session = null;
			try {
				session = MySqlSessionFactory.openSession();
				// bmDate 시작
				SeatDetailViewDao seatDetailViewDao = session.getMapper(SeatDetailViewDao.class);				
				switch (bm) {
				case "year":					
					sdate = sy+"-01-01";
					edate = ey+"-12-31";
					break;
				case "month":
					sdate = sy+"-"+sm;
					edate = ey+"-"+(em+1);
					break;				
				case "day":
					sdate = sy+"-"+sm+"-"+sd;
					edate = ey+"-"+em+"-"+ed;
					break;
				}
				
				List<SeatDetailView> seatDetailView = seatDetailViewDao.selectListByDate(sdate, edate);
				List<SeatDetailView> sdvResultforYear = new ArrayList<>();
				Date checkDate = null;
				int sumPrice = 0;
				int countTicket = 0;
				int index = 0;
				//SeatDetailView(no, grade, price, maxSeat, soldSeat, dno, day, stime, etime, fno, place, sday, eday)
				//bmYear용 foreach				
				for (SeatDetailView sdv : seatDetailView) {
					sumPrice += sdv.getPrice();
					countTicket++;
					
					if (sdv.getDay().getYear() != checkDate.getYear() && checkDate != null) {
						//index 증가
						index++;						
						//초기화 구문	
						sumPrice = sdv.getPrice();
						countTicket = 1;					
					}else if (checkDate != null) {
						//list에 삽입				
						sdvResultforYear.set(index, 
								new SeatDetailView(sdv.getNo(), sdv.getGrade(), sumPrice, sdv.getMaxSeat(), countTicket, sdv.getDno(), sdv.getDay(),
										sdv.getStime(), sdv.getEtime(), sdv.getFno(), sdv.getPlace(), sdv.getSday(), sdv.getEday())
								);						
					}					
				}
				req.setAttribute("bmYear", sdvResultforYear);
				//bmYear 끝
				//bmMonth 시작
				List<SeatDetailView> sdvResultforMonth = new ArrayList<>();
				checkDate = null;
				sumPrice = 0;
				countTicket = 0;
				index = 0;
				for (SeatDetailView sdv : seatDetailView) {
					sumPrice += sdv.getPrice();
					countTicket++;
					if (sdv.getDay().getYear() != checkDate.getYear()){
						if (sdv.getDay().getMonth() != checkDate.getMonth() && checkDate != null) {
							//index 증가
							index++;						
							//초기화 구문	
							sumPrice = sdv.getPrice();
							countTicket = 1;					
						}else if (checkDate != null) {
							//list에 삽입				
							sdvResultforMonth.set(index, 
									new SeatDetailView(sdv.getNo(), sdv.getGrade(), sumPrice, sdv.getMaxSeat(), countTicket, sdv.getDno(), sdv.getDay(),
											sdv.getStime(), sdv.getEtime(), sdv.getFno(), sdv.getPlace(), sdv.getSday(), sdv.getEday())
									);						
						}					
					}else if (checkDate != null) {
						
						
						
					}
				}
				
				
			} finally {
				session.close();
			}
			return "/WEB-INF/view/bmDate.html";

		}
		return null;
	}

}
