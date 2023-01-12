package kr.happyjob.study.supcus.service;



import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.supcus.dao.SupCusReturnHmDao;

import kr.happyjob.study.supcus.model.SupCusReturnHmDetailModel;
import kr.happyjob.study.supcus.model.SupCusReturnHmModel;




@Service
public class SupCusReturnHmServiceImpl implements SupCusReturnHmService {

	
	@Autowired
	SupCusReturnHmDao supcusreturnhmDao;

	
	
	@Override
	public List<SupCusReturnHmModel> selectProductInfo(Map<String, Object> paramMap) {
		
		List<SupCusReturnHmModel> list = supcusreturnhmDao.selectProductInfo(paramMap);
		
		return list;
	}

	@Override
	public int searchlistcnt(Map<String, Object> paramMap) throws Exception {
		
		int searchlistcnt = supcusreturnhmDao.searchlistcnt(paramMap);
		
		
		return searchlistcnt;
	}

	@Override
	public SupCusReturnHmDetailModel selectorderlist(Map<String, Object> paramMap) {
		
		
		
		return supcusreturnhmDao.selectorderlist(paramMap);
	}

	@Override
	public List<SupCusReturnHmDetailModel> selectorderdetaillist(Map<String, Object> paramMap) {
	
	
		return supcusreturnhmDao.selectorderdetaillist(paramMap);
	}

	@Override
	public int updeateinout(Map<String, Object> paramMap) {
		
		return supcusreturnhmDao.updeateinout(paramMap);
	}
	
}
