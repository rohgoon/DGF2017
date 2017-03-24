package admin.handler;

import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import festival.model.Days;
import festival.model.DaysDao;
import festival.model.Festival;
import festival.model.FestivalDao;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;

public class afNewHandler implements CommandHandler {
	String place =null;
	List<String> gradeList;
	List<String> priceList;
	List<String> ticketList;
	String sdate;
	String edate;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	List<Date> fesTypeDate;
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/admin/afNewForm.jsp";
		} else if (req.getMethod().equalsIgnoreCase("post")) {
			int no = Integer.parseInt(req.getParameter("no"));			
			switch (no) {
			case 1:				
				return "/WEB-INF/admin/afNewForm.jsp";
			case 2:
				place = req.getParameter("place");				
								
				String[] grade = req.getParameterValues("grade");
				String[] price = req.getParameterValues("price");
				String[] ticket = req.getParameterValues("ticket");
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
							
				//Date 클래스로 변환
				Date sd = new Date(sdIntArr[0], (sdIntArr[1]-1), sdIntArr[2]);
				Date ed = new Date(edIntArr[0], (edIntArr[1]-1), edIntArr[2]);
				long diff= ed.getTime() - sd.getTime();
				int gapDate = (int)(diff/ (1000 * 60 * 60 * 24));
				//Date 타입 List에 삽입
				fesTypeDate = new ArrayList<>();
				fesTypeDate.add(sd);
				if (gapDate >1) {
					for (int i = 1; i < gapDate; i++) {
						sd.setDate(sd.getDate()+i);
						fesTypeDate.add(sd); //sd가 변화하니 주의
					}//
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
					session.commit();					
				}finally {
					session.close();
				}
				
				return "/WEB-INF/admin/afNewSuccess.jsp";

			default:
				
				return "/WEB-INF/admin/afNewForm.jsp";
			}

			
		}
		return null;
	}

}
