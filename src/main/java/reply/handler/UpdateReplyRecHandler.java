package reply.handler;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import article.model.Article;
import article.model.ArticleDao;
import member.model.User;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;
import reply.model.ReplyDao;

public class UpdateReplyRecHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		int boardNo = Integer.parseInt(req.getParameter("boardNo"));
		int articleNo = Integer.parseInt(req.getParameter("articleNo"));
		int replyNo = Integer.parseInt(req.getParameter("replyNo"));
		int uno = Integer.parseInt(req.getParameter("uno"));
		SqlSession session = null;
		
		try {
			session = MySqlSessionFactory.openSession();
			ReplyDao dao = session.getMapper(ReplyDao.class);
			dao.insertReplyRec(boardNo, articleNo, replyNo, uno);
			session.commit();
		} catch (Exception e) {
			return "error";
		} finally {
			session.rollback();
			session.close();
		}
		return null;
	}

}
