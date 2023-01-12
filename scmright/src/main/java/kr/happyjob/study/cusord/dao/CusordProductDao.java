package kr.happyjob.study.cusord.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.cusord.model.CusordProductModel;

public interface CusordProductDao {
	
	//제품 목록 조회
	public List<CusordProductModel> selectProduct(Map<String, Object> param);
	
	//제품 개수 조회
	public int selectProductCnt(Map<String, Object> param);
	
	//제품 상세보기
	public CusordProductModel selectProductDetail(Map<String, Object> param);
	
	
	//같은 유저 장바구니에 동일한 상품 있나 조회
	public int selectSameProduct(Map<String, Object> param);
	
	//장바구니에 제품 추가
	public int insertCart(Map<String, Object> param);
	
	//제품 주문하기
	public int insertOrder(Map<String, Object> param);

}
