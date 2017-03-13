package member.model;

import java.sql.SQLException;
import java.util.List;

public interface MemberDao {
	public void insert(Member mem) throws SQLException;
	public Member selectAllById(String id) throws SQLException;
	public List<Member> selectList() throws SQLException;
	public void updatePwdById(String newPwd, String password) throws SQLException;
}
