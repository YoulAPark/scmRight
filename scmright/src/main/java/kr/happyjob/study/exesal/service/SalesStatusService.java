package kr.happyjob.study.exesal.service;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.exesal.model.SalesStatusModel;

public interface SalesStatusService {

	public List<SalesStatusModel> salesStatusList(Map<String, Object> paramMap)throws Exception;

	public int searchlistcnt(Map<String, Object> paramMap)throws Exception;

	public List<SalesStatusModel> salesStatusDetailList(Map<String, Object> paramMap)throws Exception;

	public int searchlistcnt2(Map<String, Object> paramMap)throws Exception;


}
