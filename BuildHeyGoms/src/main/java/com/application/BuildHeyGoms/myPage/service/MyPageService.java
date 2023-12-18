package com.application.BuildHeyGoms.myPage.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.application.BuildHeyGoms.member.dto.MemberDTO;
import com.application.BuildHeyGoms.myPage.dto.ClassMemberDTO;


@Repository
public interface MyPageService {

	public List<Map<String,Object>> getMyOrderList(String memberId) throws Exception;
	public Map<String,Object> getMyOrderDetail(Map<String,Object> orderDetailMap) throws Exception;
	public String getEmailById(String memberId) throws Exception;
	public MemberDTO getMyInfo(String memberId) throws Exception;
	public void modifyMyInfo(MemberDTO memberDTO) throws Exception;
	public void removeMember(String memberId) throws Exception;
	
}
