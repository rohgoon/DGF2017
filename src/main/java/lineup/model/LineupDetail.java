package lineup.model;

import java.sql.Time;
import java.util.Date;

public class LineupDetail {
	private int lno;
	private String aname;
	private String contents;
	private String song1;
	private String song2;
	private String song3;
	private String file;
	private int dno;
	private Date day;
	private Time stime;
	private Time etime;
	private int fno;
	private String place;
	private Date sday;
	private Date eday;
	
	public LineupDetail() {}

	public LineupDetail(int lno, String aname, String contents, String song1, String song2, String song3, String file,
			int dno, Date day, Time stime, Time etime, int fno, String place, Date sday, Date eday) {
		super();
		this.lno = lno;
		this.aname = aname;
		this.contents = contents;
		this.song1 = song1;
		this.song2 = song2;
		this.song3 = song3;
		this.file = file;
		this.dno = dno;
		this.day = day;
		this.stime = stime;
		this.etime = etime;
		this.fno = fno;
		this.place = place;
		this.sday = sday;
		this.eday = eday;
	}

	@Override
	public String toString() {
		return "LineupDetail [lno=" + lno + ", aname=" + aname + ", contents=" + contents + ", song1=" + song1
				+ ", song2=" + song2 + ", song3=" + song3 + ", file=" + file + ", dno=" + dno + ", day=" + day
				+ ", stime=" + stime + ", etime=" + etime + ", fno=" + fno + ", place=" + place + ", sday=" + sday
				+ ", eday=" + eday + "]";
	}
	
}