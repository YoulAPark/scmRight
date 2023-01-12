package kr.happyjob.study.admstd.dao;

import java.util.List;
import java.util.Map;

import kr.happyjob.study.admstd.model.AdmstdUserInfoModel;

public interface AdmstdUserInfoDao {
	
	// 1. 전체 회원 목록 조회
	public List<AdmstdUserInfoModel> listUsers(Map<String, Object> map) throws Exception;
	
	// 2. paging 처리를 위한 회원 수 counting
	public int countUser() throws Exception;
	
	// 3. 회원 단 건 조회
	public List<AdmstdUserInfoModel> detailUser(String loginId) throws Exception;

}
