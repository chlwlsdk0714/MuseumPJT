package com.bc.resource;

import java.io.FileInputStream;
import java.sql.*;

import java.text.SimpleDateFormat;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

public class ExhibitionJsonLoad {
	
	public static void main(String[] args) {
		
		//JSON 읽기
		JsonArray jsonArr = null;
		
		String filepath = "C:/MyStudy/60_web/CallBackMuseum/WebContent/exhibition/json/data.json";
		FileInputStream filestream = null;
		
		try {
			filestream = new FileInputStream(filepath);
			byte[] readBuffer = new byte[filestream.available()];
			while (filestream.read(readBuffer) != -1);
			String str = new String(readBuffer);
			
			JsonElement jsonElement = JsonParser.parseString(str);
			jsonArr = jsonElement.getAsJsonArray();
			System.out.println("jsonArr = " + jsonArr.size());
			
			//데이터 확인
			for (JsonElement element : jsonArr) {
				JsonObject asJsonObject = element.getAsJsonObject();
				JsonElement exhib_subject = asJsonObject.get("EXHIB_ARTIST");
				System.out.println("exhib_subject = " + exhib_subject.toString());
			}
			System.out.println("---데이터 확인 끝---");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//JDBC 쓰기
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String id = "museum";
	    String pw = "museum";
	    
	    try {
	    	Class.forName("oracle.jdbc.OracleDriver");
	    	 Connection conn = DriverManager.getConnection(url, id, pw);
	            String sql = "INSERT INTO MU_EXHIBITION \n" +
	                    " (EXHIB_IDX, EXHIB_SUBJECT, EXHIB_PERIOD_START, EXHIB_PERIOD_END," +
	                    " EXHIB_VENUE, EXHIB_ARTIST, EXHIB_ARTWORKS_CNT, EXHIB_ADMISSION," +
	                    " EXHIB_ORGANIZATION, EXHIB_CONTENT, EXHIB_THUMB_PATH)" +
	                    " VALUES(EXHIB_SEQ.NEXTVAL, ?,?,?,?,?,?,?,?,?,?)";
	            PreparedStatement pstmt = conn.prepareStatement(sql);

	            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	            
	            for (JsonElement jsonEl : jsonArr) {
	            	JsonObject obj = jsonEl.getAsJsonObject();
	            	
	            	String start = obj.get("EXHIB_PERIOD_START").toString();
	            	start = start.substring(1, start.length() - 1);
	            	
	            	String end = obj.get("EXHIB_PERIOD_END").toString();
	            	end = end.substring(1, end.length() - 1);
	            	
	            	System.out.println("obj.get(\"EXHIB_PERIOD_START\").toString() = " 
	            						+ obj.get("EXHIB_PERIOD_START").toString());
	            	pstmt.setString(1, obj.get("EXHIB_SUBJECT").toString().replace("\"", ""));
	            	pstmt.setDate(2, new Date(sdf.parse(start).getTime()));
	                pstmt.setDate(3, new Date(sdf.parse(end).getTime()));
	                pstmt.setString(4, obj.get("EXHIB_VENUE").toString().replace("\"", ""));
	                pstmt.setString(5, obj.get("EXHIB_ARTIST").toString().replace("\"", ""));
	                pstmt.setString(6, obj.get("EXHIB_ARTWORKS_CNT").toString().replace("\"", ""));
	                pstmt.setString(7, obj.get("EXHIB_ADMISSION").toString().replace("\"", ""));
	                pstmt.setString(8, obj.get("EXHIB_ORGANIZATION").toString().replace("\"", ""));
	                pstmt.setString(9, obj.get("EXHIB_CONTENT").toString().replace("\"", ""));
	                pstmt.setString(10, obj.get("EXHIB_THUMB_PATH").toString().replace("\"", ""));
	                pstmt.executeUpdate();
	            }
	            pstmt.close();
	            conn.close();
	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	}
	
}

















