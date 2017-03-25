package festival.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class Festival {
	private int fno;
	private String place;
	private Date sday;
	private Date eday;
	
	
	public Festival() {}

	public Festival(int fno, String place, Date sday, Date eday) {
		this.fno = fno;
		this.place = place;
		this.sday = sday;
		this.eday = eday;
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
		return sdf.format(sday);
	}

	public void setSday(Date sday) {
		this.sday = sday;
	}

	public Date getEday() {
		return eday;
	}
	public String getEdayString() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(eday);
	}

	public void setEday(Date eday) {
		this.eday = eday;
	}

	@Override
	public String toString() {
		return "Festival [fno=" + fno + ", place=" + place + ", sday=" + sday + ", eday=" + eday + "]";
	}
	
}
