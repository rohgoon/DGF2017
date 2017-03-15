package reservation.model;

import java.sql.SQLException;
import java.util.List;

public interface ReservationDao {
	public void insert(Reservation reservation) throws SQLException;
	public List<Reservation> selectAllbyUno(int uno) throws SQLException;
	public List<Reservation> selectList() throws SQLException;
	public void updateSnoByRno(Reservation reservation) throws SQLException;
	public List<ReservationView> selectDetailListbyUno(int uno) throws SQLException;
	public ReservationView selectDetailByRno(int rno) throws SQLException;
}
