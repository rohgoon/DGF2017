package reservation.model;

import java.sql.SQLException;
import java.util.List;

public interface ReservationDao {
	public void insert(Reservation reservation) throws SQLException;
	public Reservation selectAllbyUno(int uno) throws SQLException;
	public List<Reservation> selectList() throws SQLException;
	public void updateSnoByUnoAndRno(int uno, int rno) throws SQLException;
}
