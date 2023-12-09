package com.application.BuildHeyGoms.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import com.application.BuildHeyGoms.member.service.MemberService;


@Controller
public class MemberController {
	
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
	
}
