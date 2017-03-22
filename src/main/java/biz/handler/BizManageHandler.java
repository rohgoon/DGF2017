package biz.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import biz.model.BmFesInfoView;
import biz.model.BmFesInfoViewDao;
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
				int lineCheck =0;
				for (int i = 0; i < bmFesInfoViews.size(); i++) {
					if (bmFesInfoViews.get(i).getFno() != lineCheck) {
						bmFesInfoViews.get(i).setFirstLine(true);
						lineCheck = bmFesInfoViews.get(i).getFno();
					}else{
						bmFesInfoViews.get(i).setFirstLine(false);
					}
					
					
				}
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
