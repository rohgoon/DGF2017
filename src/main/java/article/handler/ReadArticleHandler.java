package article.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import article.model.Article;
import article.model.ArticleDao;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;

public class ReadArticleHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		SqlSession session = null;
		int boardNo = Integer.parseInt(req.getParameter("boardNo"));
		int articleNo = Integer.parseInt(req.getParameter("articleNo")); 
		Article article;
		try{
			session = MySqlSessionFactory.openSession();
			ArticleDao dao = session.getMapper(ArticleDao.class);
			
			article = dao.selectArticleByNo(articleNo, boardNo);
			
			req.setAttribute("article", article);
			
		}finally{
			session.close();
		}
		
		return "WEB-INF/view/article/readArticle.jsp";
	}

}
