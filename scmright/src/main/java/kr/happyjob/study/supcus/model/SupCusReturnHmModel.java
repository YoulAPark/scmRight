package kr.happyjob.study.supcus.model;

import java.sql.Date;

public class SupCusReturnHmModel{
	

	private int retNo;
	private String loginID;
	private Date retADate;
	private String retEsts;
	private String prodName;
	public SupCusReturnHmModel() {
		super();
	}
	public SupCusReturnHmModel(int retNo, String loginID, Date retADate, String retEsts, String prodName) {
		super();
		this.retNo = retNo;
		this.loginID = loginID;
		this.retADate = retADate;
		this.retEsts = retEsts;
		this.prodName = prodName;
	}
	public int getRetNo() {
		return retNo;
	}
	public void setRetNo(int retNo) {
		this.retNo = retNo;
	}
	public String getLoginID() {
		return loginID;
	}
	public void setLoginID(String loginID) {
		this.loginID = loginID;
	}
	public Date getRetADate() {
		return retADate;
	}
	public void setRetADate(Date retADate) {
		this.retADate = retADate;
	}
	public String getRetEsts() {
		return retEsts;
	}
	public void setRetEsts(String retEsts) {
		this.retEsts = retEsts;
	}
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	@Override
	public String toString() {
		return "SupCusReturnHmModel [retNo=" + retNo + ", loginID=" + loginID + ", retADate=" + retADate + ", retEsts="
				+ retEsts + ", prodName=" + prodName + "]";
	}
	

}
