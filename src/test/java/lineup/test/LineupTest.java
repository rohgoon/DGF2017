package lineup.test;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Assert;
import org.junit.Test;

import lineup.model.Lineup;
import lineup.model.LineupDao;
import mvc.util.MySqlSessionFactory;

public class LineupTest {
	
	//lineup list test 고우고우
	/*@Test
	public void lineupListTest() {
		SqlSession session = null;
		
		try {
			session = MySqlSessionFactory.openSession();
			LineupDao dao = session.getMapper(LineupDao.class);
			List<Lineup> lList = dao.selectList();
			Assert.assertNotNull(lList);
			System.out.println("lineupListTest");
			for(Lineup lineup : lList){
				Assert.assertNotNull(lineup);
				System.out.println(lineup);
			}
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}*/
	
	//insert test
	/*@Test
	public void insertTest() {
		SqlSession session = null;
		
		try {
			session = MySqlSessionFactory.openSession();
			LineupDao dao = session.getMapper(LineupDao.class);
			Lineup lineup = new Lineup(7, 7, "ioi");
			dao.insert(lineup);
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}*/
	
	
	//test testSelectById :-)
	@Test
	public void testSelectById(){
		SqlSession session = null;
		try {
			session = MySqlSessionFactory.openSession();
			LineupDao dao = session.getMapper(LineupDao.class);
			int lno = 1;
			Lineup lineup = dao.selectListById(lno);
			System.out.println(lineup.toString());
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
	
	

}
