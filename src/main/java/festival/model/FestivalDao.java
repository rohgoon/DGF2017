package festival.model;

import java.sql.SQLException;
import java.util.List;

import member.model.User;

public interface FestivalDao {
	public void insert(Festival festival) throws SQLException;
	public List<Festival> selectList() throws SQLException;
	public Festival selectListById(int fno) throws SQLException;
	public int deleteFestival(int fno) throws SQLException;
	public void updateFestival(Festival festival) throws SQLException;
}
