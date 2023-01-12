package kr.happyjob.study.admstd.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.happyjob.study.admstd.dao.AdmstdUserInfoDao;
import kr.happyjob.study.admstd.model.AdmstdUserInfoModel;

@Service
public class AdmstdUserInfoServiceImpl implements AdmstdUserInfoService {
	   
	@Autowired
	AdmstdUserInfoDao userInfoDao;

	// 1. 전체 회원 목록 조회
	public List<AdmstdUserInfoModel> listUsers(Map<String, Object> map) throws Exception {	
		List<AdmstdUserInfoModel> listUser = userInfoDao.listUsers(map);
		return listUser;
	}
	
	// 2. paging 처리를 위한 회원 수 counting
	public int countUser() throws Exception {
		return userInfoDao.countUser();
	}

	// 3. 회원 단 건 조회
	public List<AdmstdUserInfoModel> detailUser(String loginId) throws Exception {
		return userInfoDao.detailUser(loginId);
	}
}
