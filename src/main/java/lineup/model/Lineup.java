package lineup.model;

public class Lineup {
	private int lno;
	private int dno;
	private String aname;
	
	public Lineup() {}

	public Lineup(int lno, int dno, String aname) {
		this.lno = lno;
		this.dno = dno;
		this.aname = aname;
	}
	
	public Lineup(int dno, String aname) {
		this.dno = dno;
		this.aname = aname;
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

	@Override
	public String toString() {
		return "Lineup [lno=" + lno + ", dno=" + dno + ", aname=" + aname + "]";
	}
	
}
