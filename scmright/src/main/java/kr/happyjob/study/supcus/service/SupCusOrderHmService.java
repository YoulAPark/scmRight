package kr.happyjob.study.supcus.service;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.supcus.model.SupCusOrderHmDetailModel;
import kr.happyjob.study.supcus.model.SupCusOrderHmModel;

public interface SupCusOrderHmService {
	
	public List<SupCusOrderHmModel> selectProductInfo(Map<String, Object> paramMap);

	
	public int searchlistcnt(Map<String, Object> paramMap) throws Exception;
	
	public SupCusOrderHmDetailModel selectorderlist(Map<String, Object> paramMap);
	
	public List<SupCusOrderHmDetailModel> selectorderdetaillist(Map<String, Object> paramMap);
	
	public int updeateinout(Map<String, Object> paramMap);
}
