package biz.model;

import java.sql.SQLException;

public interface SeatDetailViewDao {
	public SeatDetailView selectAllByFno(int fno) throws SQLException;
	public SeatDetailView selectAllBySno(int no) throws SQLException;
	public SeatDetailView selectByFnoAndGrade(SeatDetailView seatDetailView) throws SQLException;
}
