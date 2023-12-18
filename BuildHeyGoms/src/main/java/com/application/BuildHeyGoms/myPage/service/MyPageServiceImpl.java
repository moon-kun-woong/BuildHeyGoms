package com.application.BuildHeyGoms.myPage.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.application.BuildHeyGoms.member.dto.MemberDTO;
import com.application.BuildHeyGoms.myPage.dao.MyPageDAO;
import com.application.BuildHeyGoms.myPage.dto.ClassMemberDTO;


@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	private MyPageDAO myPageDAO;
	
	@Override
	public List<Map<String,Object>> getMyOrderList(String memberId) throws Exception {
		return myPageDAO.selectListMyOrder(memberId);
	}

	@Override
	public Map<String,Object> getMyOrderDetail(Map<String,Object> orderDetailMap) throws Exception {
		return myPageDAO.selectOneMyOrder(orderDetailMap);
	}

	@Override
	public String getEmailById(String memberId) throws Exception {
		
		return "";
	}
	
	
	@Override
	public MemberDTO getMyInfo(String memberId) throws Exception {
		return null;
	}

	@Override
	public void modifyMyInfo(MemberDTO memberDTO) throws Exception {
		
	}

	@Override
	public void removeMember(String memberId) throws Exception {
		
	}


}
