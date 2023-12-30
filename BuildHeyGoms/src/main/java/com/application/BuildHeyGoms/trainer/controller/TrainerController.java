package com.application.BuildHeyGoms.trainer.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.application.BuildHeyGoms.member.dto.MemberDTO;
import com.application.BuildHeyGoms.myPage.dto.ClassDTO;
import com.application.BuildHeyGoms.trainer.dto.TrainerDTO;
import com.application.BuildHeyGoms.trainer.service.TrainerService;
import com.fasterxml.jackson.databind.ObjectMapper;



@Controller
@RequestMapping("/trainer")
public class TrainerController {
	
	private String FILE_REPO_PATH = "C:\\BuildHeyGoms_file_repo\\";
	
	@Autowired
	private TrainerService trainerService;
	
	
	@GetMapping("/mainTrainer")
	public ModelAndView myInfoMember(HttpServletRequest request) throws Exception {
	    HttpSession session = request.getSession();
	    String trainerId = (String) session.getAttribute("trainerId");

	    // ObjectMapper를 사용하여 스케줄 데이터를 JSON 문자열로 변환
	    ObjectMapper objectMapper = new ObjectMapper();
	    String scheduleDataJSON = objectMapper.writeValueAsString(trainerService.getClassSchedules(trainerId));

	    ModelAndView mv = new ModelAndView("/trainer/mainTrainer");
	    mv.addObject("scheduleDataJSON", scheduleDataJSON);

	    System.out.println(mv);
	    
	    return mv;
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
		
		if (multipartRequest.getParameter("smsstsYn") == null )  trainerDTO.setSmsstsYn("N");
		else													 trainerDTO.setSmsstsYn("Y");
		
		trainerDTO.setEmail(multipartRequest.getParameter("email"));
		
		if (multipartRequest.getParameter("emailstsYn") == null) trainerDTO.setEmailstsYn("N");
		else													 trainerDTO.setEmailstsYn("Y");
		
		trainerDTO.setZipcodeTrainer(multipartRequest.getParameter("zipcodeTrainer"));
		trainerDTO.setRoadAddressTrainer(multipartRequest.getParameter("roadAddressTrainer"));
		trainerDTO.setJibunAddressTrainer(multipartRequest.getParameter("jibunAddressTrainer"));
		trainerDTO.setNamujiAddress(multipartRequest.getParameter("namujiAddress"));
		trainerDTO.setCareerBook(multipartRequest.getParameter("careerBook"));
		trainerDTO.setIntroduction(multipartRequest.getParameter("introduction"));
		trainerDTO.setActiveAccountYN("Y");
		
		trainerService.addTrainer(trainerDTO);
		
		String jsScript = "<script>";
			   jsScript += "alert('You are now a trainer.');";
			   jsScript += "location.href='" + request.getContextPath() + "/member/mainMember';";
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
				jsScript += "location.href='" + request.getContextPath() + "/member/mainMember';";
				jsScript += "</script>";
		
		return jsScript;
		
	}	
	
	
	@GetMapping("/videoList")
	public ModelAndView videoList() throws Exception {
		return new ModelAndView("/trainer/videoList");
	}
	
	
	
	@GetMapping("/mainTrainerMakeSchedule")
	public ModelAndView mainTrainerMakeSchedule(@RequestParam("selectedDate") String selectedDate) throws Exception {
		
		ModelAndView mv = new ModelAndView("/trainer/mainTrainerMakeSchedule");
		mv.addObject("selectedDate", selectedDate);
		return mv;
	}
	
	
    @PostMapping("/mainTrainerMakeSchedule")
    @ResponseBody
	public String classes(HttpServletRequest request) throws Exception{

    	ClassDTO classDTO = new ClassDTO();
    	classDTO.setClassId(request.getParameter("classId"));
    	classDTO.setClassNm(request.getParameter("classNm"));
    	classDTO.setTrainerId(request.getParameter("trainerId"));
    	classDTO.setSelectedDate(request.getParameter("selectedDate"));
    	classDTO.setClassLocation(request.getParameter("classLocation"));
    	classDTO.setClassContent(request.getParameter("classContent"));
    	classDTO.setActiveAccountYN(request.getParameter("activeAccountYN"));
		
        String selectedDate = request.getParameter("selectedDate");
				
        trainerService.addClass(classDTO);
        
        HttpHeaders responseHeaders = new HttpHeaders();
        responseHeaders.add("Content-Type", "text/html; charset=utf-8");
        
		String jsScript = "<script>";
			   jsScript += "location.href='" + request.getContextPath() + "/trainer/mainTrainer';";
			   jsScript += "</script>";
		   
	   return jsScript;
		
	}	
	
	@GetMapping("/mainTrainerMakeScheduleModify")
	public ModelAndView mainTrainerMakeScheduleModify(@RequestParam("selectedDate") String selectedDate , HttpServletRequest request) throws Exception {
		
	    HttpSession session = request.getSession();
	    String trainerId = (String) session.getAttribute("trainerId");
        
	    ClassDTO classDTO = trainerService.getClassScheduleDetail(selectedDate, trainerId);
	    
	    ModelAndView mv = new ModelAndView("/trainer/mainTrainerMakeScheduleModify");
	    mv.addObject("classDTO", classDTO);
	    
	    System.out.println(mv);
	    
	    return mv;
	    
	}
	
	
    @PostMapping("/mainTrainerMakeScheduleModify")
    public ResponseEntity<Object> submitUpdatedClass(@ModelAttribute("classDTO") ClassDTO classDTO, HttpServletRequest request) throws Exception {
       
    	// 업데이트 로직을 호출하고 결과를 받아옵니다.
        boolean isUpdated = trainerService.modifyClassInfo(classDTO);

        if (isUpdated) {
        	
            // 업데이트 성공 시 클라이언트에게 성공 메시지를 전송합니다.
            HttpHeaders responseHeaders = new HttpHeaders();
            responseHeaders.add("Content-Type", "text/html; charset=utf-8");

            String jsScript = "<script>";
            jsScript += " alert('수정되었습니다.');";
            jsScript += " location.href='" + request.getContextPath() + "/trainer/mainTrainer';";
            jsScript += " </script>";

            return new ResponseEntity<>(jsScript, responseHeaders, HttpStatus.OK);
        } else {
            // 업데이트 실패 시 클라이언트에게 실패 메시지를 전송합니다.
            HttpHeaders responseHeaders = new HttpHeaders();
            responseHeaders.add("Content-Type", "text/html; charset=utf-8");

            String jsScript = "<script>";
            jsScript += " alert('수정에 실패하였습니다.');";
            jsScript += " location.href='" + request.getContextPath() + "/trainer/mainTrainer';";
            jsScript += " </script>";

            return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
        }
    }

	@GetMapping("/deleteClass")
	public ResponseEntity<Object> deleteClass(@RequestParam("classId") String classId ,HttpServletRequest request) throws Exception {
		
		trainerService.deleteClass(classId);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		String jsScript  = "<script>";
				jsScript += "location.href='" + request.getContextPath() + "/trainer/mainTrainer';";
				jsScript += "</script>";
		
		return new ResponseEntity<Object>(jsScript, responseHeaders, HttpStatus.OK);
		
	}
    
    

	
	
}
