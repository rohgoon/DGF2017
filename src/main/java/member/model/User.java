package member.model;

import java.util.Date;

public class User {
	
	private int uno;
	private String id;
	private String uname;
	private String upassword;
	private String email;
	private String phone;
	private Date regDate;	
	
	public User() {
		// TODO Auto-generated constructor stub
	}
	
	public User(int uno, String id, String uname, String upassword, String email, String phone, Date regDate) {
		super();
		this.uno = uno;
		this.id = id;
		this.uname = uname;
		this.upassword = upassword;
		this.email = email;
		this.phone = phone;
		this.regDate = regDate;
	}
	public User(String id, String uname, String upassword, String email, String phone, Date regDate) {
		super();
		this.id = id;
		this.uname = uname;
		this.upassword = upassword;
		this.email = email;
		this.phone = phone;
		this.regDate = regDate;
	}
	public int getUno() {
		return uno;
	}
	public void setUno(int uno) {
		this.uno = uno;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUpassword() {
		return upassword;
	}
	public void setUpassword(String upassword) {
		this.upassword = upassword;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	@Override
	public String toString() {
		return "User [uno=" + uno + ", id=" + id + ", uname=" + uname + ", upassword=" + upassword + ", email=" + email
				+ ", phone=" + phone + ", regDate=" + regDate + "]";
	}
	
	
}
