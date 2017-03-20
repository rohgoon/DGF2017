package biz.model;

public class SeatPerGrade {
	private String grade;
	private int soldSeat;
	private int price;
	private int howMuch;
	public SeatPerGrade() {
		super();
	}
	
	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}
	public int getSoldSeat() {
		return soldSeat;
	}

	public void setSoldSeat(int soldSeat) {
		
		this.soldSeat = soldSeat;
	}

	public int getHowMuch() {
		this.howMuch = price * soldSeat;
		return howMuch;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String toStringForSPG() {
		return grade + ":" + soldSeat+"석(각 "+price+"원) ";
	}
	public String toStringForPPG() {
		this.howMuch = price * soldSeat;
		return grade + ":" + howMuch + "원 ";
	}
}
