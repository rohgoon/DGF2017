package board.model;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface BoardDao {
	
	public void createBoard(String boardName) throws SQLException;
	public List<Board> selectAllBoardList() throws SQLException;
	
	@Delete("delete from board where board_no = #{boardNo}")
	public void deleteBoardByNo(int no) throws SQLException;
	
	@Select("select * from board where board_no = #{boardNo}")
	public Board selectBoardByNo(int no) throws SQLException;
	
	@Update("update board set board_name=#{boardName} where board_no=#{boardNo}")
	public void updateBoardByNo(Board board) throws SQLException;
	
}
