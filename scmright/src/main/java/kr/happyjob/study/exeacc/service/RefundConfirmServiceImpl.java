package kr.happyjob.study.exeacc.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.happyjob.study.exeacc.dao.RefundConfirmDao;
import kr.happyjob.study.exeacc.model.RefundConfirmModel;

@Transactional
@Service("RefundConfirmServiceImpl")
public class RefundConfirmServiceImpl implements RefundConfirmService{

	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	// Get class name for logger
	private final String className = this.getClass().toString();
	
	@Autowired
	RefundConfirmDao refundConfirmDao;

	@Override
	public List<RefundConfirmModel> selectBeforeApproveRefundList(Map<String, Object> paramMap) throws Exception {
		List<RefundConfirmModel> selectBeforeApproveRefundList = refundConfirmDao.selectBeforeApproveRefundList(paramMap);
		return selectBeforeApproveRefundList;
	}

	@Override
	public int countBeforeApprovePurchaseList(Map<String, Object> paramMap) throws Exception {
		int totalCnt = refundConfirmDao.countBeforeApprovePurchaseList(paramMap);
		return totalCnt;
	}

	//임원이 반품 승인 버튼 누른다.
		@Override
		public void clickCeoRefundConfirm(Map<String, Object> paramMap) {
			
		refundConfirmDao.updateRefundConfirm(paramMap);
		}
}
