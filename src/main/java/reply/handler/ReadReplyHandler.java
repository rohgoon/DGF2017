package reply.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;
import reply.model.Reply;
import reply.model.ReplyDao;

public class ReadReplyHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		SqlSession session = null;
		
		int boardNo = Integer.parseInt(req.getParameter("boardNo"));
		int articleNo = Integer.parseInt(req.getParameter("articleNo"));
		
		try{
			session = MySqlSessionFactory.openSession();
			ReplyDao dao = session.getMapper(ReplyDao.class);
			List<Reply> replys = dao.selectReplyByBoardNoAndArticleNo(boardNo, articleNo);
			req.setAttribute("replys", replys);
			
		}finally {
			session.close();
		}
		
		// TODO Auto-generated method stub
		return null;
	}

}
