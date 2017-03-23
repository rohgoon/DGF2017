package reply.model;

import java.util.Date;

public class Reply {
	
	private int boardNo;
	private int articleNo;
	private int replyNo;
	private int uno;
	private String uname;
	private String id;
	private String content;
	private int parent;
	private int indent;
	private Date writeTime;
	private int delete;
	public int getBoardNo() {
		return boardNo;
	}
	public int getArticleNo() {
		return articleNo;
	}
	public int getReplyNo() {
		return replyNo;
	}
	public int getUno() {
		return uno;
	}
	public String getUname() {
		return uname;
	}
	public String getId() {
		return id;
	}
	public String getContent() {
		return content;
	}
	public int getParent() {
		return parent;
	}
	public int getIndent() {
		return indent;
	}
	public Date getWriteTime() {
		return writeTime;
	}
	public int getDelete() {
		return delete;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public void setArticleNo(int articleNo) {
		this.articleNo = articleNo;
	}
	public void setReplyNo(int replyNo) {
		this.replyNo = replyNo;
	}
	public void setUno(int uno) {
		this.uno = uno;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public void setParent(int parent) {
		this.parent = parent;
	}
	public void setIndent(int indent) {
		this.indent = indent;
	}
	public void setWriteTime(Date writeTime) {
		this.writeTime = writeTime;
	}
	public void setDelete(int delete) {
		this.delete = delete;
	}
		
	
	
	
}
