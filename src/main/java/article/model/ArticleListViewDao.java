package article.model;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface ArticleListViewDao {
	
	// 게시판 리스트
	@Select("select * from article_list_view where board_no = #{param1} ORDER by article_no desc limit #{param2}, #{param3}")	
	public List<ArticleListView> selectArticleListByPage(int boardNo, int startRow, int rowNum) throws SQLException;
	
	// 게시물 리스트 카운트
	@Select("select count(article_no) from article_list_view where board_no = #{boardNo} order by article_no desc")
	public int selectCountArticleListByBoardNo(int boardNo) throws SQLException;	
	
	// 카테고리 검색
	@Select("select * from article_list_view where board_no = #{param1} && category = #{param2} ORDER by article_no desc limit #{param3}, #{param4}")
	public List<ArticleListView> selectArticleListByCategory(int boardNo, String category, int startRow, int rowNum) throws SQLException;
	
	// 카테고리 검색 카운트
	@Select("select count(article_no) from article_list_view where board_no = #{param1} && category = #{param2} order by article_no desc")
	public int selectCountArticleListByBoardNoAndCategory(int boardNo, String category) throws SQLException;
	
}
