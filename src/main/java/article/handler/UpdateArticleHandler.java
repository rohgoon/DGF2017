package article.handler;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import article.model.Article;
import article.model.ArticleDao;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;

public class UpdateArticleHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		int boardNo = Integer.parseInt(req.getParameter("boardNo"));
		int articleNo = Integer.parseInt(req.getParameter("articleNo"));
		String content = req.getParameter("content");
		String category = req.getParameter("category");
		String title = req.getParameter("title");
		
		SqlSession session = null;
		
		try {
			session = MySqlSessionFactory.openSession();
			ArticleDao dao = session.getMapper(ArticleDao.class);
			Article article = new Article();
			article.setWriteTime(new Date());
			article.setBoardNo(boardNo);
			article.setArticleNo(articleNo);
			article.setContent(content);
			article.setCategory(category);
			article.setTitle(title);
			dao.updateArticleByNo(article);
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		return null;
	}

}
