package com.application.BuildHeyGoms.member.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.application.BuildHeyGoms.member.dto.MemberDTO;
import com.application.BuildHeyGoms.member.service.MemberService;


@Controller
@RequestMapping("/member")
public class MemberController {
	
	private String FILE_REPO_PATH = "C:\\BuildHeyGoms_file_repo\\";
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/mainMember")
	public ModelAndView main() throws Exception {
		return new ModelAndView("/member/mainMember");
	}
	
	@GetMapping("/registerMember")
	public ModelAndView register() throws Exception{
		return new ModelAndView("/member/registerMember");
	}
	
	
	@PostMapping("/registerMember")
	@ResponseBody
	public String register(MultipartHttpServletRequest multipartRequest , HttpServletRequest request) throws Exception {
		
		Iterator<String> fileList = multipartRequest.getFileNames();			
		String fileName = "";
		if (fileList.hasNext()) {												
			MultipartFile uploadFile = multipartRequest.getFile(fileList.next()); 
			if (!uploadFile.getOriginalFilename().isEmpty()) {
				SimpleDateFormat fmt = new SimpleDateFormat("yyyyMMdd");
				fileName = fmt.format(new Date()) + "_" + UUID.randomUUID() + "_" + uploadFile.getOriginalFilename();
				uploadFile.transferTo(new File(FILE_REPO_PATH + fileName)); 
			}
		
		}
		
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMemberId(multipartRequest.getParameter("memberId"));
		memberDTO.setPasswd(multipartRequest.getParameter("passwd"));
		memberDTO.setMemberNm(multipartRequest.getParameter("memberNm"));
		memberDTO.setSex(multipartRequest.getParameter("sex"));
		memberDTO.setBirthDt(multipartRequest.getParameter("birthDt"));
		memberDTO.setHp(multipartRequest.getParameter("hp"));
		memberDTO.setEmail(multipartRequest.getParameter("email"));
		memberDTO.setAddress(multipartRequest.getParameter("address"));
		memberDTO.setExercise(multipartRequest.getParameter("exercise"));
		
		memberDTO.setIntroduction(multipartRequest.getParameter("introduction"));
		memberDTO.setActiveAccountYN(multipartRequest.getParameter("ActiveAccountYN"));
		
		memberService.addMember(memberDTO);
		
		String jsScript = "<script>";
			   jsScript += "alert('You are now a member.');";
			   jsScript += "location.href='" + request.getContextPath() + "/member/mainMember'";
			   jsScript += "</script>";
			   
		return jsScript;
		
	}
	
	@PostMapping("/overlappedId")
	@ResponseBody
	public String overlapped(@RequestParam("memberId") String memberId) throws Exception{
		return memberService.checkOverlappedId(memberId);
	}
	
	
	@GetMapping("/loginMember")
	public ModelAndView loginMember() throws Exception {
		return new ModelAndView("/member/loginMember");
	}
	
	
	@PostMapping("/loginMember")
	@ResponseBody
	public String loginMember(MemberDTO memberDTO , HttpServletRequest request) throws Exception {
		
		String jsScript = "";
		if (memberService.loginMember(memberDTO) != null) {
			
			HttpSession session = request.getSession();
			session.setAttribute("memberId", memberDTO.getMemberId());
			
			jsScript += "<script>";
			jsScript += "alert('You are logged in.');";
			jsScript += "location.href='" + request.getContextPath() + "/member/mainMember'";
			jsScript += "</script>";
			
		} 
		else {
			
			jsScript += "<script>";
			jsScript += "alert('check your Id or Password!');";
			jsScript += "history.go(-1);";
			jsScript += "</script>";
			
		}
		
		return jsScript;
		
	}
	
	
	@GetMapping("/logoutMember")
	@ResponseBody
	public String logoutMember(HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		String jsScript = "<script>";
				jsScript += "alert('You are logged out.');";
				jsScript += "location.href='" + request.getContextPath() + "/member/mainMember'";
				jsScript += "</script>";
		
		return jsScript;
		
	}	
	
	
}
