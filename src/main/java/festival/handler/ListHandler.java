package festival.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import festival.model.Festival;
import festival.model.FestivalDao;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;

public class ListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		SqlSession sqlSession = MySqlSessionFactory.openSession();
		
		try {
			FestivalDao dao = sqlSession.getMapper(FestivalDao.class);
			List<Festival> list = dao.selectList();
			req.setAttribute("viewList", list);
		} finally {
			// TODO: handle finally clause
		}
		
		return "/WEB-INF/view/festivalList.jsp";
	}

}
