package intro.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import lineup.model.Lineup;
import lineup.model.LineupDao;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;

public class FrontListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		SqlSession sqlSession = MySqlSessionFactory.openSession();
		
		try {
			LineupDao dao = sqlSession.getMapper(LineupDao.class);
			List<Lineup> list = dao.selectList();
			req.setAttribute("frontList", list);
		} finally {
			// TODO: handle finally clause
		}
		
		return "front.jsp";
	}

}
