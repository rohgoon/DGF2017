package days.test;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import festival.model.DaysDao;
import mvc.util.MySqlSessionFactory;

public class DeleteTest {

	@Test
	public void test() {
		SqlSession sqlSession = MySqlSessionFactory.openSession();
		
		try {
			DaysDao dao = sqlSession.getMapper(DaysDao.class);
			int dno = 9;
			dao.deleteDays(dno);
			
		} catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
	}

}
