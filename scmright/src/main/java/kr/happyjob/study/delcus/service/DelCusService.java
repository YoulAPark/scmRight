package kr.happyjob.study.delcus.service;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.delcus.model.DelCusModel;

public interface DelCusService {
	
	// 1. Delivery 리스트 조회
	public List<DelCusModel> delList(Map<String, Object> map) throws Exception;
	
	// 2. Delivery 단 건 조회
	public List<DelCusModel> delSelectOne(int coNo) throws Exception;
	
	// 3. Delivery Count 조회
	public int countDel() throws Exception;
	
	// 4. Delivery 상태 변경
	public int deliverySts(int delNo) throws Exception;
	
	/* ####################### */
	
	// 1. Return List 조회
	public List<DelCusModel> delReturnList(Map<String, Object> map) throws Exception;
	
	// 2. Return 단 건 조회
	public List<DelCusModel> delReturnSelectOne(Map<String, Object> map) throws Exception;
	
	// 3. Return Count 조회
	public List<DelCusModel> delReturnCnt(Map<String, Object> map) throws Exception;
	
	// 4. Return 창고 재고 수량 수정
	public int delReturnStrCnt(Map<String, Object> map) throws Exception;
	
	// 5. Return retSts/retEsts 수정
	public int delReturnRetSts(Map<String, Object> map) throws Exception;	
	

}

