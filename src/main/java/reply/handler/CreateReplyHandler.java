package reply.handler;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import member.model.User;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;
import reply.model.Reply;
import reply.model.ReplyDao;

public class CreateReplyHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		SqlSession session = null;
		int boardNo = Integer.parseInt(req.getParameter("boardNo"));
		int articleNo = Integer.parseInt(req.getParameter("articleNo"));
		try{
			session = MySqlSessionFactory.openSession();
			ReplyDao dao = session.getMapper(ReplyDao.class);
			Reply reply = new Reply();
			reply.setArticleNo(articleNo);
			reply.setBoardNo(boardNo);
			reply.setContent(req.getParameter("content"));
			User user = (User)req.getSession().getAttribute("auth");
			reply.setUno(user.getUno());
			reply.setParent(Integer.parseInt(req.getParameter("parent")));
			reply.setIndent(Integer.parseInt(req.getParameter("indent")));
			reply.setWriteTime(new Date());
			dao.insertReplyByBoardNoAndArticleNo(reply);
			session.commit();
		}finally{
			session.close();
		}
		
		return "readReply.do?boardNo="+ boardNo +"&articleNo=" + articleNo;
	}

}
