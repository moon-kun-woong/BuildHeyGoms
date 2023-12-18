package com.application.BuildHeyGoms.myPage.dao;

import java.util.List;
import java.util.Map;


public interface MyPageDAO {
	
	public List<Map<String,Object>> selectListMyOrder(String memberId) throws Exception;
	public Map<String,Object> selectOneMyOrder(Map<String,Object> orderDetailMap) throws Exception;
	public String selectOneMyEmail(String memberId)throws Exception;
	
	
}
