package com.application.BuildHeyGoms.member.service;

import java.util.List;

import com.application.BuildHeyGoms.member.dto.MemberDTO;

public interface MemberService {

	public void addMember(MemberDTO memberDTO) throws Exception;
	public String checkOverlappedId(String memberId) throws Exception;
	public MemberDTO loginMember(MemberDTO memberDTO)throws Exception;
	List<MemberDTO> getMemberList() throws Exception;

}
