package kr.happyjob.study.admtrd.service;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.admtrd.model.AdmstdOrderDetailsVo;

public interface AdmstdAppReturnService {
	
	//리스트 가져오기
	List<AdmstdOrderDetailsVo> getAppReturnList(Map<String, Object> paramMap);

	int searchlistcnt(Map<String, Object> paramMap);

	int returnUpdate(Map<String, Object> paramMap);

}
