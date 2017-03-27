package board.test;

import static org.junit.Assert.*;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;

import article.model.ArticleListView;
import article.model.ArticleListViewDao;
import board.model.Board;
import board.model.BoardDao;
import member.model.MemberDao;
import member.model.User;
import mvc.util.MySqlSessionFactory;

public class BoardTest {
	
//	성공
//	@Test
//	public void createBoardTest() {
//		SqlSession session = null;
//		try {
//			session = MySqlSessionFactory.openSession();
//			BoardDao dao = session.getMapper(BoardDao.class);
//			String boardName = "질문게시판";
//			dao.createBoard(boardName);
//			session.commit();
//		} catch (Exception e) {
//			session.rollback();
//			e.printStackTrace();
//		} finally {
//			session.close();
//		}
//	}

//	성공
//	@Test
//	public void testSelectById() {
//		SqlSession session = null;
//		try {
//			session = MySqlSessionFactory.openSession();
//			BoardDao dao = session.getMapper(BoardDao.class);
//			List<Board> boardList = dao.selectAllBoardList();
//
//			for(Board board : boardList) {
//				System.out.println(board.toString());
//			}
//		} catch (Exception e) {
//			session.rollback();
//			e.printStackTrace();
//		} finally {
//			session.close();
//		}
//	}
	
//	//성공
//	@Test
//	public void testSelectById() {
//		SqlSession session = null;
//		
//		int boardNo = 16;
//		String boardName = "수정할이름";
//		
//		try {
//			session = MySqlSessionFactory.openSession();
//			BoardDao dao = session.getMapper(BoardDao.class);
//			Board board = new Board(boardName, boardNo);
//			dao.updateBoardByNo(board);
//			session.commit();
//		} catch (Exception e) {
//			session.rollback();
//			e.printStackTrace();
//		} finally {
//			session.close();
//		}
//	}
	
//	성공
//	@Test
//	public void testSelectById() {
//		SqlSession session = null;
//		try {
//			session = MySqlSessionFactory.openSession();
//			BoardDao dao = session.getMapper(BoardDao.class);
//			Board board = dao.selectBoardByNo(4);
//			System.out.println(board.getBoardName());
//		} catch (Exception e) {
//			session.rollback();
//			e.printStackTrace();
//		} finally {
//			session.close();
//		}
//	}

	
//	성공
//	@Test
//	public void deleteById() {
//		SqlSession session = null;
//		try {
//			session = MySqlSessionFactory.openSession();
//			BoardDao dao = session.getMapper(BoardDao.class);
//			dao.deleteBoardByNo(8);
//			session.commit();
//		} catch (Exception e) {
//			session.rollback();
//			e.printStackTrace();
//		} finally {
//			session.close();
//		}
//	}
	
}
