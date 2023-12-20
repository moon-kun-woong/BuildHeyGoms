package com.application.BuildHeyGoms.myPage.dao;

import java.util.List;
import java.util.Map;

import com.application.BuildHeyGoms.member.dto.MemberDTO;


public interface MyPageDAO {
	
	public MemberDTO selectOneMyInfoMember(String memberId) throws Exception;
	public void updateMyInfo(MemberDTO memberDTO) throws Exception;
	public void deleteMember(String memberId) throws Exception;

	
}
