package festival.model;

import java.sql.SQLException;
import java.util.List;

public interface DaysDao {
	public void insert(Days days) throws SQLException;
	public Days selectByDno(int dno) throws SQLException;
	public List<Days> selectListAll() throws SQLException;
	public List<Days> selectListByFno(int fno) throws SQLException;
	public void updateByDno(Days days) throws SQLException;
	public List<Days> selectList() throws SQLException;
	public Days selectListByDno(int dno) throws SQLException;
	public int deleteDays(int dno) throws SQLException;
	public void updateDays(Days days) throws SQLException;
	
}
