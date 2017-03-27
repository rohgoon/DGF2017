package lineup.handler;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import lineup.model.Lineup;
import lineup.model.LineupDao;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;

public class UpdateHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")){
			SqlSession sqlSession = MySqlSessionFactory.openSession();
			try {
				LineupDao dao = sqlSession.getMapper(LineupDao.class);
				int lno = Integer.parseInt(req.getParameter("lno"));
				Lineup lineup = dao.selectListById(lno);
				
				req.setAttribute("updateLineup", lineup);
				
			} finally {
				sqlSession.close();
			}
			return "/WEB-INF/view/lineupUpdate.jsp";
		} else if(req.getMethod().equalsIgnoreCase("post")){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
			int lno = Integer.parseInt(req.getParameter("lno"));
			int dno = Integer.parseInt(req.getParameter("dno"));
			String aname = req.getParameter("aname");
			String contents = req.getParameter("contents");
			String song1 = req.getParameter("song1");
			String song2 = req.getParameter("song2");
			String song3 = req.getParameter("song3");
			
			/*Lineup lineup = new Lineup(dno, aname, contents, song1, song2, song3);*/
			
			SqlSession session = null;
			
			try {
				session = MySqlSessionFactory.openSession();
				LineupDao dao = session.getMapper(LineupDao.class);
				/*dao.updateLineup(lineup);*/
				session.commit();
			} catch (Exception e) {
				session.rollback();
				e.printStackTrace();
			} finally {
				session.close();
			}
			return "lineupSelected.do";
		}
		return null;
	}

}
