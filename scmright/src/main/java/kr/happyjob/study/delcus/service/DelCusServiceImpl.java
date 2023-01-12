package kr.happyjob.study.delcus.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.delcus.dao.DelCusDao;
import kr.happyjob.study.delcus.model.DelCusModel;

@Service
public class DelCusServiceImpl implements DelCusService {
	   
	@Autowired
	DelCusDao delCusDao;
	
	// 1. Delivery 리스트 조회
	public List<DelCusModel> delList(Map<String, Object> map) throws Exception {
		List<DelCusModel> list = delCusDao.delList(map);
		return list;
	}
	
	// 2. Delivery 단 건 조회
	public List<DelCusModel> delSelectOne(int coNo) throws Exception {
		List<DelCusModel> list = delCusDao.delSelectOne(coNo);
		return list;
	}
	
	// 3. Delivery Count 조회
	public int countDel() throws Exception {
		return delCusDao.countDel();
	}
	
	// 4. Delivery 상태 변경
	public int deliverySts(int delNo) throws Exception{
		return delCusDao.deliverySts(delNo);
	}
	
	/* ####################### */
	
	// 1. Return List 조회
	public List<DelCusModel> delReturnList(Map<String, Object> map) throws Exception{
		List<DelCusModel> list = delCusDao.delReturnList(map);
		return list;
	}
		
	// 2. Return 단 건 조회
	public List<DelCusModel> delReturnSelectOne(Map<String, Object> map) throws Exception{
		List<DelCusModel> list = delCusDao.delReturnSelectOne(map);
		return list;
	}
		
	// 3. Return Count 조회
	public List<DelCusModel> delReturnCnt(Map<String, Object> map) throws Exception{
		List<DelCusModel> list = delCusDao.delReturnCnt(map);
		return list;
	}
		
	// 4. Return 창고 재고 수량 수정
	public int delReturnStrCnt(Map<String, Object> map) throws Exception{
		return delCusDao.delReturnStrCnt(map);
	}
		
	// 5. Return retSts/retEsts 수정
	public int delReturnRetSts(Map<String, Object> map) throws Exception{
		return delCusDao.delReturnRetSts(map);
	}

}
