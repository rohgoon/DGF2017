package reply.model;

import java.sql.SQLException;

import org.apache.ibatis.annotations.Insert;

public interface ReplyDao {

	@Insert("INSERT INTO dgf.reply(board_no, article_no, uno, content, parent, indent, write_time) VALUES(#{boardNo}, #{articleNo}, #{uno}, #{content}, #{parent}, #{indent}, #{writeTime})")
	public void insertReplyByBoardNoAndArticleNo(Reply reply) throws SQLException; 
	
	
	
	
}
