package kr.happyjob.study.cusord.model;

import java.sql.Date;

public class CusordCartModel {
	
	private int cartNo; //장바구니 번호
	private int prodNo;//제품 번호
	private String loginID; //사용자 Id
	private int cartCnt; //주문 상품 수량
	private Date cartDel; //배송 희망 날짜
	
	private String prodName;  //제품 이름
	private int selPrice; //제품 판매 가격
	
	
	public int getCartNo() {
		return cartNo;
	}
	public void setCartNo(int cartNo) {
		this.cartNo = cartNo;
	}

	public int getProdNo() {
		return prodNo;
	}
	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}
	public String getLoginID() {
		return loginID;
	}
	public void setLoginID(String loginID) {
		this.loginID = loginID;
	}
	public int getCartCnt() {
		return cartCnt;
	}
	public void setCartCnt(int cartCnt) {
		this.cartCnt = cartCnt;
	}
	public Date getCartDel() {
		return cartDel;
	}
	public void setCartDel(Date cartDel) {
		this.cartDel = cartDel;
	}

	public String getProdName() {
		return prodName;
	}
	public void setProdName(String prodName) {
		this.prodName = prodName;
	}
	public int getSelPrice() {
		return selPrice;
	}
	public void setSelPrice(int selPrice) {
		this.selPrice = selPrice;
	}
	
	
	
}
