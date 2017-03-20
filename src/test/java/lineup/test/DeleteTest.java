package lineup.test;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import lineup.model.LineupDao;
import mvc.util.MySqlSessionFactory;

public class DeleteTest {

	@Test
	public void testDeleteLineup() {
		SqlSession sqlSession = MySqlSessionFactory.openSession();
		
		try {
			LineupDao dao = sqlSession.getMapper(LineupDao.class);
			int lno = 9;
			dao.deleteLineup(lno);
			
		} catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
	}

}
