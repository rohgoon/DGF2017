package days.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import days.model.Days;
import days.model.DaysDao;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;

public class SelectListByDnoHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		SqlSession sqlSession = MySqlSessionFactory.openSession();
		
		try {
			DaysDao dao = sqlSession.getMapper(DaysDao.class);
			int dno = Integer.parseInt(req.getParameter("dno"));
			Days days = dao.selectListByDno(dno);
			
			req.setAttribute("selectedDays", days);
		} finally {
			// TODO: handle finally clause
		}
		
		return "WEB-INF/view/daysSelected.jsp";
	}

}
