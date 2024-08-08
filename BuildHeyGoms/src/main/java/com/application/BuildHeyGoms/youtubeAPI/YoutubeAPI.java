package com.application.BuildHeyGoms.youtubeAPI;

// 필요한 라이브러리를 포함해야 할 수 있습니다.
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;
import org.json.JSONArray;
import org.json.JSONObject;

public class YoutubeAPI {
    public static void main(String[] args) throws IOException {
        String apiKey = ""; // 발급받은 YouTube Data API 키를 여기에 입력하세요.
        String searchQuery = "운동"; // 검색어
        URL url = new URL("https://www.googleapis.com/youtube/v3/search?part=snippet&q=" + searchQuery + "&maxResults=6&key=" + apiKey);

        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.connect();

        // 응답을 String으로 변환
        String inline = "";
        Scanner scanner = new Scanner(url.openStream());

        while (scanner.hasNext()) {
            inline += scanner.nextLine();
        }
        scanner.close();

        // String을 JSON으로 파싱
        JSONObject jsonObject = new JSONObject(inline);
        JSONArray itemsArray = jsonObject.getJSONArray("items");

        // 각 비디오에 대한 정보 추출
        for (int i = 0; i < itemsArray.length(); i++) {
            JSONObject item = itemsArray.getJSONObject(i);
            JSONObject snippet = item.getJSONObject("snippet");
            String title = snippet.getString("title");
            String thumbnailUrl = snippet.getJSONObject("thumbnails").getJSONObject("default").getString("url");

            System.out.println("Title: " + title);
            System.out.println("Thumbnail URL: " + thumbnailUrl);
            // ... JSP 페이지로 데이터 전달을 위한 추가적인 작업 ...
        }
    }
}

