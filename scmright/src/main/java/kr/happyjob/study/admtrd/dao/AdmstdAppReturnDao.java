package kr.happyjob.study.admtrd.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.admtrd.model.AdmstdOrderDetailsVo;

public interface AdmstdAppReturnDao {

	List<AdmstdOrderDetailsVo> getAppReturnList(Map<String, Object> paramMap);

	int searchlistcnt(Map<String, Object> paramMap);

	int returnUpdate(Map<String, Object> paramMap);

}
