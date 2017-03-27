package board.handler;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import board.model.BoardDao;
import member.model.MemberDao;
import member.model.User;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;

public class CreateBoardHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if(req.getMethod().equalsIgnoreCase("get")){
			return "/WEB-INF/view/board/createform.jsp";
		}else if(req.getMethod().equalsIgnoreCase("post")){
			String boardName = req.getParameter("boardName");
			SqlSession session = null;
				try {
					session = MySqlSessionFactory.openSession();
					BoardDao dao = session.getMapper(BoardDao.class);
					dao.createBoard(boardName);
					session.commit();
				} catch (Exception e) {
					session.rollback();
					e.printStackTrace();
				} finally {
					session.close();
				}
				return "readBoardList.do";
		}
		return null;
	}//method
}//class
