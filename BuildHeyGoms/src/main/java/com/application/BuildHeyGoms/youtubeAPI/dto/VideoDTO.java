package com.application.BuildHeyGoms.youtubeAPI.dto;

public class VideoDTO {
	private String videoId;
    private String title;
    private String thumbnailUrl;

    public VideoDTO(String title, String thumbnailUrl) {
    	this.videoId = videoId;
        this.title = title;
        this.thumbnailUrl = thumbnailUrl;
    }

    
	public String getVideoId() {
		return videoId;
	}

	public void setVideoId(String videoId) {
		this.videoId = videoId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getThumbnailUrl() {
		return thumbnailUrl;
	}

	public void setThumbnailUrl(String thumbnailUrl) {
		this.thumbnailUrl = thumbnailUrl;
	}

    
    
    
}
