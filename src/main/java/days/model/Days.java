package days.model;

import java.sql.Time;
import java.util.Date;

public class Days {
	private int dno;
	private int fno;
	private Date day;
	private Time stime;
	private Time etime;
	
	public Days() {}

	public Days(int dno, int fno, Date day, Time stime, Time etime) {
		this.dno = dno;
		this.fno = fno;
		this.day = day;
		this.stime = stime;
		this.etime = etime;
	}
	
	public Days(int fno, Date day, Time stime, Time etime) {
		this.fno = fno;
		this.day = day;
		this.stime = stime;
		this.etime = etime;
	}

	public int getDno() {
		return dno;
	}
	public void setDno(int dno) {
		this.dno = dno;
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
	
	@Override
	public String toString() {
		return "Days [dno=" + dno + ", fno=" + fno + ", day=" + day + ", stime=" + stime + ", etime=" + etime + "]";
	}
	
	
}
