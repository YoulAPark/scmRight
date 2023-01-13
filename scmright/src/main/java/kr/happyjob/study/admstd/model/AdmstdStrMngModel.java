package kr.happyjob.study.admstd.model;

public class AdmstdStrMngModel {
	
	private int strNo;
	private String strName;
	private String strAddr;
	private String strDt;
	private String name;
	private String email;
	private int hp1,hp2,hp3;
	private String loginID;
	private String strPcode;
	private String strMnm;
	private String totalAddr;
	private String totalHp;
	
	public int getStrNo() {
		return strNo;
	}
	public void setStrNo(int strNo) {
		this.strNo = strNo;
	}
	public String getStrName() {
		return strName;
	}
	public void setStrName(String strName) {
		this.strName = strName;
	}
	public String getStrAddr() {
		return strAddr;
	}
	public void setStrAddr(String strAddr) {
		this.strAddr = strAddr;
	}
	public String getStrDt() {
		return strDt;
	}
	public void setStrDt(String strDt) {
		this.strDt = strDt;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getHp1() {
		return hp1;
	}
	public void setHp1(int hp1) {
		this.hp1 = hp1;
	}
	public int getHp2() {
		return hp2;
	}
	public void setHp2(int hp2) {
		this.hp2 = hp2;
	}
	public int getHp3() {
		return hp3;
	}
	public void setHp3(int hp3) {
		this.hp3 = hp3;
	}
	public String getLoginID() {
		return loginID;
	}
	public void setLoginID(String loginID) {
		this.loginID = loginID;
	}
	public String getStrPcode() {
		return strPcode;
	}
	public void setStrPcode(String strPcode) {
		this.strPcode = strPcode;
	}
	public String getStrMnm() {
		return strMnm;
	}
	public void setStrMnm(String strMnm) {
		this.strMnm = strMnm;
	}
	public String getTotalAddr() {
		return totalAddr;
	}
	public String getTotalHp() {
		return totalHp;
	}
	public void setTotalHp(String totalHp) {
		this.totalHp = totalHp;
	}
	public void setTotalAddr(String totalAddr) {
		this.totalAddr = totalAddr;
	}
	
	@Override
	public String toString() {
		return "AdmstdStrMngModel [strNo=" + strNo + ", strName=" + strName + ", strAddr=" + strAddr + ", strDt="
				+ strDt + ", name=" + name + ", email=" + email + ", hp1=" + hp1 + ", hp2=" + hp2 + ", hp3=" + hp3
				+ ", loginID=" + loginID + ", strPcode=" + strPcode + ", strMnm=" + strMnm + ", totalAddr=" + totalAddr
				+ ", totalHp=" + totalHp + "]";
	}
		
}
