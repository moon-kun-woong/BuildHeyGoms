package com.application.BuildHeyGoms.youtubeAPI.dao;

import java.util.List;

import com.application.BuildHeyGoms.youtubeAPI.dto.VideoDTO;

public interface YoutubeLinkDAO {
    List<VideoDTO> getYoutubeVideos();
}
