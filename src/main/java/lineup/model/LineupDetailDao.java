package lineup.model;

import java.sql.SQLException;
import java.util.List;

public interface LineupDetailDao {
	public List<LineupDetail> selectList() throws SQLException;
}
