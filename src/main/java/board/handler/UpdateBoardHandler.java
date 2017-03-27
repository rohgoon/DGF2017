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
		if(req.getMethod().equalsIgnoreCase("get")){
			Board board = null;
			SqlSession session = null;
			try{
				int boardNo = Integer.parseInt(req.getParameter("boardNo"));
				session = MySqlSessionFactory.openSession();
				BoardDao dao = session.getMapper(BoardDao.class);
				board = dao.selectBoardByNo(boardNo);
				req.setAttribute("board", board);
				return "/WEB-INF/view/board/namechange.jsp";
			}finally{
				session.close();
			}
			
		}else if(req.getMethod().equalsIgnoreCase("post")){
			Board board = null;
			SqlSession session = null;
			System.out.println(req.getParameter("boardNo"));
			int boardNo = Integer.parseInt(req.getParameter("boardNo"));
			String boardName = req.getParameter("boardName");
			try{
				session = MySqlSessionFactory.openSession();
				BoardDao dao = session.getMapper(BoardDao.class);
				board = new Board(boardName, boardNo);
				dao.updateBoardByNo(board);
				session.commit();
				return "readBoardList.do";
			}finally{
				session.close();
			}
		}
		return null;
	}

}
