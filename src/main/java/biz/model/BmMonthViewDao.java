package biz.model;

import java.sql.SQLException;
import java.util.List;

public interface BmMonthViewDao {
	public List<BmMonthView> selectListAll() throws SQLException;
	public List<BmMonthView> selectListByYear(String sym, String eym) throws SQLException;
	
}
