package biz.model;

public class BmFesInfoView {
	private String ymdDate;
	private int fno;
	private String grade;
	private int price;
	private int ticketCount;
	private int sumGradePrice;
	private int totalPrice;
	private int totalCount;
	public BmFesInfoView() {
		super();
	}
	public BmFesInfoView(String ymdDate, int fno, String grade, int price, int ticketCount, int sumGradePrice,
			int totalPrice, int totalCount) {
		super();
		this.ymdDate = ymdDate;
		this.fno = fno;
		this.grade = grade;
		this.price = price;
		this.ticketCount = ticketCount;
		this.sumGradePrice = sumGradePrice;
		this.totalPrice = totalPrice;
		this.totalCount = totalCount;
	}
	public String getYmdDate() {
		return ymdDate;
	}
	public void setYmdDate(String ymdDate) {
		this.ymdDate = ymdDate;
	}
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getTicketCount() {
		return ticketCount;
	}
	public void setTicketCount(int ticketCount) {
		this.ticketCount = ticketCount;
	}
	public int getSumGradePrice() {
		return sumGradePrice;
	}
	public void setSumGradePrice(int sumGradePrice) {
		this.sumGradePrice = sumGradePrice;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	
	
	
}
