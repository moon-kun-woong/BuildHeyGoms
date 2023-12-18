package com.application.BuildHeyGoms.trainer.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.application.BuildHeyGoms.trainer.dto.TrainerDTO;
import com.application.BuildHeyGoms.trainer.service.TrainerService;



@Controller
@RequestMapping("/trainer")
public class TrainerController {
	
	private String FILE_REPO_PATH = "C:\\BuildHeyGoms_file_repo\\";
	
	@Autowired
	private TrainerService trainerService;
	
	@GetMapping("/mainTrainer")
	public ModelAndView main() throws Exception {
		return new ModelAndView("/trainer/mainTrainer");
	}
	
	@GetMapping("/registerTrainer")
	public ModelAndView register() throws Exception{
		return new ModelAndView("/trainer/registerTrainer");
	}
	
	
	@PostMapping("/registerTrainer")
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
		
		TrainerDTO trainerDTO = new TrainerDTO();
		trainerDTO.setTrainerId(multipartRequest.getParameter("trainerId"));
		trainerDTO.setPasswd(multipartRequest.getParameter("passwd"));
		trainerDTO.setTrainerNm(multipartRequest.getParameter("trainerNm"));
		trainerDTO.setSex(multipartRequest.getParameter("sex"));
		trainerDTO.setBirthDt(multipartRequest.getParameter("birthDt"));
		trainerDTO.setHp(multipartRequest.getParameter("hp"));
		trainerDTO.setEmail(multipartRequest.getParameter("email"));
		trainerDTO.setAddress(multipartRequest.getParameter("address"));
		trainerDTO.setBusinessLocation(multipartRequest.getParameter("businessLocation"));
		trainerDTO.setConnectedMember(multipartRequest.getParameter("connectedMember"));
		trainerDTO.setCareerBook(multipartRequest.getParameter("careerBook"));
//		@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
//		trainerDTO.setJoinDt(joinDt);
		trainerDTO.setIntroduction(multipartRequest.getParameter("introduction"));
		trainerDTO.setActiveAccountYN(multipartRequest.getParameter("ActiveAccountYN"));
		
		trainerService.addTrainer(trainerDTO);
		
		String jsScript = "<script>";
			   jsScript += "alert('You are now a trainer.');";
			   jsScript += "location.href='" + request.getContextPath() + "/member/mainMember'";
			   jsScript += "</script>";
			   
		return jsScript;
		
	}
	
	@PostMapping("/overlappedId")
	@ResponseBody
	public String overlapped(@RequestParam("trainerId") String trainerId) throws Exception{
		return trainerService.checkOverlappedId(trainerId);
	}
	
	
	@GetMapping("/loginTrainer")
	public ModelAndView loginTrainer() throws Exception {
		return new ModelAndView("/trainer/loginTrainer");
	}
	
	
	@PostMapping("/loginTrainer")
	@ResponseBody
	public String loginTrainer(TrainerDTO trainerDTO , HttpServletRequest request) throws Exception {
		
		if (trainerService.loginTrainer(trainerDTO) != null) {
			
			HttpSession session = request.getSession();
			session.setAttribute("trainerId", trainerDTO.getTrainerId());
			
			System.out.println("pass");
			return "pass";
			
		} 
		else {
			
			System.out.println("fail");
			return "fail";
		}
		
	}
	
	
	@GetMapping("/logoutTrainer")
	@ResponseBody
	public String logoutTrainer(HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();
		session.invalidate();
		
		String jsScript = "<script>";
				jsScript += "alert('You are logged out.');";
				jsScript += "location.href='" + request.getContextPath() + "/member/mainMember'";
				jsScript += "</script>";
		
		return jsScript;
		
	}	
	
	
}
