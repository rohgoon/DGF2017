package festival.model;

import java.sql.SQLException;
import java.util.List;

public interface SeatDao {
	public void insert(Seat seat) throws SQLException;
	public Seat selectBySno(int sno) throws SQLException;
	public Seat selectByDnoAndGrade(Seat seat) throws SQLException;
	public List<Seat> selectListByDno(int dno) throws SQLException;
	public List<Seat> selectListAll() throws SQLException;
	public void updateByDnoAndGrade(Seat seat) throws SQLException;
	public void updateBySno(Seat seat) throws SQLException;
	public Seat selectMaxAndSoldBySno(int sno) throws SQLException;
	public void updateSoldBySno(Seat seat) throws SQLException;
}
