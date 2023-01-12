package kr.happyjob.study.admtrd.model;

public class AdmstdOrderVo {
	
	private int prodNo;
	private String prodName, supName;
	
	public AdmstdOrderVo() {}
	
	public int getProdNo() {
		return prodNo;
	}
	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	public String getSupName() {
		return supName;
	}
	public void setSupName(String supName) {
		this.supName = supName;
	}

	public AdmstdOrderVo(int prodNo, String prodName, String supName) {
		super();
		this.prodNo = prodNo;
		this.prodName = prodName;
		this.supName = supName;
	}

	@Override
	public String toString() {
		return "AdmstdOrderVo [prodNo=" + prodNo + ", prodName=" + prodName + ", supName=" + supName + "]";
	}
	
}
