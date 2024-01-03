package com.application.BuildHeyGoms.youtubeAPI.dao;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Scanner;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Repository;
import java.util.List;
import com.application.BuildHeyGoms.youtubeAPI.dto.VideoDTO;

@Repository
public class YoutubeLinkDAOImpl implements YoutubeLinkDAO {

    // YouTube API key and other constants here

    @Override
    public List<VideoDTO> getYoutubeVideos() {
        List<VideoDTO> videos = new ArrayList<>();
        String apiKey = "AIzaSyAjaGdho36QMz3Hv09EiXfToDGQgZHrwog"; // YouTube API 키
        String searchQuery = "헬스"; // 검색어

        try {
            URL url = new URL("https://www.googleapis.com/youtube/v3/search?part=snippet&q=" + searchQuery + "&maxResults=6&key=" + apiKey);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.connect();

            String inline = "";
            Scanner scanner = new Scanner(url.openStream());
            while (scanner.hasNext()) {
                inline += scanner.nextLine();
            }
            scanner.close();

            JSONObject jsonObject = new JSONObject(inline);
            JSONArray itemsArray = jsonObject.getJSONArray("items");

            for (int i = 0; i < itemsArray.length(); i++) {
                JSONObject item = itemsArray.getJSONObject(i);
                JSONObject snippet = item.getJSONObject("snippet");
                String title = snippet.getString("title");
                String thumbnailUrl = snippet.getJSONObject("thumbnails").getJSONObject("default").getString("url");

                videos.add(new VideoDTO(title, thumbnailUrl));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        return videos;
    }
}