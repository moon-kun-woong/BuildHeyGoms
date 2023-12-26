package com.application.BuildHeyGoms.member.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.application.BuildHeyGoms.member.dto.ClassMemberDTO;
import com.application.BuildHeyGoms.member.dto.MemberDTO;
import com.application.BuildHeyGoms.member.service.MemberService;
import com.application.BuildHeyGoms.myPage.dto.ClassDTO;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.protobuf.TextFormat.ParseException;


@Controller
@RequestMapping("/member")
public class MemberController {
	
	private String FILE_REPO_PATH = "C:\\BuildHeyGoms_file_repo\\";
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/mainMember")
	public ModelAndView mainMember() throws Exception {
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
		
		if (multipartRequest.getParameter("smsstsYn") == null )  memberDTO.setSmsstsYn("N");
		else													 memberDTO.setSmsstsYn("Y");
		
		memberDTO.setEmail(multipartRequest.getParameter("email"));
		
		if (multipartRequest.getParameter("emailstsYn") == null) memberDTO.setEmailstsYn("N");
		else													 memberDTO.setEmailstsYn("Y");
		
		memberDTO.setZipcode(multipartRequest.getParameter("zipcode"));
		memberDTO.setRoadAddress(multipartRequest.getParameter("roadAddress"));
		memberDTO.setJibunAddress(multipartRequest.getParameter("jibunAddress"));
		memberDTO.setNamujiAddress(multipartRequest.getParameter("namujiAddress"));
		memberDTO.setExercise(multipartRequest.getParameter("exercise"));
		memberDTO.setIntroduction(multipartRequest.getParameter("introduction"));
		memberDTO.setActiveAccountYN("Y");
		
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
		
		if (memberService.loginMember(memberDTO) != null) {
			
			HttpSession session = request.getSession();
			session.setAttribute("memberId", memberDTO.getMemberId());
			
			System.out.println("pass");
			return "pass";
			
		} 
		else {
			
			System.out.println("fail");
			return "fail";
		}
		
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
	
	@GetMapping("/videoList")
	public ModelAndView videoList() throws Exception {
		return new ModelAndView("/member/videoList");
	}
	
	
	@GetMapping("/memberSideMatchingScheduler")
	public ModelAndView memberSideMatchingScheduler(HttpServletRequest request) throws Exception {
	    HttpSession session = request.getSession();
	    String memberId = (String) session.getAttribute("memberId");

	    // ObjectMapper를 사용하여 스케줄 데이터를 JSON 문자열로 변환
	    ObjectMapper objectMapper = new ObjectMapper();
	    String scheduleDataJSON = objectMapper.writeValueAsString(memberService.getClassSchedules(memberId));

	    ModelAndView mv = new ModelAndView("/member/memberSideMatchingScheduler");
	    mv.addObject("scheduleDataJSON", scheduleDataJSON);

	    return mv;
	}
	
	
	@GetMapping("/selectedClassDateTrainerList")
	public ModelAndView selectedClassDateTrainerList(@RequestParam("selectedDate") String selectedDate) throws Exception {
		
		List<ClassDTO> classDTO = memberService.findTrainerClassesByDate(selectedDate);
		
		ModelAndView mv = new ModelAndView("/member/selectedClassDateTrainerList");
		mv.addObject("selectedDate", selectedDate);
		mv.addObject("classDTO", classDTO);
		
		return mv;
	}
	
	@PostMapping("/selectedClassDateTrainerList")
	@ResponseBody
	public String selectedClassDateTrainerList(HttpServletRequest request) throws Exception {
		
		ClassMemberDTO classMemberDTO = new ClassMemberDTO();
		
		classMemberDTO.setClassMemberId(request.getParameter("classMemberId"));
		classMemberDTO.setClassId(request.getParameter("classId"));
		classMemberDTO.setMemberId(request.getParameter("memberId"));
		classMemberDTO.setSelectedDateClassMember(request.getParameter("selectedDateClassMember"));
		classMemberDTO.setQuestion(request.getParameter("question"));

		memberService.addClassMember(classMemberDTO);
		
        HttpHeaders responseHeaders = new HttpHeaders();
        responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		String jsScript = "<script>";
			   jsScript += "alert('갱신되었습니다.');";
			   jsScript += "location.href='" + request.getContextPath() + "/trainer/mainTrainer'";
			   jsScript += "</script>";
	   
		return jsScript;
	}
	
	@GetMapping("/selectedClassDateTrainerDetail")
	public ModelAndView selectedClassDateTrainerDetail (@RequestParam("selectedDate") String selectedDate ) throws Exception{
		
		ClassMemberDTO classMemberDTO = memberService.findTrainerOneClassMemberByDate(selectedDate);
		
		ModelAndView mv = new ModelAndView("/member/selectedClassDateTrainerDetail");
		mv.addObject("selectedDate", selectedDate);
		mv.addObject("classMemberDTO", classMemberDTO);
		
		return mv;
	}
	
}
