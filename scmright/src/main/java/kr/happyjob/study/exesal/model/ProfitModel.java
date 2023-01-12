package kr.happyjob.study.exesal.model;

public class ProfitModel {
	
	
	
	private String ID;					//아이디
	private String searchvalue; // 검색어
	private String company;	//기업 이름
	private int profit;                //총매출
	private int loss;               		 //총환불
	private int pureP;                //총순수익
	
	private String  prodName; //제품명
	private String  com_name; //기업 이름
	private String codate;        //거래날짜
	
	public String getID() {
		return ID;
	}
	public void setID(String iD) {
		ID = iD;
	}
	public String getSearchvalue() {
		return searchvalue;
	}
	public void setSearchvalue(String searchvalue) {
		this.searchvalue = searchvalue;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public int getProfit() {
		return profit;
	}
	public void setProfit(int profit) {
		this.profit = profit;
	}
	public int getLoss() {
		return loss;
	}
	public void setLoss(int loss) {
		this.loss = loss;
	}
	public int getPureP() {
		return pureP;
	}
	public void setPureP(int pureP) {
		this.pureP = pureP;
	}
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	public String getCom_name() {
		return com_name;
	}
	public void setCom_name(String com_name) {
		this.com_name = com_name;
	}
	public String getCodate() {
		return codate;
	}
	public void setCodate(String codate) {
		this.codate = codate;
	}
	
	

	
	
		
		
		
}
