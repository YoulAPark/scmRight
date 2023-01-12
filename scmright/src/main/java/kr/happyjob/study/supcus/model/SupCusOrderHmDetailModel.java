package kr.happyjob.study.supcus.model;

public class SupCusOrderHmDetailModel {
	
    /*select coNo,prodName,coCnt,delPrice,(delPrice*coCnt),tb_userinfo.loginID,bankNo from tb_cOrder  LEFT JOIN tb_userinfo 
	   ON tb_cOrder.loginID=tb_userinfo.loginID LEFT JOIN tb_product 
ON tb_cOrder.prodNo=tb_product.prodNo;*/
    
    private int coNo;
    private String prodName;
    private int coCnt;
    private int delPrice;
    private String loginID;
    private String bankNo;
    
    
    
    
	public SupCusOrderHmDetailModel() {
		super();
	}




	public SupCusOrderHmDetailModel(int coNo, String prodName, int coCnt, int delPrice, String loginID, String bankNo) {
		super();
		this.coNo = coNo;
		this.prodName = prodName;
		this.coCnt = coCnt;
		this.delPrice = delPrice;
		this.loginID = loginID;
		this.bankNo = bankNo;
	}




	public int getCoNo() {
		return coNo;
	}




	public void setCoNo(int coNo) {
		this.coNo = coNo;
	}




	public String getProdName() {
		return prodName;
	}




	public void setProdName(String prodName) {
		this.prodName = prodName;
	}




	public int getCoCnt() {
		return coCnt;
	}




	public void setCoCnt(int coCnt) {
		this.coCnt = coCnt;
	}




	public int getDelPrice() {
		return delPrice;
	}




	public void setDelPrice(int delPrice) {
		this.delPrice = delPrice;
	}




	public String getLoginID() {
		return loginID;
	}




	public void setLoginID(String loginID) {
		this.loginID = loginID;
	}




	public String getBankNo() {
		return bankNo;
	}




	public void setBankNo(String bankNo) {
		this.bankNo = bankNo;
	}




	@Override
	public String toString() {
		return "SupCusOrderHmDetailModel [coNo=" + coNo + ", prodName=" + prodName + ", coCnt=" + coCnt + ", delPrice="
				+ delPrice + ", loginID=" + loginID + ", bankNo=" + bankNo + "]";
	}
	
	
	
	
    
    

}
