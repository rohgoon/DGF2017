package board.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import board.model.Board;
import board.model.BoardDao;
import festival.model.Festival;
import festival.model.FestivalDao;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;

public class CommunityHandler implements CommandHandler {
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		SqlSession session = null;
		try {
			session = MySqlSessionFactory.openSession();
			BoardDao dao = session.getMapper(BoardDao.class);
			List<Board> boardList = dao.selectAllBoardList();
			req.setAttribute("boardList", boardList);
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return "/WEB-INF/view/community/community.jsp";
	}
}
