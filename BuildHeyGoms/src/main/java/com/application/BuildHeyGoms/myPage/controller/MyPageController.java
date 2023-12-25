package com.application.BuildHeyGoms.myPage.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.application.BuildHeyGoms.member.dto.MemberDTO;
import com.application.BuildHeyGoms.member.service.MemberService;
import com.application.BuildHeyGoms.myPage.service.MyPageService;
import com.application.BuildHeyGoms.trainer.dto.TrainerDTO;
import com.mysql.cj.Session;


@Controller
@RequestMapping("/myPage")
public class MyPageController {

	@Autowired
	private MyPageService myPageService;
	
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/myInfoMember")
	public ModelAndView myInfoMember(HttpServletRequest request) throws Exception {
	    HttpSession session = request.getSession();
	    String memberId = (String) session.getAttribute("memberId");

	    if (memberId != null) {
	        MemberDTO memberDTO = myPageService.getMyInfo(memberId);

	        ModelAndView mv = new ModelAndView("/myPage/myInfoMember");
	        mv.addObject("memberDTO", memberDTO);

	        return mv;
	    } else {
	        return new ModelAndView("redirect:/member/loginMember");
	    }
	}
	
	@PostMapping("/modifyInfo")
	public ResponseEntity<Object> modifyInfo(MemberDTO memberDTO , HttpServletRequest request) throws Exception {

		myPageService.modifyMyInfo(memberDTO);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		String jsScript  = "<script>";
				jsScript += " alert('수정되었습니다.');";
				jsScript += " location.href='" + request.getContextPath() + "/myPage/myInfoMember?memberId=" + memberDTO.getMemberId() +  "';";
				jsScript += " </script>";
		
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
		
	}
	
	
	@GetMapping("/removeMember")
	public ResponseEntity<Object> removeMember(HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		session.invalidate(); 
		
		myPageService.removeMember(request.getParameter("memberId"));
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		String jsScript  = "<script>";
				jsScript += "alert('탈퇴되었습니다.');";
				jsScript += "location.href='" + request.getContextPath() + "/';";
				jsScript += "</script>";
		
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
		
	}
	
	
	
	
	@GetMapping("/myInfoTrainer")
	public ModelAndView myInfoTrainer(HttpServletRequest request) throws Exception {
	    HttpSession session = request.getSession();
	    String trainerId = (String) session.getAttribute("trainerId");

	    if (trainerId != null) {
	        TrainerDTO trainerDTO = myPageService.getMyInfoTrainer(trainerId);

	        ModelAndView mv = new ModelAndView("/myPage/myInfoTrainer");
	        mv.addObject("trainerDTO", trainerDTO);

	        return mv;
	    } else {
	        return new ModelAndView("redirect:/member/loginMember");
	    }
	}
	
	@PostMapping("/modifyInfoTrainer")
	public ResponseEntity<Object> modifyInfoTrainer(TrainerDTO trainerDTO , HttpServletRequest request) throws Exception {

		myPageService.modifyMyInfoTrainer(trainerDTO);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		String jsScript  = "<script>";
				jsScript += " alert('수정되었습니다.');";
				jsScript += " location.href='" + request.getContextPath() + "/myPage/myInfoTrainer?trainerId=" + trainerDTO.getTrainerId() +  "';";
				jsScript += " </script>";
		
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
		
	}
	
	
	@GetMapping("/removeTrainer")
	public ResponseEntity<Object> removeTrainer(HttpServletRequest request) throws Exception {
		
		HttpSession session = request.getSession();
		session.invalidate(); 
		
		myPageService.removeTrainer(request.getParameter("trainerId"));
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		String jsScript  = "<script>";
				jsScript += "alert('탈퇴되었습니다.');";
				jsScript += "location.href='" + request.getContextPath() + "/';";
				jsScript += "</script>";
		
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
		
	}

	
	
}
