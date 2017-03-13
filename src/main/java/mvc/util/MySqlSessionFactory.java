package mvc.util;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class MySqlSessionFactory {
	private static SqlSessionFactory sessionFactory;

	public static SqlSessionFactory getSqlSessionFactory() {
		if (sessionFactory == null) {
		try {
				InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");

				sessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			} catch (IOException e) {
				e.printStackTrace();
				throw new RuntimeException(e.getCause());
			}
		}
		return sessionFactory;
	}

	public static SqlSession openSession() {
		return getSqlSessionFactory().openSession();
	}

}
