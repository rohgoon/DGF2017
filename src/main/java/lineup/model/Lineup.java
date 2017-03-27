package lineup.model;

public class Lineup {
	private int lno;
	private int dno;
	private String aname;
	private String contents;
	private String song1;
	private String song2;
	private String song3;
	private String file;
	
	public Lineup() {}

	

	public Lineup(int lno, int dno, String aname, String contents, String song1, String song2, String song3,
			String file) {
		super();
		this.lno = lno;
		this.dno = dno;
		this.aname = aname;
		this.contents = contents;
		this.song1 = song1;
		this.song2 = song2;
		this.song3 = song3;
		this.file = file;
	}
	
	



	public Lineup(int dno, String aname, String contents, String song1, String song2, String song3, String file) {
		super();
		this.dno = dno;
		this.aname = aname;
		this.contents = contents;
		this.song1 = song1;
		this.song2 = song2;
		this.song3 = song3;
		this.file = file;
	}



	public int getLno() {
		return lno;
	}

	public void setLno(int lno) {
		this.lno = lno;
	}

	public int getDno() {
		return dno;
	}

	public void setDno(int dno) {
		this.dno = dno;
	}

	public String getAname() {
		return aname;
	}

	public void setAname(String aname) {
		this.aname = aname;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public String getSong1() {
		return song1;
	}

	public void setSong1(String song1) {
		this.song1 = song1;
	}

	public String getSong2() {
		return song2;
	}

	public void setSong2(String song2) {
		this.song2 = song2;
	}

	public String getSong3() {
		return song3;
	}

	public void setSong3(String song3) {
		this.song3 = song3;
	}
	
	

	public String getFile() {
		return file;
	}



	public void setFile(String file) {
		this.file = file;
	}

	@Override
	public String toString() {
		return "Lineup [lno=" + lno + ", dno=" + dno + ", aname=" + aname + ", contents=" + contents + ", song1="
				+ song1 + ", song2=" + song2 + ", song3=" + song3 + ", file=" + file + "]";
	}

}
