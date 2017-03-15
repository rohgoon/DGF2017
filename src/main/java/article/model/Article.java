package article.model;

import java.util.Date;

import board.model.Board;
import member.model.User;

public class Article {

	private int boardNo;	// 게시판이름
	private	int userNo;		// 작성자
	private	int no;			// 게시물번호
	private String title;   // 게시물제목
	private String content;	// 게시물내용
	private String category;// 게시물카테고리
	private Date writeTime;		// 게시물작성날짜
	private int hits;		// 게시물조회수
	private int recommends;	// 게시물추천수
	private String attaced;	// 게시물첨부파일
	private int replyCount; // 댓글숫자
	
	
}
