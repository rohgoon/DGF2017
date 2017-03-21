package biz.model;

import java.sql.SQLException;
import java.util.List;

public interface BmDayViewDao {
	public List<BmYearView> selectListAll() throws SQLException;
	public List<BmYearView> selectListByYear(int year, int month, int nowDay) throws SQLException;
	
}
