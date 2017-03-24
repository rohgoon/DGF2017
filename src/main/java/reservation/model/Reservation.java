package reservation.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Reservation {
	private int rno;
	private int uno;
	private int sno;
	private Date rtime;
	//private int countTicket;
	
	public Reservation() {
		// TODO Auto-generated constructor stub
	}

	public Reservation(int rno, int uno, int sno, Date rtime) {
		super();
		this.rno = rno;
		this.uno = uno;
		this.sno = sno;
		this.rtime = rtime;
	}

	public Reservation(int uno, int sno, Date rtime) {
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

	public Date getRtime(){
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

	/*public int getCount() {
		return countTicket;
	}

	public void setCount(int count) {
		this.countTicket = count;
	}*/
	
	
}