package kr.happyjob.study.delcus.model;

import java.sql.Date;

public class DelCusModel {
	
	// 배송번호
	private int delNo;
	// 주문번호
	private int coNo;
	// 창고번호
	private int strNo;
	// 제품번호
	private int prodNo;
	// 수주개수
	private int prodCnt;
	// 배송상태 VARCHAR(20) - waiting, loading, complete - GROUP_CODE 확인
	private String delSts;
	// 배송완료 여부
	private int delDsts;
		
	private String name;
	private String loginID;
	private Date coDate;
	private Date coDel;
	private String strMnm;
	private String strName;
	
	private String prodName;
	private String addr;
	private String addrDt;
	private int coCnt;
	private String strAddr;
	private String strDt;
	private String totalAddr;
	private String totalStrAddr;
	
	// 2023-01-15 반
	private int retNo, supNo, retCnt, selPrice, strCnt, returnCnt, retPrice;
	private String retSts, retEsts, supName, supMnm, mfName, prodCate, com_name;
	private Date retPDate, retAdate;
	
	public int getDelNo() {
		return delNo;
	}
	public void setDelNo(int delNo) {
		this.delNo = delNo;
	}
	public int getCoNo() {
		return coNo;
	}
	public void setCoNo(int coNo) {
		this.coNo = coNo;
	}
	public int getStrNo() {
		return strNo;
	}
	public void setStrNo(int strNo) {
		this.strNo = strNo;
	}
	public int getProdNo() {
		return prodNo;
	}
	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}
	public int getProdCnt() {
		return prodCnt;
	}
	public void setProdCnt(int prodCnt) {
		this.prodCnt = prodCnt;
	}
	public String getDelSts() {
		return delSts;
	}
	public void setDelSts(String delSts) {
		this.delSts = delSts;
	}
	public int getDelDsts() {
		return delDsts;
	}
	public void setDelDsts(int delDsts) {
		this.delDsts = delDsts;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	public Date getCoDel() {
		return coDel;
	}
	public void setCoDel(Date coDel) {
		this.coDel = coDel;
	}
	public String getStrMnm() {
		return strMnm;
	}
	public void setStrMnm(String strMnm) {
		this.strMnm = strMnm;
	}
	public String getStrName() {
		return strName;
	}
	public void setStrName(String strName) {
		this.strName = strName;
	}
	
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
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
	public int getCoCnt() {
		return coCnt;
	}
	public void setCoCnt(int coCnt) {
		this.coCnt = coCnt;
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
	public String getTotalAddr() {
		return totalAddr;
	}
	public void setTotalAddr(String totalAddr) {
		this.totalAddr = totalAddr;
	}
	public String getTotalStrAddr() {
		return totalStrAddr;
	}
	public void setTotalStrAddr(String totalStrAddr) {
		this.totalStrAddr = totalStrAddr;
	}
	
	public int getRetNo() {
		return retNo;
	}
	public void setRetNo(int retNo) {
		this.retNo = retNo;
	}
	public int getSupNo() {
		return supNo;
	}
	public void setSupNo(int supNo) {
		this.supNo = supNo;
	}
	public int getRetCnt() {
		return retCnt;
	}
	public void setRetCnt(int retCnt) {
		this.retCnt = retCnt;
	}
	public int getSelPrice() {
		return selPrice;
	}
	public void setSelPrice(int selPrice) {
		this.selPrice = selPrice;
	}
	public int getStrCnt() {
		return strCnt;
	}
	public void setStrCnt(int strCnt) {
		this.strCnt = strCnt;
	}
	public String getRetSts() {
		return retSts;
	}
	public void setRetSts(String retSts) {
		this.retSts = retSts;
	}
	public String getRetEsts() {
		return retEsts;
	}
	public void setRetEsts(String retEsts) {
		this.retEsts = retEsts;
	}
	public String getSupName() {
		return supName;
	}
	public void setSupName(String supName) {
		this.supName = supName;
	}
	public String getSupMnm() {
		return supMnm;
	}
	public void setSupMnm(String supMnm) {
		this.supMnm = supMnm;
	}
	public String getMfName() {
		return mfName;
	}
	public void setMfName(String mfName) {
		this.mfName = mfName;
	}
	public String getProdCate() {
		return prodCate;
	}
	public void setProdCate(String prodCate) {
		this.prodCate = prodCate;
	}
	public String getCom_name() {
		return com_name;
	}
	public void setCom_name(String com_name) {
		this.com_name = com_name;
	}
	public Date getRetPDate() {
		return retPDate;
	}
	public void setRetPDate(Date retPDate) {
		this.retPDate = retPDate;
	}
	public int getReturnCnt() {
		return returnCnt;
	}
	public void setReturnCnt(int returnCnt) {
		this.returnCnt = returnCnt;
	}
	public int getRetPrice() {
		return retPrice;
	}
	public void setRetPrice(int retPrice) {
		this.retPrice = retPrice;
	}
	
	public Date getRetAdate() {
		return retAdate;
	}
	public void setRetAdate(Date retAdate) {
		this.retAdate = retAdate;
	}
	@Override
	public String toString() {
		return "DelCusModel [delNo=" + delNo + ", coNo=" + coNo + ", strNo=" + strNo + ", prodNo=" + prodNo
				+ ", prodCnt=" + prodCnt + ", delSts=" + delSts + ", delDsts=" + delDsts + ", name=" + name
				+ ", loginID=" + loginID + ", coDate=" + coDate + ", coDel=" + coDel + ", strMnm=" + strMnm
				+ ", strName=" + strName + ", prodName=" + prodName + ", addr=" + addr + ", addrDt=" + addrDt
				+ ", coCnt=" + coCnt + ", strAddr=" + strAddr + ", strDt=" + strDt + ", totalAddr=" + totalAddr
				+ ", totalStrAddr=" + totalStrAddr + ", retNo=" + retNo + ", supNo=" + supNo + ", retCnt=" + retCnt
				+ ", selPrice=" + selPrice + ", strCnt=" + strCnt + ", returnCnt=" + returnCnt + ", retPrice="
				+ retPrice + ", retSts=" + retSts + ", retEsts=" + retEsts + ", supName=" + supName + ", supMnm="
				+ supMnm + ", mfName=" + mfName + ", prodCate=" + prodCate + ", com_name=" + com_name + ", retPDate="
				+ retPDate + ", getDelNo()=" + getDelNo() + ", getCoNo()=" + getCoNo() + ", getStrNo()=" + getStrNo()
				+ ", getProdNo()=" + getProdNo() + ", getProdCnt()=" + getProdCnt() + ", getDelSts()=" + getDelSts()
				+ ", getDelDsts()=" + getDelDsts() + ", getName()=" + getName() + ", getLoginID()=" + getLoginID()
				+ ", getCoDate()=" + getCoDate() + ", getCoDel()=" + getCoDel() + ", getStrMnm()=" + getStrMnm()
				+ ", getStrName()=" + getStrName() + ", getProdName()=" + getProdName() + ", getAddr()=" + getAddr()
				+ ", getAddrDt()=" + getAddrDt() + ", getCoCnt()=" + getCoCnt() + ", getStrAddr()=" + getStrAddr()
				+ ", getStrDt()=" + getStrDt() + ", getTotalAddr()=" + getTotalAddr() + ", getTotalStrAddr()="
				+ getTotalStrAddr() + ", getRetNo()=" + getRetNo() + ", getSupNo()=" + getSupNo() + ", getRetCnt()="
				+ getRetCnt() + ", getSelPrice()=" + getSelPrice() + ", getStrCnt()=" + getStrCnt() + ", getRetSts()="
				+ getRetSts() + ", getRetEsts()=" + getRetEsts() + ", getSupName()=" + getSupName() + ", getSupMnm()="
				+ getSupMnm() + ", getMfName()=" + getMfName() + ", getProdCate()=" + getProdCate() + ", getCom_name()="
				+ getCom_name() + ", getRetPDate()=" + getRetPDate() + ", getReturnCnt()=" + getReturnCnt()
				+ ", getRetPrice()=" + getRetPrice() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}

	
	
	

}
