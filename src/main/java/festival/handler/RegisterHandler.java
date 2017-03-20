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

public class RegisterHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		if (req.getMethod().equalsIgnoreCase("get")) {
			return "/WEB-INF/view/festivalRegister.jsp";
		} else if(req.getMethod().equalsIgnoreCase("post")) {
			int fno = Integer.parseInt(req.getParameter("fno"));
			String place = req.getParameter("place");
			Date sday = sdf.parse(req.getParameter("sday"));
			Date eday = sdf.parse(req.getParameter("eday"));
			
			Festival festival = new Festival(fno, place, sday, eday);
			
			SqlSession session = null;
			try {
				session = MySqlSessionFactory.openSession();
				FestivalDao dao = session.getMapper(FestivalDao.class);
				dao.insert(festival);
				session.commit();
			} catch (Exception e) {
				session.rollback();
				e.printStackTrace();
			} finally {
				session.close();
			}
			return "festivalList.do";
		}
		return null;
	}

}
