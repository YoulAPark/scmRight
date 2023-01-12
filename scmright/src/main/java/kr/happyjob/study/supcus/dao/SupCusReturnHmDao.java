package kr.happyjob.study.supcus.dao;

import java.util.List;
import java.util.Map;


import kr.happyjob.study.supcus.model.SupCusReturnHmDetailModel;
import kr.happyjob.study.supcus.model.SupCusReturnHmModel;

public interface SupCusReturnHmDao {
	public List<SupCusReturnHmModel> selectProductInfo(Map<String, Object> paramMap);

	public int searchlistcnt(Map<String, Object> paramMap) throws Exception;
	
	public SupCusReturnHmDetailModel selectorderlist(Map<String, Object> paramMap);
	

	
	public List<SupCusReturnHmDetailModel> selectorderdetaillist(Map<String, Object> paramMap);
	
	
	public int updeateinout(Map<String, Object> paramMap);

	


}
