package kr.happyjob.study.supscm.service;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.supscm.model.SupScmReturnListModel;

public interface SupScmReturnListService {
	
	public List<SupScmReturnListModel> selectSupScmReturnListMode(Map<String, Object> paramMap)throws Exception;

}
