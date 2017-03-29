package article.handler;

import java.sql.Timestamp;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

import article.model.Article;
import article.model.ArticleDao;
import member.model.User;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;

public class CreateArticleHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		int boardNo = Integer.parseInt(req.getParameter("boardNo"));
		SqlSession session = null;
		User user = (User)req.getSession().getAttribute("auth");


		if(req.getMethod().equalsIgnoreCase("get")){
			req.setAttribute("uno", user.getUno());
			req.setAttribute("boardNo", Integer.parseInt(req.getParameter("boardNo")));
			return "/WEB-INF/view/article/createArticle.jsp";
			
		}else if(req.getMethod().equalsIgnoreCase("post")){
			try {
				session = MySqlSessionFactory.openSession();
				ArticleDao dao = session.getMapper(ArticleDao.class);
				Article article = new Article();
				article.setBoardNo(boardNo);
				article.setUno(user.getUno());
				article.setTitle(req.getParameter("title"));
				article.setContent(req.getParameter("content"));
				article.setCategory(req.getParameter("category"));
				article.setWriteTime(new Date());
				if (req.getParameter("attachedFile").isEmpty()) {
					dao.insertArticle(article);
					session.commit();
				} else {
					article.setAttachedFile(req.getParameter("attachedFile"));
					dao.insertArticle(article);
					session.commit();
				} 
			} finally {
				session.close();
			}
			return "articleList.do?boardNo="+boardNo;
		}
		return null;
	}

}
