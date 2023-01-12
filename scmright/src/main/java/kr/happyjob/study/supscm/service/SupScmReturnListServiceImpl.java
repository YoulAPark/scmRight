package kr.happyjob.study.supscm.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.supscm.dao.SupScmReturnListDao;
import kr.happyjob.study.supscm.model.SupScmReturnListModel;


@Service
public class SupScmReturnListServiceImpl implements SupScmReturnListService {
	
	
	@Autowired
	SupScmReturnListDao supscmreturnlistDao;
	

	public List<SupScmReturnListModel> selectSupScmReturnListMode(Map<String, Object> paramMap) throws Exception {
		
		List<SupScmReturnListModel> list = supscmreturnlistDao.selectSupScmReturnListMode(paramMap);
		
		return list;
	}




}
