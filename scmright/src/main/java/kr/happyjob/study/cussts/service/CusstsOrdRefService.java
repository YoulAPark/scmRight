package kr.happyjob.study.cussts.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import kr.happyjob.study.cussts.model.CusstsOrderModel;

@Service
public interface CusstsOrdRefService {
	
	// 제품 주문 목록 조회 
	public List<CusstsOrderModel> selectOrder(Map<String, Object> param) throws Exception;

	//주문 목록 개수
	public int selectOrderCnt(Map<String, Object> param) throws Exception;
	
	//주문 제품 클릭 시 해당 제품 상세 보기
	public CusstsOrderModel selectOrderDetail(Map<String, Object> param) throws Exception;
	
	//반품신청
	public int insertRefund(Map<String, Object> param);
	
	//반품 신청 시 주문 내역의  주문 현황 상태 변화
	public int updateCoSts(Map<String, Object> param);

}
