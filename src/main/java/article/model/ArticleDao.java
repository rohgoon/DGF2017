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
	
	public void updateArticleByNo(int articleNo) throws SQLException;
	
	@Update("update article set del = 1 where board_no = #{param1} && article_no = #{param2}")
	public void deleteArticleByNo(int boardNo, int articleNo) throws SQLException;
	
	@Insert("insert into article(board_no, uno, title, content, category, write_time, attached_file) values(#{boardNo}, #{uno}, #{title}, #{content}, #{category}, #{writeTime}, #{attachedFile})")
	public void insertArticle(Article article) throws SQLException;
}
