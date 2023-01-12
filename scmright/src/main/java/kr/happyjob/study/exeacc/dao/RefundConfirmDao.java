package kr.happyjob.study.exeacc.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.exeacc.model.RefundConfirmModel;

public interface RefundConfirmDao {
	// 승인전 반품 리스트 가져오기
	public List<RefundConfirmModel> selectBeforeApproveRefundList(Map<String, Object> paramMap)throws Exception;
	
	// 승인전 반품 리스트 카운팅
	public int countBeforeApprovePurchaseList(Map<String, Object> paramMap)throws Exception;

	//임원이 반품 승인 버튼 누르면
		public void updateRefundConfirm(Map<String, Object> paramMap);

}
