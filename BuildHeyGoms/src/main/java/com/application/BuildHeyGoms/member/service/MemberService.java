package com.application.BuildHeyGoms.member.service;

import java.util.List;

import com.application.BuildHeyGoms.member.dto.ClassMemberDTO;
import com.application.BuildHeyGoms.member.dto.MemberDTO;
import com.application.BuildHeyGoms.myPage.dto.ClassDTO;

public interface MemberService {

	public void addMember(MemberDTO memberDTO) throws Exception;
	public String checkOverlappedId(String memberId) throws Exception;
	public MemberDTO loginMember(MemberDTO memberDTO)throws Exception;
	List<MemberDTO> getMemberList() throws Exception;
	public List<String> getClassSchedules(String memberId)throws Exception;
	public List<ClassDTO> findTrainerClassesByDate(String selectedDate)throws Exception;
	public void addClassMember(ClassMemberDTO classMemberDTO)throws Exception;

}
