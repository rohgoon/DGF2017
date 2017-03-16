package reservation.model;

import java.sql.SQLException;
import java.util.List;

public interface ReservationViewDao {
	public List<ReservationView> selectDetailListbyUno(int uno) throws SQLException;
	public ReservationView selectDetailByRno(int rno) throws SQLException;
}
