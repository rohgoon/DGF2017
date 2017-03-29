package reply.model;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface ReplyDao {

		
	@Select("select r.*, u.uname, u.id from reply r, user u where r.uno = u.uno && r.delete = 0 && r.board_no = #{param1} && r.article_no = #{param2} order by r.reply_no desc")
	public List<Reply> selectReplyByBoardNoAndArticleNo(int boardNo, int articleNo) throws SQLException;
	
	@Insert("INSERT INTO dgf.reply(board_no, article_no, uno, content, parent, indent, write_time) VALUES(#{boardNo}, #{articleNo}, #{uno}, #{content}, #{parent}, #{indent}, #{writeTime})")
	public void insertReplyByBoardNoAndArticleNo(Reply reply) throws SQLException; 

	@Update("update reply set `delete` = 1 where board_no = #{param1} && article_no = #{param2} && reply_no = #{param3}")
	public void updateDelReplyByBoardNoAndArticleNoAndReplyNo(int boardNo, int articleNo, int replyNo) throws SQLException;
	
	@Update("update reply set content=#{content}, write_time=#{writeTime} where board_no = #{boardNo} && article_no = #{articleNo} && reply_no = #{replyNo}")
	public void updateReply(Reply reply) throws SQLException;
	
	@Insert("INSERT INTO replyRecList(board_no, article_no, reply_no, uno) VALUES(#{param1}, #{param2}, #{param3}, #{param4})")
	public void insertReplyRec(int boardNo, int articleNo, int replyNo, int uno) throws SQLException; 
	
	@Select("select count(uno) from replyRecList where board_no = #{param1} && article_no =#{param2} && reply_no = #{param3}")
	public int selectReplyRecCount(int boardNo, int articleNo, int replyNo) throws SQLException;
	
	
}
