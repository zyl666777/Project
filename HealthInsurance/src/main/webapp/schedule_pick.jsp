<%@ page language="java" contentType="text/html; charset=BIG5" pageEncoding="BIG5"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<jsp:useBean id='objDBconfig' scope='session' class='hitstd.group.tool.database.DBconfig' />
<%@ page import="date.text.turndate" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>比對固定班表&請假資料表</title>
</head>
<body>

<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
    // 建立資料庫連接
    Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
    conn = DriverManager.getConnection("jdbc:ucanaccess://"+objDBconfig.FilePath()+";");

    // 準備SQL查詢
    String query = "SELECT * FROM break, work WHERE break.start <= ? AND break.end >= ? AND break.solution = ? AND work.start <= ? AND work.end >= ? AND work.solution = ? AND break.doctor_ID = work.doctor_ID";
    pstmt = conn.prepareStatement(query);

    // 取得當前日期的java.sql.Date物件
    java.sql.Date currentDate = turndate.convertToSqlDate("2023/10/31");

    // 設定參數
    pstmt.setDate(1, currentDate);
    pstmt.setDate(2, currentDate);
    pstmt.setBoolean(3, true);
    pstmt.setDate(4, currentDate);
    pstmt.setDate(5, currentDate);
    pstmt.setBoolean(6, false);

    // 執行SQL查詢
    rs = pstmt.executeQuery();

    // 處理查詢結果
    while (rs.next()) {
        // 獲取查詢結果的欄位值
        String start = rs.getString("start");
        String end = rs.getString("end");
        String solution = rs.getString("solution");
        String doctorID = rs.getString("doctor_ID");

        // 在這裡處理查詢結果，例如將結果顯示在頁面上
        out.println("Doctor ID: " + doctorID + ", Start: " + start + ", End: " + end + ", Solution: " + solution + "<br>");
    }
} catch (SQLException e) {
    // 將SQL例外拋給上層處理（可能是錯誤頁面或者Servlet容器的錯誤頁面處理機制）
    throw new ServletException(e);
} catch (Exception e) {
    // 其他類型的例外處理
    e.printStackTrace();
} finally {
    // 關閉資源
    try {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (conn != null) conn.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
%>
 
</body>
</html>
