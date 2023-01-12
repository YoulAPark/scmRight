package kr.happyjob.study.cusord.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.cusord.model.CusordCartModel;

public interface CusordCartDao {
	
		//장바구니 목록 조회
		public List<CusordCartModel> selectCart(Map<String, Object> param);
		
		//장바구니 제품 개수 조회
		public int selectCartCnt(Map<String, Object> param);
		
		//제품 장바구니에서 삭제
		public int deleteProduct(Map<String,Object> param);

}
