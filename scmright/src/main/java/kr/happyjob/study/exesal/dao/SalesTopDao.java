package kr.happyjob.study.exesal.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.exesal.model.SalesTopModel;

public interface SalesTopDao {

	public List<SalesTopModel> salesTopList(Map<String, Object> paramMap)throws Exception;

	public int searchlistcnt(Map<String, Object> paramMap)throws Exception;

	
	

	

	

}
