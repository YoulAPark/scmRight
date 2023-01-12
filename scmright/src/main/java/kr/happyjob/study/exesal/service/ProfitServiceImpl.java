package kr.happyjob.study.exesal.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.exesal.dao.ProfitDao;
import kr.happyjob.study.exesal.model.ProfitModel;

@Service
public class ProfitServiceImpl implements ProfitService{
	
			// Set logger
			private final Logger logger = LogManager.getLogger(this.getClass());
			
			// Get class name for logger
			private final String className = this.getClass().toString();
			
			@Autowired
			ProfitDao profitDao;

	@Override
	public List<ProfitModel> profitList(Map<String, Object> paramMap) throws Exception {
		
		List<ProfitModel> profitList = profitDao.profitLsit(paramMap);
		
		return profitList;
	}

	@Override
	public int searchlistcnt(Map<String, Object> paramMap) throws Exception {
		
		int searchlistcnt = profitDao.searchlistcnt(paramMap);
		
		return searchlistcnt;
	}

	@Override
	public List<ProfitModel> profitDetailList(Map<String, Object> paramMap) throws Exception {
		
		List<ProfitModel> profitDetailList = profitDao.profitDetailList(paramMap);
		
		return profitDetailList;
	}

	@Override
	public int searchlistcnt2(Map<String, Object> paramMap) throws Exception {
		
		int searchlistcnt2 = profitDao.searchlistcnt2(paramMap);
		
		return searchlistcnt2;
	}

}
