package kr.happyjob.study.supcus.model;

public class SupCusReturnHmDetailModel {

	
	   private int retNo;
	    private String prodName;
	    private int retCnt;
	    private int retPrice;
	    private String loginID;
	    private String bankNo;
		public SupCusReturnHmDetailModel() {
			super();
		}
		public SupCusReturnHmDetailModel(int retNo, String prodName, int retCnt, int retPrice, String loginID,
				String bankNo) {
			super();
			this.retNo = retNo;
			this.prodName = prodName;
			this.retCnt = retCnt;
			this.retPrice = retPrice;
			this.loginID = loginID;
			this.bankNo = bankNo;
		}
		public int getRetNo() {
			return retNo;
		}
		public void setRetNo(int retNo) {
			this.retNo = retNo;
		}
		public String getProdName() {
			return prodName;
		}
		public void setProdName(String prodName) {
			this.prodName = prodName;
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
			return "SupCusReturnHmDetailModel [retNo=" + retNo + ", prodName=" + prodName + ", retCnt=" + retCnt
					+ ", retPrice=" + retPrice + ", loginID=" + loginID + ", bankNo=" + bankNo + "]";
		}
		
	    
}
