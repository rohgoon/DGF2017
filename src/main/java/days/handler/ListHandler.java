package days.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import festival.model.Days;
import festival.model.DaysDao;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;

public class ListHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		SqlSession sqlSession = MySqlSessionFactory.openSession();
		
		try {
			DaysDao dao = sqlSession.getMapper(DaysDao.class);
			List<Days> list = dao.selectList();
			req.setAttribute("viewList", list);
		} catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		
		return "/WEB-INF/view/daysList.jsp";
	}

}
