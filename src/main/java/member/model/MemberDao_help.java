package member.model;

public class MemberDao_help {
	/*private static MemberDao_help instance = new MemberDao_help();

	public static MemberDao_help getInstance() {
		return instance;
	}
	
	public void insert(Connection conn, Member mem) throws SQLException{
		PreparedStatement pstmt = null;
		try {
			String sql ="insert into member values(?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem.getId());
			pstmt.setString(2, mem.getName());
			pstmt.setString(3, mem.getPassword());
			pstmt.setTimestamp(4, new Timestamp(mem.getRegDate().getTime()));
			pstmt.executeUpdate();
		}finally {
			JdbcUtil.close(pstmt);
		}
	}
	public Member selectAllById(Connection conn, String id) throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql ="select * from member where memberid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			Member member = null;
			if (rs.next()) {
				member = new Member(rs.getString("memberid"), 
					rs.getString("name"), rs.getString("password"),
					rs.getTimestamp("regDate"));
			}
			return member;
			
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
			
		}
	}

	public List<Member> selectList(Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try{
			pstmt = conn.prepareStatement("select * from member order by regdate desc");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				List<Member> memberList = new ArrayList<>();
				do {
					Member mem = new Member(rs.getString("memberid"), 
							rs.getString("name"), rs.getString("password"),
							rs.getTimestamp("regdate"));
					memberList.add(mem);
				} while (rs.next());
				return memberList;
			}else {
				return Collections.emptyList();
			}
		}finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	public void updatePwdById(Connection conn, String newPwd, String password) throws SQLException{
		PreparedStatement pstmt = null;
		try {
			String sql ="update member set password = ? where password = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, newPwd);
			pstmt.setString(2, password);
			pstmt.executeUpdate();
		}finally {
			JdbcUtil.close(pstmt);
		}
	}*/
	
}
