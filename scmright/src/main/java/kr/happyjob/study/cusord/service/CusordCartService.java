package kr.happyjob.study.cusord.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.happyjob.study.cusord.model.CusordCartModel;

@Service
public interface CusordCartService {
	
		//장바구니 목록 조회
		public List<CusordCartModel> selectCart(Map<String, Object> param) throws Exception;
		
		//장바구니 제품 개수 조회
		public int selectCartCnt(Map<String, Object> param) throws Exception;
		
		//제품 장바구니에서 삭제
		public int deleteProduct(Map<String,Object> param) throws Exception;
		
		

}
