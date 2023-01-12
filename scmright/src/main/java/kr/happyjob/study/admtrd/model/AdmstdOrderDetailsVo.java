package kr.happyjob.study.admtrd.model;

import java.util.Date;

public class AdmstdOrderDetailsVo {
	
	private int coNo, prodNo, strCnt, delPrice, coCnt, coDpsts, searchlistcnt, prodCnt;
	private String coSts, com_name, prodName;
	private Date coDate, coDel;
	
	public int getcoNo() {
		return coNo;
	}
	public void setcoNo(int coNo) {
		this.coNo = coNo;
	}
	public int getprodCnt() {
		return prodCnt;
	}
	public void setprodCnt(int prodCnt) {
		this.prodCnt = prodCnt;
	}
	public int getprodNo() {
		return prodNo;
	}
	public void setprodNo(int prodNo) {
		this.prodNo = prodNo;
	}
	public int getStrCnt() {
		return strCnt;
	}
	public void setStrCnt(int strCnt) {
		this.strCnt = strCnt;
	}
	public int getDelPrice() {
		return delPrice;
	}
	public void setDelPrice(int delPrice) {
		this.delPrice = delPrice;
	}
	public int getCoCnt() {
		return coCnt;
	}
	public void setCoCnt(int coCnt) {
		this.coCnt = coCnt;
	}
	public String getCoSts() {
		return coSts;
	}
	public void setCoSts(String coSts) {
		this.coSts = coSts;
	}
	public int getsearchlistcnt() {
		return searchlistcnt;
	}
	public void setsearchlistcnt(int searchlistcnt) {
		this.searchlistcnt = searchlistcnt;
	}
	public int getCoDpsts() {
		return coDpsts;
	}
	public void setCoDpsts(int coDpsts) {
		this.coDpsts = coDpsts;
	}
	public Date getCoDate() {
		return coDate;
	}
	public void setCoDate(Date coDate) {
		this.coDate = coDate;
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
	public Date getCoDel() {
		return coDel;
	}
	public void setCoDel(Date coDel) {
		this.coDel = coDel;
	}
	
	public AdmstdOrderDetailsVo() {}
	
	public AdmstdOrderDetailsVo(int coNo, int prodNo, int strCnt, int delPrice, int coCnt, String coSts, int coDpsts, int searchlistcnt, Date coDate,
			int prodCnt, String com_name, String prodName, Date coDel) {
		super();
		this.coNo = coNo;
		this.prodNo = prodNo;
		this.prodCnt = prodCnt;
		this.strCnt = strCnt;
		this.delPrice = delPrice;
		this.coCnt = coCnt;
		this.coSts = coSts;
		this.coDpsts = coDpsts;
		this.searchlistcnt = searchlistcnt;
		this.coDate = coDate;
		this.com_name = com_name;
		this.prodName = prodName;
		this.coDel = coDel;
	}
	
	@Override
	public String toString() {
		return "AdmstdOrderDetailsVo [coNo=" + coNo + "prodCnt=" + prodCnt +"prodNo=" + prodNo +" , strCnt=" + strCnt + ", delPrice=" + delPrice + ", coCnt="
				+ coCnt + ", coSts=" + coSts + ", coDpsts=" + coDpsts + ", searchlistcnt=" + searchlistcnt + ", coDate=" + coDate + ", com_name=" + com_name
				+ ", prodName=" + prodName + ", coDel=" + coDel + "]";
	}
	
}
