package com.application.BuildHeyGoms.member.service;

import java.util.List;
import java.util.Map;

import com.application.BuildHeyGoms.member.dto.ClassMemberDTO;
import com.application.BuildHeyGoms.member.dto.JoinRequestDTO;
import com.application.BuildHeyGoms.member.dto.MemberDTO;
import com.application.BuildHeyGoms.myPage.dto.ClassDTO;
import com.application.BuildHeyGoms.trainer.dto.TrainerDTO;

public interface MemberService {

	public void addMember(MemberDTO memberDTO) throws Exception;
	public String checkOverlappedId(String memberId) throws Exception;
	public MemberDTO loginMember(MemberDTO memberDTO)throws Exception;
	List<MemberDTO> getMemberList() throws Exception;
	public List<String> getClassSchedules(String memberId)throws Exception;
	public List<ClassDTO> findTrainerClassesByDate(String selectedDate)throws Exception;
	public void addClassMember(ClassMemberDTO classMemberDTO)throws Exception;
	public ClassDTO findOneClassMemberByDate(String selectedDate, String memberId)throws Exception;
	public void removeClassMember(String classId)throws Exception;
//	public void searchTrainerIdByMemberId(TrainerDTO trainerDTO)throws Exception;
//	public void addJoinRequest(JoinRequestDTO joinRequestDTO)throws Exception;
	public List<ClassDTO> getMyClasses(String memberId)throws Exception;
	public TrainerDTO getMyTrainerInfo(String trainerId)throws Exception;

}
