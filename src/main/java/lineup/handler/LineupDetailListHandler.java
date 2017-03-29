package lineup.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import lineup.model.LineupDetail;
import lineup.model.LineupDetailDao;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;

public class LineupDetailListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		SqlSession sqlSession = MySqlSessionFactory.openSession();
		
		try {
			LineupDetailDao dao = sqlSession.getMapper(LineupDetailDao.class);
			List<LineupDetail> list = dao.selectList();
			req.setAttribute("viewList", list);
		} finally {
			// TODO: handle finally clause
		}
		
		return "/WEB-INF/view/festivalList.jsp";
	}

}
