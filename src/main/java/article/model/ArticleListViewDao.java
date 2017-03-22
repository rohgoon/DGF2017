package article.model;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface ArticleListViewDao {

	@Select("select * from article_list_view where board_no = #{boardNo} ORDER by article_no desc")	
	public List<ArticleListView> selectArticleListByBoardNoSortByArticleNoDesc(int boardNo) throws SQLException;
	
	@Select("select * from article_list_view where board_no = #{param1} ORDER by article_no desc limit #{param2}, #{param3}")	
	public List<ArticleListView> selectArticleListByPage(int boardNo, int startRow, int rowNum) throws SQLException;

	@Select("select count(article_no) from article_list_view where board_no = #{boardNo} order by article_no desc")
	public int selectCountArticleListByBoarNo(int boardNo) throws SQLException;
	
	@Select("select count(article_no) from article_list_view where board_no = #{boardNo} ORDER by article_no desc")
	public int selectArticleCountByBoardNo(int boardNo) throws SQLException;
	
	@Select("select * from article_list_view where category = #{param1} ORDER by article_no desc limit #{param2}, #{param3}")
	public List<ArticleListView> selectArticleListByCategory(String category, int startRow, int rowNum) throws SQLException;
	
}
