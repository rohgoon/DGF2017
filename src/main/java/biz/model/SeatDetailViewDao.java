package biz.model;

import java.sql.SQLException;
import java.util.List;

public interface SeatDetailViewDao {
	public List<SeatDetailView> selectAllByFno(int fno) throws SQLException;
	public SeatDetailView selectAllBySno(int no) throws SQLException;
	public SeatDetailView selectByFnoAndGrade(SeatDetailView seatDetailView) throws SQLException;
	public List<SeatDetailView> selectListByDate(String sdate, String edate) throws SQLException;
}
