package com.application.BuildHeyGoms.youtubeAPI.service;

import java.util.List;

import com.application.BuildHeyGoms.youtubeAPI.dto.VideoDTO;

public interface YoutubeLinkService {
	List<VideoDTO> fetchYoutubeVideos();
}
