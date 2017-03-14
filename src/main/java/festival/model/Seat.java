package festival.model;

public class Seat {
	private int sno;
	private int dno;
	private String grade;
	private int price;
	private int max;
	private int sold;
	
	public Seat() {
		super();
	}
	public Seat(int sno, int dno, String grade, int price, int max, int sold) {
		super();
		this.sno = sno;
		this.dno = dno;
		this.grade = grade;
		this.price = price;
		this.max = max;
		this.sold = sold;
	}
	public Seat(int dno, String grade, int price, int max, int sold) {
		super();
		this.dno = dno;
		this.grade = grade;
		this.price = price;
		this.max = max;
		this.sold = sold;
	}
	public int getSno() {
		return sno;
	}
	public void setSno(int sno) {
		this.sno = sno;
	}
	public int getDno() {
		return dno;
	}
	public void setDno(int dno) {
		this.dno = dno;
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
	public int getMax() {
		return max;
	}
	public void setMax(int max) {
		this.max = max;
	}
	public int getSold() {
		return sold;
	}
	public void setSold(int sold) {
		this.sold = sold;
	}
	
	
}
