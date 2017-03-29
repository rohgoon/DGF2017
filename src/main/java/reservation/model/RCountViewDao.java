package reservation.model;

import java.sql.SQLException;
import java.util.List;

public interface RCountViewDao {
	public List<RCountView> selectListByUno(int uno) throws SQLException;
	
}
