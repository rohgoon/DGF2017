package biz.model;

import java.sql.SQLException;
import java.util.List;

public interface BmDayViewDao {
	public List<BmDayView> selectListAll() throws SQLException;
	public List<BmDayView> selectListByYmdDate(String symd, String eymd) throws SQLException;
	
}
