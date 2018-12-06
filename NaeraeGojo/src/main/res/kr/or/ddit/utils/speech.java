package kr.or.ddit.utils;


import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;

public class speech {

    public static void main(String[] args) {
        String clientId = "j11xojhgak";             // Application Client ID";
        String clientSecret = "QkNynRn1OxJNAoe6Z1eDko2sLwiWbT3bdSoCeHTN";     // Application Client Secret";

        try {
            String imgFile = "음성 파일 경로";
            File voiceFile = new File(imgFile);

            String language = "Kor";        // 언어 코드 ( Kor, Jpn, Eng, Chn )
            String apiURL = "https://naveropenapi.apigw.ntruss.com/recog/v1/stt?lang=" + language;
            URL url = new URL(apiURL);

            HttpURLConnection conn = (HttpURLConnection)url.openConnection();
            conn.setUseCaches(false);
            conn.setDoOutput(true);
            conn.setDoInput(true);
            conn.setRequestProperty("Content-Type", "application/octet-stream");
            conn.setRequestProperty("X-NCP-APIGW-API-KEY-ID", clientId);
            conn.setRequestProperty("X-NCP-APIGW-API-KEY", clientSecret);

            OutputStream outputStream = conn.getOutputStream();
            FileInputStream inputStream = new FileInputStream("C:/Users/Administrator/Desktop/사진/공유/카누_SUMMER.mp4");
            byte[] buffer = new byte[4096];
            int bytesRead = -1;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
            outputStream.flush();
            inputStream.close();
            BufferedReader br = null;
            int responseCode = conn.getResponseCode();
            if(responseCode == 200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            } else {  // 에러 발생
                System.out.println("error!!!!!!! responseCode= " + responseCode);
                br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            }
            String inputLine;

            StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
			    response.append(inputLine);
			}
			br.close();
			System.out.println(response.toString());
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}