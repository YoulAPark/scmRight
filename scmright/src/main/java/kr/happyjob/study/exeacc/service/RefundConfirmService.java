package kr.happyjob.study.exeacc.service;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.exeacc.model.RefundConfirmModel;

public interface RefundConfirmService {
	
	// 승인전 발주 목록 가져오기
	public List<RefundConfirmModel> selectBeforeApproveRefundList(Map<String, Object> paramMap) throws Exception;
	// 승인전 발주 목록 개수 세기
	public int countBeforeApprovePurchaseList(Map<String, Object> paramMap) throws Exception;
	public void clickCeoRefundConfirm(Map<String, Object> paramMap);

	

}
