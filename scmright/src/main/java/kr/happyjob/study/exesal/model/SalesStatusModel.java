package kr.happyjob.study.exesal.model;

public class SalesStatusModel {
	
	private String searchvalue; // 검색어
	private String com_name;	//기업 이름
	private int sales_price;		//총 매출 금액 
	private int profit_price;		//순수익금액
	private String prodName;		//제품명
	private int sales_price2;		//거래금액
	private String coDate;			//거래날짜
	private int profit_price2;		//수익금액
	private String loginID;
	
	
	public String getLoginID() {
		return loginID;
	}
	public void setLoginID(String loginID) {
		this.loginID = loginID;
	}
	public String getSearchvalue() {
		return searchvalue;
	}
	public void setSearchvalue(String searchvalue) {
		this.searchvalue = searchvalue;
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
	public int getProfit_price() {
		return profit_price;
	}
	public void setProfit_price(int profit_price) {
		this.profit_price = profit_price;
	}
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	public int getSales_price2() {
		return sales_price2;
	}
	public void setSales_price2(int sales_price2) {
		this.sales_price2 = sales_price2;
	}
	public String getCoDate() {
		return coDate;
	}
	public void setCoDate(String coDate) {
		this.coDate = coDate;
	}
	public int getProfit_price2() {
		return profit_price2;
	}
	public void setProfit_price2(int profit_price2) {
		this.profit_price2 = profit_price2;
	}

}
