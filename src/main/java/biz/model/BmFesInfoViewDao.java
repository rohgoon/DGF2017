package biz.model;

import java.sql.SQLException;
import java.util.List;

public interface BmFesInfoViewDao {
	public List<BmFesInfoView> selectListAll() throws SQLException;
	public List<BmFesInfoView> selectListByFno(int fno) throws SQLException;
	
}
