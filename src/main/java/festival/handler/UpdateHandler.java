package festival.handler;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import festival.model.Festival;
import festival.model.FestivalDao;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;

public class UpdateHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")){
			SqlSession sqlSession = MySqlSessionFactory.openSession();
			try {
				FestivalDao dao = sqlSession.getMapper(FestivalDao.class);
				int fno = Integer.parseInt(req.getParameter("fno"));
				Festival festival = dao.selectListById(fno);
				
				req.setAttribute("updateFestival", festival);
				
			} finally {
				sqlSession.close();
			}
			return "/WEB-INF/view/festivalUpdate.jsp";
		} else if(req.getMethod().equalsIgnoreCase("post")){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
			int fno = Integer.parseInt(req.getParameter("fno"));
			String place = req.getParameter("place");
			Date sday = sdf.parse(req.getParameter("sday"));
			Date eday = sdf.parse(req.getParameter("eday"));
			
			Festival festival = new Festival(fno, place, sday, eday);
			SqlSession session = null;
			
			try {
				session = MySqlSessionFactory.openSession();
				FestivalDao dao = session.getMapper(FestivalDao.class);
				dao.updateFestival(festival);
				session.commit();
			} catch (Exception e) {
				session.rollback();
				e.printStackTrace();
			} finally {
				session.close();
			}
			return "festivalSelected.do";
		}
		return null;
		
	}

}
