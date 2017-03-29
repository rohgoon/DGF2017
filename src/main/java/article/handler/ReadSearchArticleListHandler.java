package article.handler;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import article.model.ArticleListPaging;
import article.model.ArticleListView;
import article.model.ArticleListViewDao;
import board.model.Board;
import board.model.BoardDao;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;

public class ReadSearchArticleListHandler implements CommandHandler {



	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		SqlSession session = null;
		int boardNo;
		int totalArticle;
		String category = req.getParameter("category");
		List<ArticleListView> articleList = null;
		

		// 페이지당 출력할 게시물 갯수를 받아온다. 없으면 10으로 지정한다.
		Integer rowNum;
		try {
			rowNum = Integer.parseInt(req.getParameter("rowNum"));
		} catch (Exception e1) {
			rowNum = 10;
		}	
		if(rowNum == 0){
			rowNum = 10;
		}
		
		// 현재 페이지를 가져온다. 잘못된 접근으로 페이지값이 없으면 1페이지로, 총 페이지보다 많으면 최종 페이지로 넘긴다.
		int page;
		try {
			page = Integer.parseInt(req.getParameter("page"));
		} catch (Exception e1) {
			page = 1;
		}
		if(page == 0){
			page = 1;
		}
		
		try {
			session = MySqlSessionFactory.openSession();
			ArticleListViewDao dao = session.getMapper(ArticleListViewDao.class);
			boardNo = Integer.parseInt(req.getParameter("boardNo"));
			ArticleListPaging alp;
			if(category == null || category.equals("전체") || category.equals("카테고리")){
				totalArticle = dao.selectCountArticleListByBoardNo(boardNo); // 게시물 갯수
				alp = new ArticleListPaging(totalArticle, rowNum, page);
				try {
					articleList = dao.selectArticleListByPage(boardNo, alp.getStartRow(), rowNum);
				} catch (Exception e) {
					req.setAttribute("boardNo", boardNo);
				}
			}else{
				totalArticle = dao.selectCountArticleListByBoardNoAndCategory(boardNo, category);
				alp = new ArticleListPaging(totalArticle, rowNum, page);
				try {
					articleList = dao.selectArticleListByCategory(boardNo, category, alp.getStartRow(), rowNum);
				} catch (Exception e) {
					req.setAttribute("boardNo", boardNo);
				}
			}
						
			
			if(totalArticle == 0){
				return "WEB-INF/view/article/articleList.jsp";
			}
			
			req.setAttribute("totalArticle", totalArticle); // 총 게시물 수
			req.setAttribute("boardNo", boardNo);
			req.setAttribute("rowNum", rowNum);
			req.setAttribute("page", page); // 현재 페이지
			req.setAttribute("articleList", articleList); // 게시물 리스트
			req.setAttribute("category", category);
			
			req.setAttribute("totalPage", alp.getTotalPage()); // 총 페이지 수
			req.setAttribute("startPage", alp.getStartPage()); // 시작 페이지
			req.setAttribute("endPage", alp.getEndPage()); // 최종 페이지
			
			
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
		

		return "WEB-INF/view/article/articleList.jsp?rowNum=" + rowNum +"&page=" + page + "&category="+ category;
	}

}
