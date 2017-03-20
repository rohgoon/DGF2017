package biz.model;

import java.sql.Time;
import java.util.Date;

public class SeatDetailView {
	private int no;
	private String grade;
	private int price;
	private int maxSeat;
	private int soldSeat;
	private int dno;
	private Date day;
	private Time stime;
	private Time etime;
	private int fno;
	private String place;
	private Date sday;
	private Date eday;
	public SeatDetailView() {
		super();
	}
	public SeatDetailView(int no, String grade, int price, int maxSeat, int soldSeat, int dno, Date day, Time stime,
			Time etime, int fno, String place, Date sday, Date eday) {
		super();
		this.no = no;
		this.grade = grade;
		this.price = price;
		this.maxSeat = maxSeat;
		this.soldSeat = soldSeat;
		this.dno = dno;
		this.day = day;
		this.stime = stime;
		this.etime = etime;
		this.fno = fno;
		this.place = place;
		this.sday = sday;
		this.eday = eday;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
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
	public int getMaxSeat() {
		return maxSeat;
	}
	public void setMaxSeat(int maxSeat) {
		this.maxSeat = maxSeat;
	}
	public int getSoldSeat() {
		return soldSeat;
	}
	public void setSoldSeat(int soldSeat) {
		this.soldSeat = soldSeat;
	}
	public int getDno() {
		return dno;
	}
	public void setDno(int dno) {
		this.dno = dno;
	}
	public Date getDay() {
		return day;
	}
	public void setDay(Date day) {
		this.day = day;
	}
	public Time getStime() {
		return stime;
	}
	public void setStime(Time stime) {
		this.stime = stime;
	}
	public Time getEtime() {
		return etime;
	}
	public void setEtime(Time etime) {
		this.etime = etime;
	}
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
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
	
	
}
