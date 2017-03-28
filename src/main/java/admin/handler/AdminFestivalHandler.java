package admin.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import festival.model.FestivalDao;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;

public class AdminFestivalHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {	
			SqlSession session = null;
			try {
				session = MySqlSessionFactory.openSession();
				FestivalDao festivalDao = session.getMapper(FestivalDao.class);
				int fno = festivalDao.selectMaxFno();
				int fCount = festivalDao.selectCountAll();
				req.setAttribute("fno", fno);
				req.setAttribute("fCount", fCount);
				
				
				
			}catch (Exception e) {
				
				e.printStackTrace();
			} finally {
				session.close();
			}
			return "/WEB-INF/admin/adminFestivalForm.jsp";
		}else if (req.getMethod().equalsIgnoreCase("post")) {
			
			return "/WEB-INF/admin/adminFestivalSuccess.jsp";
		}
		return null;
	}

}
