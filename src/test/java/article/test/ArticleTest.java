package article.test;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import article.model.Article;
import article.model.ArticleDao;
import article.model.ArticleListView;
import article.model.ArticleListViewDao;
import board.model.Board;
import board.model.BoardDao;
import mvc.util.MySqlSessionFactory;

public class ArticleTest {

//	@Test
//	public void testSelect() {
//		SqlSession session = null;
//	
//		try {
//			session = MySqlSessionFactory.openSession();
//			ArticleDao dao = session.getMapper(ArticleDao.class);
//			List<Article> articles = dao.selectArticleList();
//			for(Article article : articles) {
//				System.out.println(article.toString());
//			}
//			session.commit();
//		} catch (Exception e) {
//			session.rollback();
//			e.printStackTrace();
//		} finally {
//			session.close();
//		}
//	}

//	@Test
//	public void testCreate() {
//		SqlSession session = null;
//	
//		try {
//			session = MySqlSessionFactory.openSession();
//			ArticleDao dao = session.getMapper(ArticleDao.class);
//			Article article = new Article();
//			article.setBoardNo(6);
//			article.setUno(10);
//			article.setTitle("공지사항2");
//			article.setCategory("공지사항");
//			article.setContent("안녕하세요. 게시판 기능을 추가하였습니다. 그럼 20000");
//			Date date = new Date();
//			article.setWriteTime(date);
//			dao.insertArticle(article);
//			session.commit();
//		} catch (Exception e) {
//			session.rollback();
//			e.printStackTrace();
//		} finally {
//			session.close();
//		}
//	}

	
//	@Test
//	public void testSelect() {
//		SqlSession session = null;
//	
//		try {
//			session = MySqlSessionFactory.openSession();
//			ArticleDao dao = session.getMapper(ArticleDao.class);
//			int articleNo = 1;
//			int boardNo = 6;
//			Article article = dao.selectArticleByNo(articleNo, boardNo);
//			session.commit();
//			System.out.println(article.getTitle());
//			System.out.println(article.getUno());
//		} catch (Exception e) {
//			session.rollback();
//			e.printStackTrace();
//		} finally {
//			session.close();
//		}
//	}
	
//	성공
//	@Test
//	public void testSelect() {
//		SqlSession session = null;
//	
//		try {
//			session = MySqlSessionFactory.openSession();
//			ArticleListViewDao dao = session.getMapper(ArticleListViewDao.class);
//			int boardNo = 6;
//			List<ArticleListView> articleList = dao.selectArticleListByBoardNoSortByArticleNoDesc(boardNo);
//			
//			for(int i = 0; i < articleList.size(); i++){
//				System.out.println(articleList.get(i).toString());
//			}
//			
//				
//			
//		} catch (Exception e) {
//			session.rollback();
//			e.printStackTrace();
//		} finally {
//			session.close();
//		}
//	}
	
	
//	@Test
//	public void testSelect() {
//		SqlSession session = null;
//	
//		try {
//			session = MySqlSessionFactory.openSession();
//			ArticleListViewDao dao = session.getMapper(ArticleListViewDao.class);
//			int boardNo = 6;
//			List<ArticleListView> articleList = dao.selectArticleListByPage(boardNo, 1, 10);
//			
//			for(int i = 0; i < articleList.size(); i++){
//				System.out.println(articleList.get(i).toString());
//			}
//			
//				
//			
//		} catch (Exception e) {
//			session.rollback();
//			e.printStackTrace();
//		} finally {
//			session.close();
//		}
//	}
	
	@Test
	public void testSelect() {
		SqlSession session = null;
	
		try {
			session = MySqlSessionFactory.openSession();
			ArticleListViewDao dao = session.getMapper(ArticleListViewDao.class);
			int boardNo = 6;
			int articleCount = dao.selectCountArticleListByBoarNo(boardNo);
			
			System.out.println(articleCount);
					
				
			
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}
	}
	
	
}
