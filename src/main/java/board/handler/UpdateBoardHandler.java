package board.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import board.model.Board;
import board.model.BoardDao;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;

public class UpdateBoardHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		int boardNo = Integer.parseInt(req.getParameter("boardNo"));
		SqlSession session = null;
		Board board = null;
		try{
			session = MySqlSessionFactory.openSession();
			BoardDao dao = session.getMapper(BoardDao.class);
					
			if(req.getMethod().equalsIgnoreCase("get")){
				board = dao.selectBoardByNo(boardNo);
				req.setAttribute("board", board);
				return "/WEB-INF/view/board/namechange.jsp";
					
			}else if(req.getMethod().equalsIgnoreCase("post")){
				boardNo = Integer.parseInt(req.getParameter("boardNo"));
				String boardName = req.getParameter("boardName");
				board = new Board(boardName, boardNo);
				dao.updateBoardByNo(board);
				return "boardlist.do";
			}
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}

}
