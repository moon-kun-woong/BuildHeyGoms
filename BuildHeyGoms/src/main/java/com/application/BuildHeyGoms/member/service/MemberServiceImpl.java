package com.application.BuildHeyGoms.member.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.application.BuildHeyGoms.member.dao.MemberDAO;
import com.application.BuildHeyGoms.member.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	private String FILE_REPO_PATH = "C:\\BuildHeyGoms_file_repo\\";
	
	private static Logger logger = LoggerFactory.getLogger(MemberServiceImpl.class);
	
	@Override
	public void addMember(MemberDTO memberDTO) throws Exception{
		memberDTO.setPasswd(bCryptPasswordEncoder.encode(memberDTO.getPasswd())); 
		memberDAO.insertMember(memberDTO);
	}

	
	
	
	
	@Override
	public String checkOverlappedId(String memberId) throws Exception{
		
		String isOverLapped = "Y";
		
		if (memberDAO.selectOneDuplicatedMemberCheck(memberId) == null) {
			return "N";
		}
		
		return isOverLapped;
		
	}

	@Override
	public MemberDTO loginMember(MemberDTO memberDTO) throws Exception {
		
		MemberDTO dbMemberDTO = memberDAO.selectOneloginMember(memberDTO.getMemberId());
		
		if (dbMemberDTO != null) {
			if (bCryptPasswordEncoder.matches(memberDTO.getPasswd(), dbMemberDTO.getPasswd())) {
				return memberDTO;
			} 
		}
		
		return null;
	}
	
	@Override
	public List<MemberDTO> getMemberList() throws Exception {
		return memberDAO.selectListMember();
	}
}