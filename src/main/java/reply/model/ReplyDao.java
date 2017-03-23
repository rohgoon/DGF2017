package reply.model;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

public interface ReplyDao {

	@Insert("INSERT INTO dgf.reply(board_no, article_no, uno, content, parent, indent, write_time) VALUES(#{boardNo}, #{articleNo}, #{uno}, #{content}, #{parent}, #{indent}, #{writeTime})")
	public void insertReplyByBoardNoAndArticleNo(Reply reply) throws SQLException; 
	
	@Select("select r.*, u.uname, u.id from reply r, user u where r.uno = u.uno && r.board_no = #{param1} && r.article_no = #{param2}")
	public List<Reply> selectReplyByBoardNoAndArticleNo(int boardNo, int articleNo) throws SQLException;
	
	
}
