package kr.happyjob.study.exesal.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.exesal.dao.SalesTopDao;
import kr.happyjob.study.exesal.model.SalesStatusModel;
import kr.happyjob.study.exesal.model.SalesTopModel;

@Service
public class SalesTopServiceImpl  implements SalesTopService{
	
	// Set logger
	private final Logger logger = LogManager.getLogger(this.getClass());
	
	// Get class name for logger
	private final String className = this.getClass().toString();
	
	@Autowired
	SalesTopDao salesTopDao;

	@Override
	public List<SalesTopModel> salesTopList(Map<String, Object> paramMap) throws Exception {
		
		List<SalesTopModel> salesTopList = salesTopDao.salesTopList(paramMap);
		
		return salesTopList;
	}

	@Override
	public int searchlistcnt(Map<String, Object> paramMap) throws Exception {
		
		int searchlistcnt = salesTopDao.searchlistcnt(paramMap);
		
		return searchlistcnt;	
	}

	
	
	
	
		
		



}
