package com.application.BuildHeyGoms.myPage.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.application.BuildHeyGoms.member.dto.MemberDTO;
import com.application.BuildHeyGoms.trainer.dto.TrainerDTO;


public interface MyPageService {

	public MemberDTO getMyInfo(String memberId) throws Exception;
	public void modifyMyInfo(MemberDTO memberDTO) throws Exception;
	public void removeMember(String memberId) throws Exception;
	
	public TrainerDTO getMyInfoTrainer(String trainerId) throws Exception;
	public void modifyMyInfoTrainer(TrainerDTO trainerDTO) throws Exception;
	public void removeTrainer(String trainerId) throws Exception;
	
}
