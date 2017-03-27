package article.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import article.model.ArticleDao;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;

public class DeleteArticleHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		int boardNo = Integer.parseInt(req.getParameter("boardNo"));
		int articleNo = Integer.parseInt(req.getParameter("articleNo"));
		SqlSession session = null;
		
		try {
			session = MySqlSessionFactory.openSession();
			ArticleDao dao = session.getMapper(ArticleDao.class);
			dao.deleteArticleByNo(boardNo, articleNo);
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
