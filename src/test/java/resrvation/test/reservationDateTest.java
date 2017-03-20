package resrvation.test;

import java.util.Date;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import mvc.util.MySqlSessionFactory;
import reservation.model.Reservation;
import reservation.model.ReservationDao;

public class reservationDateTest {
	@Test
	public void testInsertYear() {
		Date date = new Date();
		SqlSession session = null;
		try {
			session = MySqlSessionFactory.openSession();			
			ReservationDao dao = session.getMapper(ReservationDao.class);
			Reservation reservation = new Reservation(1, 1, date);
			dao.insert(reservation);
			session.commit();
		}catch (Exception e) {
			session.rollback();
			e.printStackTrace();		
		}finally {
			session.close();
		}
	}

}
