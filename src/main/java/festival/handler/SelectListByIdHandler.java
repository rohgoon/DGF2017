package festival.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import festival.model.Festival;
import festival.model.FestivalDao;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;

public class SelectListByIdHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		SqlSession sqlSession = MySqlSessionFactory.openSession();
		
		try {
			FestivalDao dao = sqlSession.getMapper(FestivalDao.class);
			int fno = Integer.parseInt(req.getParameter("fno"));
			Festival festival = dao.selectListById(fno);
			
			req.setAttribute("selectedFestival", festival);			
		} finally {
			// TODO: handle finally clause
		}
		return "WEB-INF/view/festivalSelected.jsp";
	}

}
