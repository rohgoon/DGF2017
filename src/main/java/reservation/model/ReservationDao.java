package reservation.model;

import java.sql.SQLException;
import java.util.List;

public interface ReservationDao {
	public void insert(Reservation reservation) throws SQLException;
	public List<Reservation> selectAllbyUno(int uno) throws SQLException;
	public List<Reservation> selectList() throws SQLException;
	public void updateSnoAndRtimeByRno(Reservation reservation) throws SQLException;
	public void delectByRno(int rno) throws SQLException;
	
}
