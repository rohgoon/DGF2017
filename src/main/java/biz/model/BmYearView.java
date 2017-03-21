package biz.model;

public class BmYearView {
	private int year;
	private int ticketCount;
	private int sumGradePrice;
	private String grade;
	private int totalPrice;
	private int totalCount;
	
	public BmYearView() {
		super();
	}
	
	public BmYearView(int year, int ticketCount, int sumGradePrice, String grade, int totalPrice, int totalCount) {
		super();
		this.year = year;
		this.ticketCount = ticketCount;
		this.sumGradePrice = sumGradePrice;
		this.grade = grade;
		this.totalPrice = totalPrice;
		this.totalCount = totalCount;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
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
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
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
