package biz.model;

public class BmMonthView {
	private int year;
	private int month;
	private int ticketCount;
	private int sumGradePrice;
	private String grade;
	private int totalPrice;
	private int totalCount;
	
	public BmMonthView() {
		super();
	}

	public BmMonthView(int year, int month, int ticketCount, int sumGradePrice, String grade, int totalPrice,
			int totalCount) {
		super();
		this.year = year;
		this.month = month;
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

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
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
