package lineup.handler;

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

public class RegisterStepHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {

		if (req.getMethod().equalsIgnoreCase("get")) {
			int step = Integer.parseInt(req.getParameter("step"));
			SqlSession session = null;
			switch (step) {
			case 1:
				try {
					session = MySqlSessionFactory.openSession();
					FestivalDao festivalDao = session.getMapper(FestivalDao.class);
					Date now = new Date();
					now.setHours(0);
					now.setMinutes(0);
					now.setSeconds(0);
					List<Festival> festivals = festivalDao.selectListBiggerThanNow(now);

					DaysDao daysDao = session.getMapper(DaysDao.class);
					List<Days> days = daysDao.selectListAfterFno(festivals.get(0).getFno());

					req.setAttribute("days", days);

				} catch (Exception e) {

					e.printStackTrace();
				} finally {
					session.close();
				}

				return "/WEB-INF/view/lineupRegisterStep.jsp";
				
			case 2:
				int dno = Integer.parseInt(req.getParameter("dno"));
				req.setAttribute("dno", dno);
				return "registerUpload.do";
			}
			
			
		}
		return null;
	}

}
