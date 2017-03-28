package lineup.model;

import java.sql.SQLException;
import java.util.List;

public interface LineupDao {
	public void insert(Lineup lineup) throws SQLException;
	public List<Lineup> selectList() throws SQLException;
	public Lineup selectListById(int lno) throws SQLException;
	public int deleteLineup(int lno) throws SQLException;
	public void updateLineup(Lineup lineup) throws SQLException;
	public int deleteLineupByDno(int dno) throws SQLException;
}
