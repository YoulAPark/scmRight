package kr.happyjob.study.supcus.model;

import java.sql.Date;

public class SupCusOrderHmModel {
	
	private int coNo;
	private String loginID;
	private Date coDate;
	private String coDpsts;
	private String prodName;
	public SupCusOrderHmModel() {
		super();
	}
	public SupCusOrderHmModel(int coNo, String loginID, Date coDate, String coDpsts, String prodName) {
		super();
		this.coNo = coNo;
		this.loginID = loginID;
		this.coDate = coDate;
		this.coDpsts = coDpsts;
		this.prodName = prodName;
	}
	public int getCoNo() {
		return coNo;
	}
	public void setCoNo(int coNo) {
		this.coNo = coNo;
	}
	public String getLoginID() {
		return loginID;
	}
	public void setLoginID(String loginID) {
		this.loginID = loginID;
	}
	public Date getCoDate() {
		return coDate;
	}
	public void setCoDate(Date coDate) {
		this.coDate = coDate;
	}
	public String getCoDpsts() {
		return coDpsts;
	}
	public void setCoDpsts(String coDpsts) {
		this.coDpsts = coDpsts;
	}
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	@Override
	public String toString() {
		return "SupCusOrderHmModel [coNo=" + coNo + ", loginID=" + loginID + ", coDate=" + coDate + ", coDpsts="
				+ coDpsts + ", prodName=" + prodName + "]";
	}
	
	
	
	
	
	

}
