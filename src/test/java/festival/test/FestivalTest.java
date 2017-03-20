package festival.test;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Assert;
import org.junit.Test;

import festival.model.Festival;
import festival.model.FestivalDao;
import mvc.util.MySqlSessionFactory;

public class FestivalTest {
	
	//insert test라는
	/*@Test
	public void insertTest() {
		SqlSession session = null;
		
		try {
			session = MySqlSessionFactory.openSession();
			FestivalDao dao = session.getMapper(FestivalDao.class);
			Festival festival = new Festival(3, "대구 동성로", new Date(), new Date());
			dao.insert(festival);
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}*/
	
	
	//select test
	/*@Test
	public void festivalListTest(){
		SqlSession session = null;
		
		try {
			session = MySqlSessionFactory.openSession();
			FestivalDao dao = session.getMapper(FestivalDao.class);
			List<Festival> fList = dao.selectList();
			Assert.assertNotNull(fList);
			System.out.println("festivalListTest");
			for(Festival festival : fList){
				Assert.assertNotNull(festival);
				System.out.println(festival);
			}
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}*/
	
	
	//testSelectById test!
	/*@Test
	public void testSelectById(){
		SqlSession session = null;
		try {
			session = MySqlSessionFactory.openSession();
			FestivalDao dao = session.getMapper(FestivalDao.class);
			int fno = 1;
			Festival festival = dao.selectListById(fno);
			System.out.println(festival.toString());
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}*/
	
	//Delete Test라는
	@Test
	public void testDeleteFestival(){
		SqlSession sqlSession = MySqlSessionFactory.openSession();
		
		try {
			FestivalDao dao = sqlSession.getMapper(FestivalDao.class);
			int fno = 6;
			dao.deleteFestival(fno);
			
		} catch (Exception e) {
			sqlSession.rollback();
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
	
		
	}
	
	
	

}
