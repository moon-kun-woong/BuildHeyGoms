package com.application.BuildHeyGoms.youtubeAPI.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.application.BuildHeyGoms.youtubeAPI.dao.YoutubeLinkDAO;
import com.application.BuildHeyGoms.youtubeAPI.dto.VideoDTO;
import java.util.List;

@Service
public class YoutubeLinkServiceImpl implements YoutubeLinkService{
    @Autowired
    private YoutubeLinkDAO youtubeDAO;

    @Override
    public List<VideoDTO> fetchYoutubeVideos() {
        return youtubeDAO.getYoutubeVideos();
    }
}
