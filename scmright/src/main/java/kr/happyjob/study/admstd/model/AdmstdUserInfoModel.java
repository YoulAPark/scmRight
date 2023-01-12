package kr.happyjob.study.admstd.model;

import java.sql.Date;

public class AdmstdUserInfoModel {
	
	// 사용자ID VARCHAR(50)
	private String loginID;
	
	// 비밀번호 VARCHAR(50)
	private String password;
	
	// 사용자구분 VARCHAR(1)
	// A : 관리자
	// B : 배송담당자
	// C : 고객
	// D : 구매담당자
	// E : 회사임원
	private String user_type;
	
	// 이름 VARCHAR(50)
	private String name;
	
	// 연락처 VARCHAR(4)
	private String hp1;
	private String hp2;
	private String hp3;
	
	// 이메일 VARCHAR(100)
	private String email;
	
	// 가입일자 DATE
	private Date regdate;
	
	// 회사명 VARCHAR(50)
	private String com_name;
	
	// 우편번호 VARCHAR(8)
	private String postalCode;
	
	// 주소 VARCHAR(50)
	private String addr;
	
	// 상세주소 VARCHAR(200)
	private String addrDt;
	
	// 은행명 VARCHAR(30) 
	// tb_group_code와 연계되어져 있으니 확인할 것
	private String bankName;
	
	// 계좌번호 VARCHAR(50)
	private String bankNo;

	// chaCD : SCM담당자, 배송담당자, 기업고객, 구매담당자, 회사임원, 미승인회원
	private String chaCD;
	
	// divCD : 내부직원, 외부직원
	private String divCD;

	// getter, setter 사용
	public String getLoginID() {
		return loginID;
	}

	public void setLoginID(String loginID) {
		this.loginID = loginID;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUser_type() {
		return user_type;
	}

	public void setUser_type(String user_type) {
		this.user_type = user_type;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getHp1() {
		return hp1;
	}

	public void setHp1(String hp1) {
		this.hp1 = hp1;
	}

	public String getHp2() {
		return hp2;
	}

	public void setHp2(String hp2) {
		this.hp2 = hp2;
	}

	public String getHp3() {
		return hp3;
	}

	public void setHp3(String hp3) {
		this.hp3 = hp3;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public String getCom_name() {
		return com_name;
	}

	public void setCom_name(String com_name) {
		this.com_name = com_name;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getAddrDt() {
		return addrDt;
	}

	public void setAddrDt(String addrDt) {
		this.addrDt = addrDt;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getBankNo() {
		return bankNo;
	}

	public void setBankNo(String bankNo) {
		this.bankNo = bankNo;
	}

	public String getChaCD() {
		return chaCD;
	}

	public void setChaCD(String chaCD) {
		this.chaCD = chaCD;
	}

	public String getDivCD() {
		return divCD;
	}

	public void setDivCD(String divCD) {
		this.divCD = divCD;
	}

	// toString() 사용
	public String toString() {
		return "AdmstdUserInfoModel [loginID=" + loginID + ", password=" + password + ", user_type=" + user_type
				+ ", name=" + name + ", hp1=" + hp1 + ", hp2=" + hp2 + ", hp3=" + hp3 + ", email=" + email
				+ ", regdate=" + regdate + ", com_name=" + com_name + ", postalCode=" + postalCode + ", addr=" + addr
				+ ", addrDt=" + addrDt + ", bankName=" + bankName + ", bankNo=" + bankNo + ", chaCD=" + chaCD
				+ ", divCD=" + divCD + "]";
	}

}
