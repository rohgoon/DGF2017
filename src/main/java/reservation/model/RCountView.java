package reservation.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class RCountView {
	private int rno;
	private int uno;
	private int sno;
	private int howMany;
	private int fno;
	private Date day;
	private String grade;
	private int price;
	private Date rtime;
	public RCountView() {
		super();
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
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public int getHowMany() {
		return howMany;
	}
	public void setHowMany(int howMany) {
		this.howMany = howMany;
	}
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public Date getDay() {
		return day;
	}
	public String getDayString(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(day);
	}
	public void setDay(Date day) {
		this.day = day;
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
	public Date getRtime() {
		return rtime;
	}
	public String getRtimeString(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String daySdf = sdf.format(rtime);
		return daySdf;
	}
	public void setRtime(Date rtime) {
		this.rtime = rtime;
	}
	
	
}
