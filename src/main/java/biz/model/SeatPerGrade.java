package biz.model;

public class SeatPerGrade {
	private String grade;
	private int howMany;
	private int howMuch;
	public SeatPerGrade() {
		super();
	}
	public SeatPerGrade(String grade, int howMany, int howMuch) {
		super();
		this.grade = grade;
		this.howMany = howMany;
		this.howMuch = howMuch;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public int getHowMany() {
		return howMany;
	}
	public void setHowMany(int howMany) {
		this.howMany = howMany;
	}
	public int getHowMuch() {
		return howMuch;
	}
	public void setHowMuch(int howMuch) {
		this.howMuch = howMuch;
	}
	public String toStringForSPG() {
		return grade + ":" + howMany+" ";
	}
	public String toStringForPPG() {
		return grade + ":" + howMuch + "원 ";
	}
}
