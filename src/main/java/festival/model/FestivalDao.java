package festival.model;

import java.sql.SQLException;
import java.util.Date;
import java.util.List;

public interface FestivalDao {
	public void insert(Festival festival) throws SQLException;
	public List<Festival> selectList() throws SQLException;
	public Festival selectListByFno(int fno) throws SQLException;
	public int deleteFestival(int fno) throws SQLException;
	public void updateFestival(Festival festival) throws SQLException;
	public int selectFnoByLast(Festival festival) throws SQLException;
	public int selectMaxFno() throws SQLException;
	public int selectCountAll() throws SQLException;
	public List<Festival> selectListBiggerThanNow(Date now) throws SQLException;
}
