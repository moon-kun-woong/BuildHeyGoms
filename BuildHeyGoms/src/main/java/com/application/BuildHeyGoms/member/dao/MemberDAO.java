package com.application.BuildHeyGoms.member.dao;

import java.util.List;
import java.util.Map;

import com.application.BuildHeyGoms.member.dto.ClassMemberDTO;
import com.application.BuildHeyGoms.member.dto.MemberDTO;
import com.application.BuildHeyGoms.myPage.dto.ClassDTO;

public interface MemberDAO {

	public void insertMember(MemberDTO memberDTO) throws Exception;

	public MemberDTO selectOneloginMember(String memberId) throws Exception;

	public Object selectOneDuplicatedMemberCheck(String memberId) throws Exception;

	public List<MemberDTO> selectListMember() throws Exception;

	public List<String> selectClassIdMemberSchedules(String memberId)throws Exception;

	public List<ClassDTO> findTrainerClassesByDate(String selectedDate)throws Exception;

	public void insertClassMember(ClassMemberDTO classMemberDTO)throws Exception;



}
