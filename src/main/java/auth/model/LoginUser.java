package auth.model;

public class LoginUser {
	private String id;
	private String name;
	public LoginUser(String id, String name) {
		super();
		this.id = id;
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public String getName() {
		return name;
	}
}
