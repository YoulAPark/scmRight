package kr.happyjob.study.admtrd.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.admtrd.dao.AdmstdAppReturnDao;
import kr.happyjob.study.admtrd.model.AdmstdOrderDetailsVo;

@Service
public class AdmstdAppReturnServiceImp implements AdmstdAppReturnService{
	
	@Autowired
	AdmstdAppReturnDao admstrAppReturnDao;
	
	@Override
	public List<AdmstdOrderDetailsVo> getAppReturnList(Map<String, Object> paramMap) {
		return admstrAppReturnDao.getAppReturnList(paramMap);
	}

	@Override
	public int searchlistcnt(Map<String, Object> paramMap) {
		return admstrAppReturnDao.searchlistcnt(paramMap);
	}

	@Override
	public int returnUpdate(Map<String, Object> paramMap) {
		return admstrAppReturnDao.returnUpdate(paramMap);
	}

}
