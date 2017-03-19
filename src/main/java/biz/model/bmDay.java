package biz.model;

public class bmDay {
	private int fno;
	private String day;
	private String[][] soldPerGrade;
	private String[][] pricePerGrade;
	private int totalTicket;
	private int totalPrice;
	public bmDay() {
		super();
	}
	public bmDay(int fno, String day, String[][] soldPerGrade, String[][] pricePerGrade, int totalTicket,
			int totalPrice) {
		super();
		this.fno = fno;
		this.day = day;
		this.soldPerGrade = soldPerGrade;
		this.pricePerGrade = pricePerGrade;
		this.totalTicket = totalTicket;
		this.totalPrice = totalPrice;
	}
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}
	public String[][] getSoldPerGrade() {
		return soldPerGrade;
	}
	public void setSoldPerGrade(String[][] soldPerGrade) {
		this.soldPerGrade = soldPerGrade;
	}
	public String[][] getPricePerGrade() {
		return pricePerGrade;
	}
	public void setPricePerGrade(String[][] pricePerGrade) {
		this.pricePerGrade = pricePerGrade;
	}
	public int getTotalTicket() {
		return totalTicket;
	}
	public void setTotalTicket(int totalTicket) {
		this.totalTicket = totalTicket;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	
	
}
