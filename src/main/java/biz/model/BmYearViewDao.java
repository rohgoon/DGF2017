package biz.model;

import java.sql.SQLException;
import java.util.List;

public interface BmYearViewDao {
	public List<BmYearView> selectListAll() throws SQLException;
	public List<BmYearView> selectListByYear(int year) throws SQLException;
}
