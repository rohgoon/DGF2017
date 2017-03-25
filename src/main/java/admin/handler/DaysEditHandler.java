package admin.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import festival.model.Days;
import festival.model.DaysDao;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;

public class DaysEditHandler implements CommandHandler {
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {
			int dno = Integer.parseInt(req.getParameter("dno"));
			SqlSession session = null;
			try {
				session = MySqlSessionFactory.openSession();
				DaysDao daysDao = session.getMapper(DaysDao.class);
				Days days = daysDao.selectByDno(dno);
				req.setAttribute("days", days);
				

			} finally {
				session.close();
			}
			
			return "/WEB-INF/admin/afInfoDays.jsp";
		}else if (req.getMethod().equalsIgnoreCase("post")) {
			
			
			//fno 바로 넘겨주는지 확인
			return "afInfo.do";
		}
		return null;
	}

}
