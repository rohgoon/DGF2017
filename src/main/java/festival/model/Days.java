package festival.model;

import java.sql.Time;
import java.util.Date;

public class Days {
	private int dno;
	private int fno;
	private Date days;
	private Time sTime;
	private Time eTime;
	public Days() {
		super();
	}
	public Days(int dno, int fno, Date days, Time sTime, Time eTime) {
		super();
		this.dno = dno;
		this.fno = fno;
		this.days = days;
		this.sTime = sTime;
		this.eTime = eTime;
	}
	public Days(int fno, Date days, Time sTime, Time eTime) {
		super();
		this.fno = fno;
		this.days = days;
		this.sTime = sTime;
		this.eTime = eTime;
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
	public Date getDays() {
		return days;
	}
	public void setDays(Date days) {
		this.days = days;
	}
	public Time getsTime() {
		return sTime;
	}
	public void setsTime(Time sTime) {
		this.sTime = sTime;
	}
	public Time geteTime() {
		return eTime;
	}
	public void seteTime(Time eTime) {
		this.eTime = eTime;
	}
	
	
}
