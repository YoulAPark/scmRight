package kr.happyjob.study.exesal.service;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.exesal.model.ProfitModel;

public interface ProfitService {

	public List<ProfitModel> profitList(Map<String, Object> paramMap)throws Exception;

	public int searchlistcnt(Map<String, Object> paramMap)throws Exception;

	public List<ProfitModel> profitDetailList(Map<String, Object> paramMap)throws Exception;

	public int searchlistcnt2(Map<String, Object> paramMap)throws Exception;

}
