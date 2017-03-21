package article.model;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import member.model.User;

public interface ArticleDao {

	@Select("select a.article_no, u.id, a.title, a.category, a.write_time, a.hits, a.recommend, a.attached_file, a.content from article as a, `user` as u where a.uno=u.uno && a.del = 0 && a.article_no = #{param1} && a.board_no = #{param2}")
	public Article selectArticleByNo(int articleNo, int boardNo) throws SQLException;
	
	public void updateArticleByNo(int articleNo) throws SQLException;
	public void deleteArticleByNo(int articleNO) throws SQLException;
	
	
	@Insert("insert into article(board_no, uno, title, content, category, write_time, attached_file) values(#{boardNo}, #{uno}, #{title}, #{content}, #{category}, #{writeTime}, #{attachedFile})")
	public void insertArticle(Article article) throws SQLException;
}
