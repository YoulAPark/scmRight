package kr.happyjob.study.admtrd.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.admtrd.model.AdmstdOrderDetailsVo;
import kr.happyjob.study.admtrd.model.AdmstdOrderVo;

public interface AdmstdOrderDetailsDao {

	//admin 수주내역 list 가져오기
	public List<AdmstdOrderDetailsVo> getOderList(Map<String, Object> paramMap);
	
	//클릭한 배송지시서 단건 조회
	public AdmstdOrderDetailsVo getshipping(Map<String, Object> paramMap);
	
	//클릭한 발주지시서 단건 조회
	public AdmstdOrderVo getOrder(Map<String, Object> paramMap);
	
	//수주 내역 count 조회
	public int searchlistcnt(Map<String, Object> paramMap);
	
	//재고량 조회
	public int getwhallCnt(Map<String, Object> paramMap);
	
	//창고 배송 담당자 가져오기
	public String getDelivery(Map<String, Object> paramMap);

	//배송번호 가져오기
	public int getdelNo();
	
	//배송지시서 insert
	public int shippingInsert(Map<String, Object> paramMap);

	//배송 수량 가져오기
	public int orderCnt(Map<String, Object> paramMap);

}
