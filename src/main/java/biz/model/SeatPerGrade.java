package biz.model;

public class SeatPerGrade {
	private String grade;
	private int soldSeat;
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
		return howMuch;
	}

	public void setHowMuch(int howMuch) {
		howMuch *= this.soldSeat;
		this.howMuch = howMuch;
	}

	public String toStringForSPG() {
		return grade + ":" + soldSeat+"석 ";
	}
	public String toStringForPPG() {
		return grade + ":" + howMuch + "원 ";
	}
}
