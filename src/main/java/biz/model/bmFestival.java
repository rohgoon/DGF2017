package biz.model;

import java.util.HashMap;

public class bmFestival {
	private int fno;
	private String day;
	private HashMap<String, SeatPerGrade> soldPerGrade;
	private HashMap<String, SeatPerGrade> pricePerGrade;
	private int totalTicket;
	private int totalPrice;
	public bmFestival() {
		super();
	}
	public bmFestival(int fno, String day, HashMap<String, SeatPerGrade> soldPerGrade,
			HashMap<String, SeatPerGrade> pricePerGrade, int totalTicket, int totalPrice) {
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
	public HashMap<String, SeatPerGrade> getSoldPerGrade() {
		return soldPerGrade;
	}
	public void setSoldPerGrade(HashMap<String, SeatPerGrade> soldPerGrade) {
		this.soldPerGrade = soldPerGrade;
	}
	public HashMap<String, SeatPerGrade> getPricePerGrade() {
		return pricePerGrade;
	}
	public void setPricePerGrade(HashMap<String, SeatPerGrade> pricePerGrade) {
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
