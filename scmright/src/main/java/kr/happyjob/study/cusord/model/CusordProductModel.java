package kr.happyjob.study.cusord.model;

public class CusordProductModel {
	
	
	
	private int prodNo; //제품번호
	private int supNo; //납품업체번호
	private int att_no; //파일번호
	private String prodName; //제품명
	private String prodCate; //제품분류
	private String mfName; //제조사명
	private int delPrice; //납품단가
	private int selPrice; //판매단가
	private String prodInfo; //상세정보

	private int att_ori; //파일원본명
	private int att_date;//업로드일
	private int att_nli; //논리경로
	private int att_mul;//물리경로
	
	
	
	
	public int getProdNo() {
		return prodNo;
	}
	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}
	public int getSupNo() {
		return supNo;
	}
	public void setSupNo(int supNo) {
		this.supNo = supNo;
	}
	public int getAtt_no() {
		return att_no;
	}
	public void setAtt_no(int att_no) {
		this.att_no = att_no;
	}
	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	public String getProdCate() {
		return prodCate;
	}
	public void setProdCate(String prodCate) {
		this.prodCate = prodCate;
	}
	public String getMfName() {
		return mfName;
	}
	public void setMfName(String mfName) {
		this.mfName = mfName;
	}
	public int getDelPrice() {
		return delPrice;
	}
	public void setDelPrice(int delPrice) {
		this.delPrice = delPrice;
	}
	public int getSelPrice() {
		return selPrice;
	}
	public void setSelPrice(int selPrice) {
		this.selPrice = selPrice;
	}
	public String getProdInfo() {
		return prodInfo;
	}
	public void setProdInfo(String prodInfo) {
		this.prodInfo = prodInfo;
	}

	
	
	
	public int getAtt_ori() {
		return att_ori;
	}
	public void setAtt_ori(int att_ori) {
		this.att_ori = att_ori;
	}
	public int getAtt_date() {
		return att_date;
	}
	public void setAtt_date(int att_date) {
		this.att_date = att_date;
	}
	public int getAtt_nli() {
		return att_nli;
	}
	public void setAtt_nli(int att_nli) {
		this.att_nli = att_nli;
	}
	public int getAtt_mul() {
		return att_mul;
	}
	public void setAtt_mul(int att_mul) {
		this.att_mul = att_mul;
	}

	
	
	
	
	


}
