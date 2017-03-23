package reply.handler;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;
import reply.model.Reply;
import reply.model.ReplyDao;

public class CreateReplyHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		SqlSession session = null;
		
		try{
			session = MySqlSessionFactory.openSession();
			ReplyDao dao = session.getMapper(ReplyDao.class);
			Reply reply = new Reply();
			reply.setArticleNo(Integer.parseInt(req.getParameter("articleNo")));
			reply.setBoardNo(Integer.parseInt(req.getParameter("boardNo")));
			reply.setContent(req.getParameter("content"));
			reply.setUno(Integer.parseInt(req.getParameter("uno")));
			reply.setParent(Integer.parseInt(req.getParameter("parent")));
			reply.setIndent(Integer.parseInt(req.getParameter("indent")));
			reply.setWriteTime(new Date());
			dao.insertReplyByBoardNoAndArticleNo(reply);
			session.commit();
		}finally{
			session.close();
		}
		
		return "article.do";
	}

}
