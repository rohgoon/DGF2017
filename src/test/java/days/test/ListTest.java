package days.test;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Assert;
import org.junit.Test;

import festival.model.Days;
import festival.model.DaysDao;
import mvc.util.MySqlSessionFactory;

public class ListTest {

	@Test
	public void daysListTest() {
		SqlSession session = null;
		
		try {
			session = MySqlSessionFactory.openSession();
			DaysDao dao = session.getMapper(DaysDao.class);
			List<Days> lList = dao.selectList();
			
			Assert.assertNotNull(lList);
			System.out.println("daysListTest");
			for(Days days : lList){
				Assert.assertNotNull(days);
				System.out.println(days);
			}
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

}
