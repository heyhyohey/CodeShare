package codeshare.dto;

import java.sql.Date;

public class Request {
	private String id; // 아이디
	private String title; // 제목
	private String content; // 내용
	private Date date; // 자기소개서
	private boolean state; // 상태

	public Request() {
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
	
	// 제목 불러오기
	public String getTitle() {
		return title;
	}

	// 제목 저장
	public void setTitle(String title) {
		this.title = title;
	}
	
	// 내용 불러오기
	public String getContent() {
		return content;
	}

	// 내용 저장
	public void setContent(String content) {
		this.content = content;
	}
	
	// 날짜 불러오기
	public Date getDate() {
		return date;
	}

	// 날짜 저장
	public void setDate(Date date) {
		this.date = date;
	}
	
	// 상태 저장
	public void setState(boolean state) {
		this.state = state;
	}
	
	// 상태 불러오기
	public boolean getState() {
		return state;
	}
}
