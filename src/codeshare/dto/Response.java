package codeshare.dto;

import java.sql.Timestamp;

public class Response {
	private int num;  // 글 번호
	private String id; // 아이디
	private String content; // 내용
	private Timestamp date; // 자기소개서

	public Response() {
		super();
	}

	// 글 번호 불러오기
	public int getNum() {
		return num;
	}

	// 글 번호 저장
	public void setNum(int num) {
		this.num = num;
	}
		
	// 아이디 불러오기
	public String getId() {
		return id;
	}

	// 아이디 저장
	public void setId(String id) {
		this.id = id;
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
	public Timestamp getDate() {
		return date;
	}

	// 날짜 저장
	public void setDate(Timestamp date) {
		this.date = date;
	}
}
