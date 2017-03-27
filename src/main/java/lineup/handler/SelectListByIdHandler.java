package lineup.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import lineup.model.Lineup;
import lineup.model.LineupDao;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;

public class SelectListByIdHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		SqlSession sqlSession = MySqlSessionFactory.openSession();
		
		try {
			LineupDao dao = sqlSession.getMapper(LineupDao.class);
			int lno = Integer.parseInt(req.getParameter("lno"));
			Lineup lineup = dao.selectListById(lno);
			
			req.setAttribute("selectedLineup", lineup);
		} finally {
			// TODO: handle finally clause
		}
		
		return "WEB-INF/view/lineupSelected.jsp";
	}

}
