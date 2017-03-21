package biz.model;

import java.sql.SQLException;
import java.util.List;

public interface BmDayViewDao {
	public List<BmDayView> selectListAll() throws SQLException;
	public List<BmDayView> selectListByYear(int sy, int sm, int sd, int ey, int em, int ed) throws SQLException;
	
}
