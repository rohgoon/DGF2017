package biz.model;

public class BmMonthView {
	private int ymDate;
	private int year;
	private int month;
	private int fno;
	private int ticketCount;
	private int sumGradePrice;
	private String grade;
	private int totalPrice;
	private int totalCount;
	private boolean firstLine;
	
	public BmMonthView() {
		super();
	}

	public BmMonthView(int ymDate, int year, int month, int ticketCount, int sumGradePrice, String grade,
			int totalPrice, int totalCount) {
		super();
		this.ymDate = ymDate;
		this.year = year;
		this.month = month;
		this.ticketCount = ticketCount;
		this.sumGradePrice = sumGradePrice;
		this.grade = grade;
		this.totalPrice = totalPrice;
		this.totalCount = totalCount;
	}

	public int getYmDate() {
		return ymDate;
	}

	public void setYmDate(int ymDate) {
		this.ymDate = ymDate;
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

	public boolean isFirstLine() {
		return firstLine;
	}

	public void setFirstLine(boolean firstLine) {
		this.firstLine = firstLine;
	}

	public int getFno() {
		return fno;
	}

	public void setFno(int fno) {
		this.fno = fno;
	}

	
}
