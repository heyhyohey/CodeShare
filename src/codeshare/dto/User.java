package codeshare.dto;

public class User {
	private String id; // 아이디
	private String pw; // 비번
	private String lan; // 언어
	private String email; // 이메일
	private String intro; // 자기소개서

	public User() {
		super();
	}

	// 아이디 불러오기
	public String getId() {
		return id;
	}

	// 아이디 저장
	public void setId(String id) {
		this.id = id;
	}

	// 비밀번호 불러오기
	public String getPw() {
		return pw;
	}

	// 비밀번호 저장
	public void setPw(String pw) {
		this.pw = pw;
	}

	// 프로그래밍 언어 불러오기
	public String getLan() {
		return id;
	}

	// 프로그래밍 언어 저장
	public void setLan(String lan) {
		this.lan = lan;
	}
	
	// 이메일 불러오기
	public String getEmail() {
		return email;
	}

	// 이메일 저장
	public void setEmail(String email) {
		this.email = email;
	}

	// 자기소개서 불러오기
	public String getIntro() {
		return id;
	}

	// 자기소개서 저장
	public void setIntro(String intro) {
		this.intro = intro;
	}
}
