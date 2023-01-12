package kr.happyjob.study.exesal.model;

public class SalesTopModel {
	
		private String loginID;		//로그인아이디
		private String com_name;	//기업 이름
		private int sales_price;		//총 매출 금액 
		private int rownum;					//기업순위
		
		
		public String getLoginID() {
			return loginID;
		}
		public void setLoginID(String loginID) {
			this.loginID = loginID;
		}
		public String getCom_name() {
			return com_name;
		}
		public void setCom_name(String com_name) {
			this.com_name = com_name;
		}
		public int getSales_price() {
			return sales_price;
		}
		public void setSales_price(int sales_price) {
			this.sales_price = sales_price;
		}
		public int getRank() {
			return rownum;
		}
		public void setRank(int row_num) {
			this.rownum = row_num;
		}
		
		


}
