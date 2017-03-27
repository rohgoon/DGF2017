package festival.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import festival.model.FestivalDao;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;

public class DeleteHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		SqlSession sqlSession = MySqlSessionFactory.openSession();
		
		try {
			FestivalDao dao = sqlSession.getMapper(FestivalDao.class);
			int fno = Integer.parseInt(req.getParameter("fno"));
			dao.deleteFestival(fno);
			sqlSession.commit();
		}catch(Exception e){
			sqlSession.rollback();
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return "festivalList.do";
		
	}

}
