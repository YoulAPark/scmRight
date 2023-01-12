package kr.happyjob.study.supcus.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.supcus.dao.SupCusOrderHmDao;
import kr.happyjob.study.supcus.model.SupCusOrderHmDetailModel;
import kr.happyjob.study.supcus.model.SupCusOrderHmModel;

@Service
public class SupCusOrderHmServiceImpl implements SupCusOrderHmService {

	
	@Autowired
	SupCusOrderHmDao supcusorderhmDao;
	
	@Override
	public List<SupCusOrderHmModel> selectProductInfo(Map<String, Object> paramMap) {
		
		List<SupCusOrderHmModel> list = supcusorderhmDao.selectProductInfo(paramMap);
		
		return list;
	}

	@Override
	public int searchlistcnt(Map<String, Object> paramMap) throws Exception {
		
		int searchlistcnt = supcusorderhmDao.searchlistcnt(paramMap);
		
		
		return searchlistcnt;
	}

	@Override
	public SupCusOrderHmDetailModel selectorderlist(Map<String, Object> paramMap) {
		
		
		
		return supcusorderhmDao.selectorderlist(paramMap);
	}

	@Override
	public List<SupCusOrderHmDetailModel> selectorderdetaillist(Map<String, Object> paramMap) {
	
	
		return supcusorderhmDao.selectorderdetaillist(paramMap);
	}

	@Override
	public int updeateinout(Map<String, Object> paramMap) {
		
		return supcusorderhmDao.updeateinout(paramMap);
	}

	
	
	
}
