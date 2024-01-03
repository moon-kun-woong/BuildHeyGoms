package com.application.BuildHeyGoms.youtubeAPI.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import java.util.List;

import com.application.BuildHeyGoms.youtubeAPI.dto.VideoDTO;
import com.application.BuildHeyGoms.youtubeAPI.service.YoutubeLinkService;

@Controller
public class YoutubeLinkController {

    @Autowired
    private YoutubeLinkService youtubeService;

    @RequestMapping(value = "/videoList", method = RequestMethod.GET)
    public ModelAndView getYoutubeVideos() {
        ModelAndView modelAndView = new ModelAndView("/trainer/videoList");
        List<VideoDTO> videoDTO = youtubeService.fetchYoutubeVideos();
        
        System.out.println(videoDTO);
        
        modelAndView.addObject("videoDTO", videoDTO);
        return modelAndView;
    }
}