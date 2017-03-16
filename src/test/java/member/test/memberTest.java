package member.test;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import member.model.MemberDao;
import member.model.User;
import mvc.util.MySqlSessionFactory;

public class memberTest {
	
	/*@Test
	public void testInsert() {
		SqlSession session = null;
		try {
			session = MySqlSessionFactory.openSession();
			MemberDao dao = session.getMapper(MemberDao.class);
			User mem = new User("t2111", "이일수", "t2111", "t2111@dgit.or.kr", "010-2111-2111", new Date());
			dao.insert(mem);
			session.commit();//
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();

		} finally {
			session.close();
		}
	}*/
	@Test
	public void testSelectById() {
		SqlSession session = null;
		try {
			session = MySqlSessionFactory.openSession();
			MemberDao dao = session.getMapper(MemberDao.class);
			
			
			
			String id = "t1111";
			User user = dao.selectAllById(id);
			System.out.println(user.toString());
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

}
