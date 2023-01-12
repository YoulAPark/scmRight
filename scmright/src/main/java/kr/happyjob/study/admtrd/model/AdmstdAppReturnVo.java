package kr.happyjob.study.admtrd.model;

import java.util.Date;

public class AdmstdAppReturnVo {

	private String com_name, prodName;
	private int retNo, prodNo, coCnt, retCnt, retPrice, retEsts;
	private Date retADate;
	
	public AdmstdAppReturnVo() {}

	public int getRetEsts() {
		return retEsts;
	}

	public void setRetEsts(int retEsts) {
		this.retEsts = retEsts;
	}
	
	public String getCom_name() {
		return com_name;
	}

	public void setCom_name(String com_name) {
		this.com_name = com_name;
	}

	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	public int getRetNo() {
		return retNo;
	}

	public void setRetNo(int retNo) {
		this.retNo = retNo;
	}

	public int getProdNo() {
		return prodNo;
	}

	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}

	public int getCoCnt() {
		return coCnt;
	}

	public void setCoCnt(int coCnt) {
		this.coCnt = coCnt;
	}

	public int getRetCnt() {
		return retCnt;
	}

	public void setRetCnt(int retCnt) {
		this.retCnt = retCnt;
	}

	public int getRetPrice() {
		return retPrice;
	}

	public void setRetPrice(int retPrice) {
		this.retPrice = retPrice;
	}

	public Date getRetADate() {
		return retADate;
	}

	public void setRetADate(Date retADate) {
		this.retADate = retADate;
	}

	public AdmstdAppReturnVo(String com_name, String prodName, int retNo, int prodNo, int coCnt, int retCnt,
			int retPrice, int retEsts, Date retADate) {
		super();
		this.com_name = com_name;
		this.prodName = prodName;
		this.retNo = retNo;
		this.prodNo = prodNo;
		this.coCnt = coCnt;
		this.retCnt = retCnt;
		this.retPrice = retPrice;
		this.retEsts = retEsts;
		this.retADate = retADate;
	}

	@Override
	public String toString() {
		return "AdmstdAppReturnVo [com_name=" + com_name + ", prodName=" + prodName + ", retNo=" + retNo + ", prodNo="
				+ prodNo + ", coCnt=" + coCnt + ", retCnt=" + retCnt + ", retPrice=" + retPrice + ", retEsts=" + retEsts
				+ ", retADate=" + retADate + "]";
	}
	
}
