package kr.happyjob.study.exesal.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.exesal.dao.SalesStatusDao;
import kr.happyjob.study.exesal.model.SalesStatusModel;

@Service
public class SalesStatusServiceImpl  implements SalesStatusService{
	
	// Set logger
		private final Logger logger = LogManager.getLogger(this.getClass());
		
		// Get class name for logger
		private final String className = this.getClass().toString();
		
		
		@Autowired
		SalesStatusDao salesStatusDao;

	@Override
	public List<SalesStatusModel> salesStatusList(Map<String, Object> paramMap) throws Exception {
		
		
		List<SalesStatusModel> salesStatusList = salesStatusDao.salesStatusList(paramMap);
		
		return salesStatusList;
	}

	@Override
	public int searchlistcnt(Map<String, Object> paramMap) throws Exception {
		
		int searchlistcnt = salesStatusDao.searchlistcnt(paramMap);
		
		return searchlistcnt;
	}

	@Override
	public List<SalesStatusModel> salesStatusDetailList(Map<String, Object> paramMap) throws Exception {
		
		List<SalesStatusModel> salesStatusDetailList = salesStatusDao.salesStatusDetailList(paramMap);
		
		return salesStatusDetailList;
	}

	@Override
	public int searchlistcnt2(Map<String, Object> paramMap) throws Exception {
		
		int searchlistcnt2 = salesStatusDao.searchlistcnt2(paramMap);
		
		return searchlistcnt2;
	}


}
