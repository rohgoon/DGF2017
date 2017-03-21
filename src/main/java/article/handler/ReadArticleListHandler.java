package article.handler;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import article.model.ArticleListView;
import article.model.ArticleListViewDao;
import board.model.Board;
import board.model.BoardDao;
import mvc.controller.CommandHandler;
import mvc.util.MySqlSessionFactory;

public class ReadArticleListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		SqlSession session = null;
		try {
			int boardNo = Integer.parseInt(req.getParameter("boardNo"));
			session = MySqlSessionFactory.openSession();
			
			ArticleListViewDao dao = session.getMapper(ArticleListViewDao.class);
			
			// 해당 게시판(boardNo)의 게시물 갯수를 받아온다.
			int totalArticle = dao.selectCountArticleListByBoarNo(boardNo);
			
			Integer atcPerPage;
			// 페이지당 출력할 게시물 갯수를 받아온다. 없으면 10으로 지정한다.
			try{
				atcPerPage = Integer.parseInt(req.getParameter("atcPerPage"));	
			}catch (Exception e) {
				atcPerPage = 10;
			}
			
//			if(atcPerPage == null){
//				atcPerPage = 10;
//			}
			
			// 총 페이지 수를 구한다.
			int totalPage = totalArticle/atcPerPage;
			if(totalArticle > atcPerPage*totalPage){
				totalPage++;
			}
			
			// 현재 페이지를 출력한다. 잘못된 접근으로 페이지값이 없으면 1페이지로, 총 페이지보다 많으면 최종 페이지로 넘긴다.
			Integer page;
			try{
				page = Integer.parseInt(req.getParameter("page"));
			}catch(Exception e){
				page = 1;
			}
			if(page > totalPage){
				page = totalPage;
			}
			
			// 현재 페이지를 기준으로 10페이지씩 끊어주는 startPage와 endPage의 값을 구한다.
			int countPage = 10;
			int startPage = ((page -1) / countPage ) * countPage + 1;
			int endPage = startPage + countPage - 1;
			// 마지막 페이지가 총 페이지 수보다 크게 나올 수 있기 때문에 보정해준다.
			if(endPage > totalPage){
				endPage = totalPage;
			}
			List<Integer> pageList = new ArrayList<>();		
			for(int i = startPage; i <= endPage; i++){
				pageList.add(i);
				System.out.println(pageList.toString());
			}
			
//			int startRow = 0;
//			int endRow = 10;
			
			int startRow = (page-1) * atcPerPage;
			int endRow = (page) * atcPerPage;
			
			List<ArticleListView> articleList = dao.selectArticleListByPage(boardNo, startRow, endRow);
			
			
			req.setAttribute("totalArticle", totalArticle); // 총 게시물 수
			req.setAttribute("totalPage", totalPage); // 총 페이지 수
			req.setAttribute("page", page); // 현재 페이지
			req.setAttribute("articleList", articleList); // 게시물 리스트
			req.setAttribute("pageList", pageList); // 출력될 페이지 리스트

		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}

		return "WEB-INF/view/article/articleList.jsp";
	}

}
