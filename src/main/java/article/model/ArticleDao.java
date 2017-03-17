package article.model;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import member.model.User;

public interface ArticleDao {

	@Select("select a.article_no, u.id, a.title, a.category, a.write_time, a.hits, a.recommend, a.attached_file from article as a, `user` as u where a.uno=u.uno && a.del = 0 ORDER by article_no DESC")
	public List<Article> selectArticleList() throws SQLException;
	
	@Select("select a.article_no, u.id, a.title, a.category, a.write_time, a.hits, a.recommend, a.attached_file, a.content from article as a, `user` as u where a.uno=u.uno && a.del = 0 && a.article_no = #{param1} && a.board_no = #{param2}")
	public Article selectArticleByNo(int articleNo, int boardNo) throws SQLException;
	
	
	@Select("select a.article_no, u.id, a.title, a.category, a.write_time, a.hits, a.recommend, a.attached_file from article as a, `user` as u where a.uno=u.uno && a.del = 0  ORDER by article_no DESC")
	public List<Article> selectArticleListByPage(int page) throws SQLException;
	@Select("select a.article_no, u.id, a.title, a.category, a.write_time, a.hits, a.recommend, a.attached_file from article as a, `user` as u where a.uno=u.uno && a.del = 0  ORDER by write_time DESC")
	public List<Article> selectArticleListByDate(Date date) throws SQLException;
	@Select("select a.article_no, u.id, a.title, a.category, a.write_time, a.hits, a.recommend, a.attached_file from article as a, `user` as u where a.uno=u.uno && a.del = 0  ORDER by hits")
	public List<Article> selectArticleListByHits(int hits) throws SQLException;
	@Select("select a.article_no, u.id, a.title, a.category, a.write_time, a.hits, a.recommend, a.attached_file from article as a, `user` as u where a.uno=u.uno && a.del = 0  ORDER by recommend")
	public List<Article> selectArticleListByRecommend(int recommends) throws SQLException;
	@Select("select count~~")
	public List<Article> selectArticleListByReplyCount(int counts) throws SQLException;
	
	
	
	public void updateArticleByNo(int articleNo) throws SQLException;
	public void deleteArticleByNo(int articleNO) throws SQLException;
	
	
	@Insert("insert into article(board_no, uno, title, content, category, write_time, attached_file) values(#{boardNo}, #{uno}, #{title}, #{content}, #{category}, #{writeTime}, #{attachedFile})")
	public void insertArticle(Article article) throws SQLException;
}
