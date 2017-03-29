package article.model;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import member.model.User;

public interface ArticleDao {

	@Select("select a.*, u.id, u.uname from article a, user u where a.uno = u.uno && a.del = 0 && a.article_no = #{param1} && a.board_no = #{param2}")
	public Article selectArticleByNo(int articleNo, int boardNo) throws SQLException;
	
	@Update("update aritlce set content = #{content}, write_time = #{writeTime}, category = #{category}, title = #{title} where board_no = #{boardNo} && article_no = #{articleNo}")	
	public void updateArticleByNo(Article article) throws SQLException;
	
	@Update("update article set del = 1 where board_no = #{param1} && article_no = #{param2}")
	public void deleteArticleByNo(int boardNo, int articleNo) throws SQLException;
	
	@Insert("insert into article(board_no, uno, title, content, category, write_time, attached_file) values(#{boardNo}, #{uno}, #{title}, #{content}, #{category}, #{writeTime}, #{attachedFile})")
	public void insertArticle(Article article) throws SQLException;
	
	@Update("update article set hits = hits + 1  where board_no = #{param1} && article_no = #{param2}")
	public void updateArticleHits(int boardNo, int articleNo) throws SQLException;
	
	@Insert("INSERT INTO dgf.articleRecList(board_no, article_no, uno) VALUES(#{param1}, #{param2}, #{param3})")
	public void insertArticleRec(int boardNo, int articleNo, int uno) throws SQLException; 
	
	@Select("select count(uno) from articleRecList where board_no = #{param1} && article_no =#{param2}")
	public int selectReplyRecCount(int boardNo, int articleNo) throws SQLException;
}
