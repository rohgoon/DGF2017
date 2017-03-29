package article.handler;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import article.model.Article;
import article.model.ArticleDao;
import member.model.User;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;

public class UpdateArticleRecHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		int boardNo = Integer.parseInt(req.getParameter("boardNo"));
		int articleNo = Integer.parseInt(req.getParameter("articleNo"));
		int uno = Integer.parseInt(req.getParameter("uno"));
		SqlSession session = null;
		
		try {
			session = MySqlSessionFactory.openSession();
			ArticleDao dao = session.getMapper(ArticleDao.class);
			dao.insertArticleRec(boardNo, articleNo, uno);
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
