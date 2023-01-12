package kr.happyjob.study.supscm.model;

import java.sql.Timestamp;

public class SupScmReturnListModel {
	
	private String supName;
	private int soNo;
	private Timestamp soDate;
	private String soEsts;
	
	
	
	
	
	
	
	public SupScmReturnListModel() {
		super();
	}
	
	
	public SupScmReturnListModel(String supName, int soNo, Timestamp soDate, String soEsts) {
		super();
		this.supName = supName;
		this.soNo = soNo;
		this.soDate = soDate;
		this.soEsts = soEsts;
	}
	public String getSupName() {
		return supName;
	}
	public void setSupName(String supName) {
		this.supName = supName;
	}
	public int getSoNo() {
		return soNo;
	}
	public void setSoNo(int soNo) {
		this.soNo = soNo;
	}
	public Timestamp getSoDate() {
		return soDate;
	}
	public void setSoDate(Timestamp soDate) {
		this.soDate = soDate;
	}
	public String getSoEsts() {
		return soEsts;
	}
	public void setSoEsts(String soEsts) {
		this.soEsts = soEsts;
	}
	@Override
	public String toString() {
		return "SupScmReturnListModel [supName=" + supName + ", soNo=" + soNo + ", soDate=" + soDate + ", soEsts="
				+ soEsts + "]";
	}
	
	
	
	
	

}
