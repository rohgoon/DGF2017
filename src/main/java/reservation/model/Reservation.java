package reservation.model;

import java.sql.Time;

public class Reservation {
	private int rno;
	private int uno;
	private int sno;
	private Time rtime;
	
	public Reservation() {
		// TODO Auto-generated constructor stub
	}

	public Reservation(int rno, int uno, int sno, Time rtime) {
		super();
		this.rno = rno;
		this.uno = uno;
		this.sno = sno;
		this.rtime = rtime;
	}

	public Reservation(int uno, int sno, Time rtime) {
		super();
		this.uno = uno;
		this.sno = sno;
		this.rtime = rtime;
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

	public Time getRtime() {
		return rtime;
	}

	public void setRtime(Time rtime) {
		this.rtime = rtime;
	}
	
	
}
