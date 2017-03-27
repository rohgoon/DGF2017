package article.model;

import java.util.ArrayList;
import java.util.List;

public class ArticleListPaging {
	int boardNo;
	int totalArticle;
	Integer rowNum = null;
	int totalPage;
	Integer page = null;
	int countPage = 10;
	int startPage;
	int endPage;
	int startRow;

	
	public ArticleListPaging(int totalArticle, int rowNum, int page){
		this.totalArticle = totalArticle;
		this.rowNum = rowNum;
		this.page = page;
		
		// 총 페이지수(totalPage)를 구한다.
		totalPage = totalArticle/rowNum;
		if(totalArticle > rowNum*totalPage){
			totalPage++;
		}
		
		// 요청한 페이지가 전체 페이지 보다 많을 경우 보정
		if(page > totalPage){
			page = totalPage;
		}
		
		// 현재 페이지를 기준으로 10페이지씩 끊어주는 startPage와 endPage의 값을 구한다.
		startPage = ((page -1) / countPage ) * countPage + 1;
		endPage = startPage + countPage - 1;
		
		// 마지막 페이지가 총 페이지 수보다 크게 나올 수 있기 때문에 보정해준다.
		if(endPage > totalPage){
			endPage = totalPage;
		}
	
		startRow = (page-1) * rowNum;

	}//ArticleListPaging

	
	
	
	public int getBoardNo() {
		return boardNo;
	}

	public int getTotalArticle() {
		return totalArticle;
	}

	public Integer getRowNum() {
		return rowNum;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public Integer getPage() {
		return page;
	}

	public int getCountPage() {
		return countPage;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public int getStartRow() {
		return startRow;
	}



	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public void setTotalArticle(int totalArticle) {
		this.totalArticle = totalArticle;
	}

	public void setRowNum(Integer rowNum) {
		this.rowNum = rowNum;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public void setCountPage(int countPage) {
		this.countPage = countPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	
}
