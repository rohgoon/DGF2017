package days.test;

import java.sql.Time;
import java.util.Date;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import days.model.Days;
import days.model.DaysDao;
import mvc.util.MySqlSessionFactory;

public class RegisterTest {

	@Test
	public void insertTest() {
		SqlSession session = null;
		Date testDay = new Date();
		Time testTime = new Time(0, 0, 0);
		
		
		try {
			session = MySqlSessionFactory.openSession();
			DaysDao dao = session.getMapper(DaysDao.class);
			Days days = new Days(3, testDay, testTime, testTime);
			dao.insert(days);
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

}
