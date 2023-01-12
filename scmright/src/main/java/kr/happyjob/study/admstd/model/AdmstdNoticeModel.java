package kr.happyjob.study.admstd.model;

import java.sql.Date;

public class AdmstdNoticeModel {
	
	// 공지사항 번호
	private int ntcNo;
	
	// 사용자ID VARCHAR(50)
	private String loginID;
	
	// 파일번호
	private int att_no;
	
	// 공지사항 제목 VARCHAR(100)
	private String title;
	
	// 공지사항 내용 LONGTEXT
	private String contents;
	
	// 공지사항 작성일 (DATETIME) - ex) 2022.12.11 11:33
	private Date reg_date;
	
	// 공지사항 조회수
	private int count;

	public int getNtcNo() {
		return ntcNo;
	}

	public void setNtcNo(int ntcNo) {
		this.ntcNo = ntcNo;
	}

	public String getLoginID() {
		return loginID;
	}

	public void setLoginID(String loginID) {
		this.loginID = loginID;
	}

	public int getAtt_no() {
		return att_no;
	}

	public void setAtt_no(int att_no) {
		this.att_no = att_no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	@Override
	public String toString() {
		return "AdmstdNoticeModel [ntcNo=" + ntcNo + ", loginID=" + loginID + ", att_no=" + att_no + ", title=" + title
				+ ", contents=" + contents + ", reg_date=" + reg_date + ", count=" + count + "]";
	}
	

}
