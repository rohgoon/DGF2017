package article.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ArticleListView {
	
	private int boardNo;
	private String boardName;
	private int articleNo;
	private String category;
	private String title;
	private Date writeTime;
	private int hits;
	private int recommend;
	private String attechedFile;
	private int uno;
	private String id;
	private String name;
	private String content;
	
	

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	public ArticleListView(){}
	
	public ArticleListView(int boardNo, String boardName, int articleNo, String category, String title, Date writeTime,
			int hits, int recommend, String attechedFile, int uno, String id, String name) {
		this.boardNo = boardNo;
		this.boardName = boardName;
		this.articleNo = articleNo;
		this.category = category;
		this.title = title;
		this.writeTime = writeTime;
		this.hits = hits;
		this.recommend = recommend;
		this.attechedFile = attechedFile;
		this.uno = uno;
		this.id = id;
		this.name = name;
	}
	
	
	public ArticleListView(int articleNo, String category, String title, Date writeTime, int hits, int recommend,
			String attechedFile, String id, String name) {
		this.articleNo = articleNo;
		this.category = category;
		this.title = title;
		this.writeTime = writeTime;
		this.hits = hits;
		this.recommend = recommend;
		this.attechedFile = attechedFile;
		this.id = id;
		this.name = name;
	}

	public int getBoardNo() {
		return boardNo;
	}
	public String getBoardName() {
		return boardName;
	}
	public int getArticleNo() {
		return articleNo;
	}
	public String getCategory() {
		return category;
	}
	public String getTitle() {
		return title;
	}
	public String getWriteTime() {
		String wTime = sdf.format(writeTime);
		return wTime;
	}
	public int getHits() {
		return hits;
	}
	public int getRecommend() {
		return recommend;
	}
	public String getAttechedFile() {
		return attechedFile;
	}
	public int getUno() {
		return uno;
	}
	public String getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}
	public void setArticleNo(int articleNo) {
		this.articleNo = articleNo;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setWriteTime(Date writeTime) {
		this.writeTime = writeTime;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}
	public void setAttechedFile(String attechedFile) {
		this.attechedFile = attechedFile;
	}
	public void setUno(int uno) {
		this.uno = uno;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
}
