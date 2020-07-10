package leeyounjeong.book.qa.domain;

import java.sql.Date;

public class Qa {
	private int qaNum;   //글번호
	private String qaTitle;    //글제목
	private String qaContent;  //글내용
	private Date qaDate;  	   //작성일    
	private String qaAnswer; 
	private String userId;	   //작성자
	private String password;   //비밀번호
	
	public Qa() {}
	
	public Qa(int qaNum, String qaTitle, String qaContent, Date qaDate, String qaAnswer, String userId, String password) {
		this.qaNum = qaNum;
		this.qaTitle = qaTitle;
		this.qaContent = qaContent;
		this.qaDate = qaDate;
		this.qaAnswer = qaAnswer;
		this.userId = userId;
		this.password = password;
	}

	public String getQaAnswer() {
		return qaAnswer;
	}

	public void setQaAnswer(String qaAnswer) {
		this.qaAnswer = qaAnswer;
	}

	public int getQaNum() {
		return qaNum;
	}

	public void setQaNum(int qaNum) {
		this.qaNum = qaNum;
	}

	public String getQaTitle() {
		return qaTitle;
	}

	public void setQaTitle(String qaTitle) {
		this.qaTitle = qaTitle;
	}

	public String getQaContent() {
		return qaContent;
	}

	public void setQaContent(String qaContent) {
		this.qaContent = qaContent;
	}

	public Date getQaDate() {
		return qaDate;
	}

	public void setQaDate(Date qaDate) {
		this.qaDate = qaDate;
	}
	

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return String.format("%d, %s, %s, %s, %s, %s, %s, %s", qaNum, qaTitle, qaContent, qaDate, qaAnswer, userId, password);
	}
}
