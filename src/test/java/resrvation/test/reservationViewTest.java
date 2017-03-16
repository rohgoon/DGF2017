package resrvation.test;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import mvc.util.MySqlSessionFactory;
import reservation.model.ReservationView;
import reservation.model.ReservationViewDao;

public class reservationViewTest {
	@Test
	public void testSelectById() {
		int uno = 1;
		SqlSession session = null;
		try {
			session = MySqlSessionFactory.openSession();			
			ReservationViewDao reservationViewDao = session.getMapper(ReservationViewDao.class);
			List<ReservationView> reservationViews = reservationViewDao.selectDetailListbyUno(uno);
			for (ReservationView reservationView : reservationViews) {
				System.out.println(reservationView.toString());
			}
		}catch (Exception e) {
			session.rollback();
			e.printStackTrace();		
		}finally {
			session.close();
		}
	}

}
