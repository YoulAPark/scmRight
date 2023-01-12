package kr.happyjob.study.supscm.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.supscm.model.SupScmReturnListModel;

public interface SupScmReturnListDao {

	public List<SupScmReturnListModel> selectSupScmReturnListMode(Map<String, Object> paramMap)throws Exception;
}
