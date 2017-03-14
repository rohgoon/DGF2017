package article.model;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import member.model.User;

public interface ArticleDao {

	public List<Article> selectArticleList() throws SQLException;
	public List<Article> selectArticleListByPage(int page) throws SQLException;
	public List<Article> selectArticleListByDate(Date date) throws SQLException;
	public List<Article> selectArticleListByHits(int hits) throws SQLException;
	public List<Article> selectArticleListByRecommend(int recommends) throws SQLException;
	public List<Article> selectArticleListByReplyCount(int counts) throws SQLException;
	
	public Article selectArticleByNo(int articleNo) throws SQLException;
	
	public void updateArticleByNo(int articleNo) throws SQLException;
	public void deleteArticleByNo(int articleNO) throws SQLException;
	
	public void insertArticle(Article article) throws SQLException;
}
