package reply.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;
import reply.model.ReplyDao;

public class DeleteReplyHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		SqlSession session = null;
		
		int boardNo = Integer.parseInt(req.getParameter("boardNo"));
		int articleNo = Integer.parseInt(req.getParameter("articleNo"));
		int replyNo = Integer.parseInt(req.getParameter("replyNo"));
		
		try{
			session = MySqlSessionFactory.openSession();
			ReplyDao dao = session.getMapper(ReplyDao.class);
			dao.updateDelReplyByBoardNoAndArticleNoAndReplyNo(boardNo, articleNo, replyNo);
			session.commit();
		}finally{
			session.close();
		}
		return "readReply.do?boardNo="+ boardNo +"&articleNo=" + articleNo;
	}

}