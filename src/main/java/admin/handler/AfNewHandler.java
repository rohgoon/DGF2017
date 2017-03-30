package admin.handler;

import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import festival.model.Days;
import festival.model.DaysDao;
import festival.model.Festival;
import festival.model.FestivalDao;
import festival.model.Seat;
import festival.model.SeatDao;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;

public class AfNewHandler implements CommandHandler {
	static String place =null;
	static List<String> gradeList;
	static List<String> priceList;
	static List<String> ticketList;
	static String sdate;
	static String edate;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	static List<Date> fesTypeDate;
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {
			
			return "/WEB-INF/admin/afNewForm.jsp";
		} else if (req.getMethod().equalsIgnoreCase("post")) {
			int no = Integer.parseInt(req.getParameter("no"));			
			switch (no) {
			case 1:		
				nullPoint();
				return null;
			case 2:
				nullPoint();
				
				place = req.getParameter("place");									
				String[] grade = req.getParameterValues("grade");
				String[] price = req.getParameterValues("price");
				String[] ticket = req.getParameterValues("ticket");
				System.out.println("체크>>>>>>>"+grade[0]);
				gradeList =new ArrayList<>();
				priceList =new ArrayList<>();
				ticketList =new ArrayList<>();
				for (String s : grade) {
					gradeList.add(s);
				}
				for (String s : price) {
					priceList.add(s);
				}
				for (String s : ticket) {
					ticketList.add(s);
				}						
				//여기까지 step3으로 바로 전송
				
				//행사 기간 처리
				sdate = req.getParameter("sdate");
				edate = req.getParameter("edate");

				String[] sdArr = sdate.split("-");
				int[] sdIntArr = new int[3];					
				for (int i = 0; i < sdArr.length; i++) {
					sdIntArr[i] = Integer.parseInt(sdArr[i]);
				}
				String[] edArr = edate.split("-");
				int[] edIntArr = new int[3];
				for (int i = 0; i < edArr.length; i++) {
					edIntArr[i] = Integer.parseInt(edArr[i]);
				}
				//Date 클래스로 변환 System.out.println(sd.toLocaleString());
				Calendar calendar = Calendar.getInstance();
				calendar.set(sdIntArr[0], (sdIntArr[1]-1), sdIntArr[2]);
				Date sd = new Date(calendar.getTimeInMillis());
				calendar.set(edIntArr[0], (edIntArr[1]-1), edIntArr[2]);				
				Date ed = new Date(calendar.getTimeInMillis());
				long diff= ed.getTime() - sd.getTime();
				int gapDate = (int)(diff/ (1000 * 60 * 60 * 24));
				//Date 타입 List에 삽입
				
				fesTypeDate = new ArrayList<>();
				fesTypeDate.add(sd);
				System.out.println(sd.toLocaleString());
				if (gapDate >1) {
					for (int i = 1; i < gapDate; i++) {
						
						Date newDate = new Date(sd.getTime()+((1000 * 60 * 60 * 24)*i));
						fesTypeDate.add(newDate); 
						
					}
				}
				fesTypeDate.add(ed);
				String[] fesDate = new String[fesTypeDate.size()];
				
				int i =0;
				for (Date date : fesTypeDate) {
					fesDate[i] = sdf.format(date);					
					i++;
				}
				req.setAttribute("fesDate", fesDate);
				
				
				return "/WEB-INF/admin/afNewForm2.jsp";
			case 3://최종 정보 한꺼번에 삽입				
				SqlSession session = null;	
				//System.out.println("테스트 "+sdate);
				try{
					session = MySqlSessionFactory.openSession();
					FestivalDao festivalDao = session.getMapper(FestivalDao.class);
					Festival festival = new Festival();
					
					festival.setSday(sdf.parse(sdate));
					festival.setEday(sdf.parse(edate));
					festival.setPlace(place);					
					festivalDao.insert(festival);
					session.commit();
					int fno = festivalDao.selectFnoByLast(festival);
					
					
					//개별 일자 정보 입력
					String[] stimeArr = req.getParameterValues("stime");
					String[] etimeArr = req.getParameterValues("etime");
					List<Time> stimeList = new ArrayList<>();
					List<Time> etimeList = new ArrayList<>();
					for (int j = 0; j < stimeArr.length; j++) {
						String[] stime = stimeArr[j].split(":");
						String[] etime = etimeArr[j].split(":");
						stimeList.add(new Time(Integer.parseInt(stime[0]), Integer.parseInt(stime[1]),0));
						etimeList.add(new Time(Integer.parseInt(etime[0]), Integer.parseInt(etime[1]),0));
					}
					
					DaysDao daysDao = session.getMapper(DaysDao.class);
					List<Days> daysList = new ArrayList<>();
					for (int j = 0; j < fesTypeDate.size(); j++) {
						daysList.add(
								new Days(fno, fesTypeDate.get(j), stimeList.get(j), etimeList.get(j))
								);
					}
					for (Days days : daysList) {
						daysDao.insert(days);
					}
					List<Days> dListForSeats = daysDao.selectListByFno(fno);//
					session.commit();	
					req.setAttribute("fno", fno);
					//seat에도 삽입
					SeatDao seatDao = session.getMapper(SeatDao.class);
					List<Seat> seatsList = new ArrayList<>();
					for (Days d : dListForSeats) {
						for (int j = 0; j < gradeList.size(); j++) {
							seatDao.insert(new Seat(
									d.getDno(), gradeList.get(j),
									Integer.parseInt(priceList.get(j)),
									Integer.parseInt(ticketList.get(j)),
									0));
						};
					};
					session.commit();	
					
					
				}finally {
					session.close();
				
				}	
				return "/WEB-INF/admin/afNewForm.jsp";
				
			default:
				
				return "/WEB-INF/admin/afNewForm.jsp";
			}

			
		}
		return null;
	
	}
	private void nullPoint(){
		place =null;
		gradeList = null;
		priceList =null;
		ticketList =null;
		sdate = null;
		edate = null;
		fesTypeDate = null;
	}

}
