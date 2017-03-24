package reservation.model;

import java.sql.Time;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ReservationView {
	private int rno;
	private int uno;
	private Date rtime;
	private int sno;
	private String grade;
	private int price;
	private int maxseat;
	private int soldseat;
	private int dno;
	private Date day;
	private Time stime;
	private Time etime;
	private int fno;
	private String place;
	private Date sday;
	private Date eday;
	public ReservationView() {
		super();
	}
	public ReservationView(int rno, int uno, Date rtime, int sno, String grade, int price, int maxseat, int soldseat,
			int dno, Date day, Time stime, Time etime, int fno, String place, Date sday, Date eday) {
		super();
		this.rno = rno;
		this.uno = uno;
		this.rtime = rtime;
		this.sno = sno;
		this.grade = grade;
		this.price = price;
		this.maxseat = maxseat;
		this.soldseat = soldseat;
		this.dno = dno;
		this.day = day;
		this.stime = stime;
		this.etime = etime;
		this.fno = fno;
		this.place = place;
		this.sday = sday;
		this.eday = eday;
	}
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getUno() {
		return uno;
	}
	public void setUno(int uno) {
		this.uno = uno;
	}
	public Date getRtime(){
		
		return rtime;
	}
	public String getRtimeString() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String daySdf = sdf.format(rtime);
		return daySdf;
	}
	public void setRtime(Date rtime) {
		this.rtime = rtime;
	}
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public int getMaxseat() {
		return maxseat;
	}
	public void setMaxseat(int maxseat) {
		this.maxseat = maxseat;
	}
	public int getSoldseat() {
		return soldseat;
	}
	public void setSoldseat(int soldseat) {
		this.soldseat = soldseat;
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
	public String getDayString() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String daySdf = sdf.format(day);
		return daySdf;
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
	public String getSdayString() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String daySdf = sdf.format(sday);
		return daySdf;
	}
	public void setSday(Date sday) {
		this.sday = sday;
	}
	public Date getEday() {
		return eday;
	}
	public String getEdayString() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String daySdf = sdf.format(eday);
		return daySdf;
	}
	public void setEday(Date eday) {
		this.eday = eday;
	}
	
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	@Override
	public String toString() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		return "ReservationView [rno=" + rno + ", uno=" + uno + ", rtime=" + sdf.format(rtime) + ", sno=" + sno + ", grade=" + grade
				+ ", maxseat=" + maxseat + ", soldseat=" + soldseat + ", dno=" + dno + ", day=" + sdf.format(day) + ", stime="
				+ stime + ", etime=" + etime + ", fno=" + fno + ", place=" + place + ", sday=" + sdf.format(sday) + ", eday=" + sdf.format(eday)
				+ "]";
	}
	
	
}