package kr.happyjob.study.exeacc.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RefundConfirmModel {

	// refund 테이블 프라이머리키3개
	private int retNo;
	private int supNo;
	private int coNo;
	private int strNo;
	
	
	
	//임원페이지 화면에 보여줄 내용
		private String com_name;
		private String prodName;
		private Date coDate;
		private Date retADate;
		private long coCnt;
		private long retCnt;
		private long total_price;
		
		//덤으로 가져옴
		private String loginID;
	
		public String getLoginID() {
			return loginID;
		}
		public void setLoginID(String loginID) {
			this.loginID = loginID;
		}
		public int getRetNo() {
			return retNo;
		}
		public void setRetNo(int retNo) {
			this.retNo = retNo;
		}
		public int getcoNo() {
			return coNo;
		}
		public void setcoNo(int coNo) {
			this.coNo = coNo;
		}
		public int getsupNo() {
			return supNo;
		}
		public void setsupNo(int supNo) {
			this.supNo = supNo;
		}
		public int getStrNo() {
			return strNo;
		}
		public void setStrNo(int strNo) {
			this.strNo = strNo;
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
		public Date getCoDate() {
			return coDate;
		}
		public void setCoDate(Date coDate) {
			this.coDate = coDate;
		}
		public Date getRetADate() {
			return retADate;
		}
		public void setRetADate(Date retADate) {
			this.retADate = retADate;
		}
		public void setProdName(String prodName) {
			this.prodName = prodName;
		}
		public long getCoCnt() {
			return coCnt;
		}
		public void setCoCnt(long coCnt) {
			this.coCnt = coCnt;
		}
		public long getRetCnt() {
			return retCnt;
		}
		public void setRetCnt(long retCnt) {
			this.retCnt = retCnt;
		}
		public long getTotal_price() {
			return total_price;
		}
		public void setTotal_price(long total_price) {
			this.total_price = total_price;
		}
		
	
	
	
}
