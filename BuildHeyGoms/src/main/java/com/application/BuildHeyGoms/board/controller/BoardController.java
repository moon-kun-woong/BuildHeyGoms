package com.application.BuildHeyGoms.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.application.BuildHeyGoms.board.dto.BoardDTO;
import com.application.BuildHeyGoms.board.service.BoardServiceImpl;


@Controller
public class BoardController {

	@Autowired
	private BoardServiceImpl boardService;
	
	@GetMapping("/addBoard")
	public ModelAndView addBoard(){
		return new ModelAndView("board/contents/addBoard");
	}
	
	@PostMapping("/addBoard")
	@ResponseBody
	public String addBoard(@ModelAttribute BoardDTO boardDTO){
		
		// 단위 테스트
//		System.out.println(boardDTO);
		
		boardService.addBoard(boardDTO);
		
		String jsScript = "<script>";
				jsScript+= "alert('Post Added.');";
				jsScript+= "location.href='boardList';";
				jsScript+= "</script>";
				
				
		return jsScript;
	}
	
	
	@GetMapping("/boardList")
	public ModelAndView boardList(){
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/contents/boardList");
		
//		List<BoardDTO> boardList = boardService.getBoardList();
//		//단위 테스트
//		System.out.println(boardList);
//		
//		mv.addObject("boardList" , boardList);
		
		mv.addObject("boardList" , boardService.getBoardList());
		return mv;
	}
	
	@GetMapping("/boardDetail")
	public ModelAndView boardDetail(@RequestParam("boardId") Long boardId) {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("board/contents/boardDetail");
		
//		//단위 테스트
//		BoardDTO boardDTO = boardService.getBoardDetail(boardId);
//		System.out.println(boardDTO);
//		//mv.addObject("boardDTO", boardDTO);
		
		mv.addObject("boardDTO" , boardService.getBoardDetail(boardId , true));
		
		return mv;
	}
	
	
	private void name() {
		String integer = new String();
		System.out.println(integer);
	}
	

	
}
