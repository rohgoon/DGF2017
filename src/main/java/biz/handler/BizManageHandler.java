package biz.handler;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import biz.model.BmFesInfoView;
import biz.model.BmFesInfoViewDao;
import biz.model.BmFestival;
import biz.model.SeatDetailView;
import biz.model.SeatDetailViewDao;
import biz.model.SeatPerGrade;
import festival.model.Festival;
import festival.model.FestivalDao;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;

public class BizManageHandler implements CommandHandler {
	private final String FORM_VIEW = "/WEB-INF/biz/bmFront.jsp";
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("get")) {
			SqlSession session = null;			
			try{
				session = MySqlSessionFactory.openSession();
				BmFesInfoViewDao bmFesInfoViewDao = session.getMapper(BmFesInfoViewDao.class);
				List<BmFesInfoView> bmFesInfoViews = bmFesInfoViewDao.selectListAll();
				req.setAttribute("bmFestivals", bmFesInfoViews);
				
				
			}finally {
				session.close();
			}
			
			return FORM_VIEW;
		}else if (req.getMethod().equalsIgnoreCase("post")) {
			
		}
		return null;
	}

}
