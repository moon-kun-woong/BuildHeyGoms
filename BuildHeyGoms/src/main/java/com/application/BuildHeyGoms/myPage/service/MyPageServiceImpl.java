package com.application.BuildHeyGoms.myPage.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.application.BuildHeyGoms.member.dto.MemberDTO;
import com.application.BuildHeyGoms.member.service.MemberServiceImpl;
import com.application.BuildHeyGoms.myPage.dao.MyPageDAO;
import com.application.BuildHeyGoms.trainer.dto.TrainerDTO;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	private MyPageDAO myPageDAO;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	private String FILE_REPO_PATH = "C:\\BuildHeyGoms_file_repo\\";
	
	private static Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);
	
	@Override
	public MemberDTO getMyInfo(String memberId) throws Exception {
		return myPageDAO.selectOneMyInfoMember(memberId);
	}

	@Override
	public void modifyMyInfo(MemberDTO memberDTO) throws Exception {
		if (memberDTO.getSmsstsYn() == null) memberDTO.setSmsstsYn("N"); 
		if (memberDTO.getEmailstsYn() == null) memberDTO.setEmailstsYn("N");
		memberDTO.setPasswd(bCryptPasswordEncoder.encode(memberDTO.getPasswd())); 
		myPageDAO.updateMyInfo(memberDTO);
	}

	@Override
	@Transactional
	public void removeMember(String memberId) throws Exception {
		myPageDAO.deleteMember(memberId);
	}
	
	
	
	@Override
	public TrainerDTO getMyInfoTrainer(String trainerId) throws Exception {
		return myPageDAO.selectOneMyInfoTrainer(trainerId);
	}
	
	@Override
	public void modifyMyInfoTrainer(TrainerDTO trainerDTO) throws Exception {
		if (trainerDTO.getSmsstsYn() == null) trainerDTO.setSmsstsYn("N"); 
		if (trainerDTO.getEmailstsYn() == null) trainerDTO.setEmailstsYn("N");
		trainerDTO.setPasswd(bCryptPasswordEncoder.encode(trainerDTO.getPasswd())); 
		myPageDAO.updateMyInfoTrainer(trainerDTO);
	}
	
	@Override
	@Transactional
	public void removeTrainer(String trainerId) throws Exception {
		myPageDAO.deleteTrainer(trainerId);
	}


}
