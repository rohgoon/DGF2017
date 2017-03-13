package auth.model;

public class LoginUser {
	private String id;
	private String uname;
	public LoginUser(String id, String uname) {
		super();
		this.id = id;
		this.uname = uname;
	}
	public String getId() {
		return id;
	}
	public String getName() {
		return uname;
	}
}
