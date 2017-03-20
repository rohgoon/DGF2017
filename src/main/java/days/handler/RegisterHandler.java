package days.handler;

import java.sql.Time;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import days.model.Days;
import days.model.DaysDao;
import festival.model.FestivalDao;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;

public class RegisterHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		if (req.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/daysRegister.jsp";
		} else if(req.getMethod().equalsIgnoreCase("post")){
			/*int dno = Integer.parseInt(req.getParameter("dno"));*/
			int fno = Integer.parseInt(req.getParameter("fno"));
			Date day = sdf.parse(req.getParameter("day"));
			
			String sTimeString = req.getParameter("stime");
			String[] sTimeArr = sTimeString.split(":");
			String eTimeString = req.getParameter("etime");
			String[] eTimeArr = eTimeString.split(":");
			
			Time stime = new Time(Integer.parseInt(sTimeArr[0]), Integer.parseInt(sTimeArr[1]), Integer.parseInt(sTimeArr[2])); 
			Time etime = new Time(Integer.parseInt(eTimeArr[0]), Integer.parseInt(eTimeArr[1]), Integer.parseInt(eTimeArr[2]));
			
			Days days = new Days(fno, day, stime, etime);
			SqlSession session = null;
			
			try {
				session = MySqlSessionFactory.openSession();
				DaysDao dao = session.getMapper(DaysDao.class);
				dao.insert(days);
				session.commit();
				
			} catch (Exception e) {
				session.rollback();
				e.printStackTrace();
			} finally {
				session.close();
			}
			return "daysList.do";
		}
		return null;
	}

}
