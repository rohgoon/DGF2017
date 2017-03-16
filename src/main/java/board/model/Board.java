package board.model;

public class Board {

	private String boardName;
	private int boardNo;
	

	public Board(){}


	public String getBoardName() {
		return boardName;
	}


	public void setBoardName(String boardName) {
		this.boardName = boardName;
	}


	public int getBoardNo() {
		return boardNo;
	}


	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}


	public Board(String boardName, int boardNo) {
		this.boardName = boardName;
		this.boardNo = boardNo;
	}

	
	
}
