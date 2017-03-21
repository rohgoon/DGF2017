package biz.handler;

import java.text.SimpleDateFormat;
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
import reservation.model.ReservationView;
import reservation.model.ReservationViewDao;

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
				ReservationViewDao reservationViewDao = session.getMapper(ReservationViewDao.class);
				List<ReservationView> reservationViews = reservationViewDao.selectListByDate(sdate, edate);
				List<SeatDetailView> sdvResultforYear = new ArrayList<>();
				Date checkDate = null;
				int sumPrice = 0;
				int countTicket = 0;
				int index = 0;
				//SeatDetailView(no, grade, price, maxSeat, soldSeat, dno, day, stime, etime, fno, place, sday, eday)
				//bmYear용 foreach				
				for (ReservationView rvv : reservationViews) {
					sumPrice += rvv.getPrice();
					countTicket++;
					
					if (rvv.getDay().getYear() != checkDate.getYear() && checkDate != null) {
						//index 증가
						index++;						
						//초기화 구문	
						sumPrice = rvv.getPrice();
						countTicket = 1;					
					}else if (checkDate != null) {
						//list에 삽입				
						SimpleDateFormat sdf= new SimpleDateFormat("yyyy년");
						String yearString = sdf.format(rvv.getDay());
						sdvResultforYear.set(index, 
								new SeatDetailView(rvv.getRno(), yearString, sumPrice, rvv.getMaxseat(), countTicket, rvv.getDno(), rvv.getDay(),
										rvv.getStime(), rvv.getEtime(), rvv.getFno(), rvv.getPlace(), rvv.getSday(), rvv.getEday())
								);						
					}					
				}
				req.setAttribute("bmYear", sdvResultforYear);
				//SeatDetailView(no, grade, price, maxSeat, soldSeat, dno, day, stime, etime, fno, place, sday, eday)
				//grade에 연도 스트링으로 삽입.
				//price = 총액
				//countTicket = 총판매수
				//bmYear 끝
				
				//bmMonth 시작
				List<SeatDetailView> sdvResultforMonth = new ArrayList<>();
				checkDate = null;
				sumPrice = 0;
				countTicket = 0;
				index = 0;
				for (ReservationView rvv : reservationViews) {
					sumPrice += rvv.getPrice();
					countTicket++;
					
					if (rvv.getDay().getYear() != checkDate.getYear() && checkDate != null) {
						//index 증가
						index++;						
						//초기화 구문	
						sumPrice = rvv.getPrice();
						countTicket = 1;					
					}else if (checkDate != null) {
						//list에 삽입				
						SimpleDateFormat sdf= new SimpleDateFormat("yyyy년");
						String yearString = sdf.format(rvv.getDay());
						sdvResultforYear.set(index, 
								new SeatDetailView(rvv.getRno(), yearString, sumPrice, rvv.getMaxseat(), countTicket, rvv.getDno(), rvv.getDay(),
										rvv.getStime(), rvv.getEtime(), rvv.getFno(), rvv.getPlace(), rvv.getSday(), rvv.getEday())
								);						
					}					
				}
				req.setAttribute("bmMonth", sdvResultforMonth);
				
				
			} finally {
				session.close();
			}
			return "/WEB-INF/view/bmDate.html";

		}
		return null;
	}

}
