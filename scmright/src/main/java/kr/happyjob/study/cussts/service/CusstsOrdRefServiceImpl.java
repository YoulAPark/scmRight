package kr.happyjob.study.cussts.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.cussts.dao.CusstsOrdRefDao;
import kr.happyjob.study.cussts.model.CusstsOrderModel;

@Service
public class CusstsOrdRefServiceImpl implements CusstsOrdRefService {

	@Autowired
	CusstsOrdRefDao cusstsOrdRefDao;
	
	@Override
	public List<CusstsOrderModel> selectOrder(Map<String, Object> param) throws Exception {
		return cusstsOrdRefDao.selectOrder(param);
	}

	@Override
	public int selectOrderCnt(Map<String, Object> param) throws Exception {
		return cusstsOrdRefDao.selectOrderCnt(param);
	}

	@Override
	public CusstsOrderModel selectOrderDetail(Map<String, Object> param) throws Exception {
		return cusstsOrdRefDao.selectOrderDetail(param);
	}

	@Override
	public int insertRefund(Map<String, Object> param) {
		return cusstsOrdRefDao.insertRefund(param);
	}
	
	@Override
	public int updateCoSts(Map<String, Object> param) {
		return cusstsOrdRefDao.updateCoSts(param);
	}



}
