package biz.model;

import java.util.Date;
import java.util.List;

public class BmFestival {
	private int fno;
	private Date sday;
	private Date eday;
	private List<SeatPerGrade> seatPerGrade;
	private int totalTicket;
	private int totalPrice;
	public BmFestival() {
		super();
	}	

	public BmFestival(int fno, Date sday, Date eday, List<SeatPerGrade> seatPerGrade, int totalTicket,
			int totalPrice) {
		super();
		this.fno = fno;
		this.sday = sday;
		this.eday = eday;
		this.seatPerGrade = seatPerGrade;
		this.totalTicket = totalTicket;
		this.totalPrice = totalPrice;
	}


	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	
	public Date getSday() {
		return sday;
	}


	public void setSday(Date sday) {
		this.sday = sday;
	}


	public Date getEday() {
		return eday;
	}


	public void setEday(Date eday) {
		this.eday = eday;
	}


	public List<SeatPerGrade> getSeatPerGrade() {
		return seatPerGrade;
	}
	public void setSeatPerGrade(List<SeatPerGrade> seatPerGrade) {
		this.seatPerGrade = seatPerGrade;
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
