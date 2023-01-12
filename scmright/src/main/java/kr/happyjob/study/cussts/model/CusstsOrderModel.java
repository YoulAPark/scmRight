package kr.happyjob.study.cussts.model;

import java.sql.Date;

public class CusstsOrderModel {
	
	private int coNo; //주문번호
	private int prodNo; //제품번호
	private String loginID; //사용자아이디
	private int coCnt; //주문수량
	private Date coDate; //구매일자
	private Date coDel; //배송희망일자
	private String coSts; //주문현황
	private String coDpsts; //입금상태
	
	private String prodName; //제품 이름
	private int selPrice; //제품 판매 단가
	private String prodCate;
	private String mfName;
	
	private String bankName; //고객 은행 이름
	private String bankNo; //고객 계좌 번호
	private String addr;
	private String addrDt;

	public int getCoNo() {
		return coNo;
	}

	public void setCoNo(int coNo) {
		this.coNo = coNo;
	}

	public int getProdNo() {
		return prodNo;
	}

	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}

	public String getLoginID() {
		return loginID;
	}

	public void setLoginID(String loginID) {
		this.loginID = loginID;
	}

	public int getCoCnt() {
		return coCnt;
	}

	public void setCoCnt(int coCnt) {
		this.coCnt = coCnt;
	}

	public Date getCoDate() {
		return coDate;
	}

	public void setCoDate(Date coDate) {
		this.coDate = coDate;
	}

	public Date getCoDel() {
		return coDel;
	}

	public void setCoDel(Date coDel) {
		this.coDel = coDel;
	}

	public String getCoSts() {
		return coSts;
	}

	public void setCoSts(String coSts) {
		this.coSts = coSts;
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

	public int getSelPrice() {
		return selPrice;
	}

	public void setSelPrice(int selPrice) {
		this.selPrice = selPrice;
	}

	
	public String getProdCate() {
		return prodCate;
	}

	public void setProdCate(String prodCate) {
		this.prodCate = prodCate;
	}
	
	

	public String getMfName() {
		return mfName;
	}

	public void setMfName(String mfName) {
		this.mfName = mfName;
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
	
	
	
	

}
