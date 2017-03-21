package biz.model;

import java.sql.SQLException;
import java.util.List;

public interface BmMonthViewDao {
	public List<BmYearView> selectListAll() throws SQLException;
	public List<BmYearView> selectListByYear(int year, int month) throws SQLException;
	
}
