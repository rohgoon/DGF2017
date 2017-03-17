package board.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import board.model.BoardDao;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;

public class DeleteBoardHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		int boardNo = Integer.parseInt(req.getParameter("boardNo"));
		
		SqlSession session = null;
		try {
			session = MySqlSessionFactory.openSession();
			BoardDao dao = session.getMapper(BoardDao.class);
			dao.deleteBoardByNo(boardNo);
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		
		return "readBoardList.do";
	}

}
