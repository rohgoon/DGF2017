package member.model;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Select;

public interface MemberDao {
	public void insert(User mem) throws SQLException;
	public User selectAllById(String id) throws SQLException;
	public User selectAllByUno(int uno) throws SQLException;
	public List<User> selectList() throws SQLException;
	public void updatePwdById(String newPwd, String password) throws SQLException;
	public void updateInfoById(User user) throws SQLException;
	public void deleteUserbyUno(int uno) throws SQLException;	
	@Select("select id from user where id = #{id}")
	public String selectId(String id) throws SQLException;
}
