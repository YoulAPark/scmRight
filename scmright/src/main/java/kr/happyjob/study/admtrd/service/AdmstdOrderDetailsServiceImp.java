package kr.happyjob.study.admtrd.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.admtrd.dao.AdmstdOrderDetailsDao;
import kr.happyjob.study.admtrd.model.AdmstdOrderDetailsVo;
import kr.happyjob.study.admtrd.model.AdmstdOrderVo;

@Service
public class AdmstdOrderDetailsServiceImp implements AdmstdOrderDetailsService {
	
	@Autowired
	AdmstdOrderDetailsDao admstdOrderDetailsDao;
	
	//admin 수주내역 list 가져오기
	@Override
	public List<AdmstdOrderDetailsVo> getOderList(Map<String, Object> paramMap) {
		return admstdOrderDetailsDao.getOderList(paramMap);
	}
	
	//클릭한 배송지시서 단건 조회
	@Override
	public AdmstdOrderDetailsVo getshipping(Map<String, Object> paramMap) {
		return admstdOrderDetailsDao.getshipping(paramMap);
	}
	
	//클릭한 발주지시서 단건 조회
	@Override
	public AdmstdOrderVo getOrder(Map<String, Object> paramMap) {
		return admstdOrderDetailsDao.getOrder(paramMap);
	}
	
	//수주 내역 count 조회
	@Override
	public int searchlistcnt(Map<String, Object> paramMap) {
		return admstdOrderDetailsDao.searchlistcnt(paramMap);
	}
	
	//재고량 조회
	@Override
	public int getwhallCnt(Map<String, Object> paramMap) {
		return admstdOrderDetailsDao.getwhallCnt(paramMap);
	}
	
	//창고 배송담당자 가져오기
	@Override
	public String getDelivery(Map<String, Object> paramMap) {
		return admstdOrderDetailsDao.getDelivery(paramMap);
	}
	
	//배송번호 가져오기
	@Override
	public int getdelNo() {
		return admstdOrderDetailsDao.getdelNo();
	}

	@Override
	public int shippingInsert(Map<String, Object> paramMap) {
		return admstdOrderDetailsDao.shippingInsert(paramMap);
	}
	
	//배송 수량 가져오기
	@Override
	public int orderCnt(Map<String, Object> paramMap) {
		return admstdOrderDetailsDao.orderCnt(paramMap);
	}}
