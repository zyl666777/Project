<%@ page language="java" contentType="text/html; charset=BIG5"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<jsp:useBean id='objDBconfig' scope='session' class='hitstd.group.tool.database.DBconfig' />
<%@ page import="date.text.turndate" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>查詢上班日期</title>
<style>
    .result-link {
        text-decoration: underline;
        color: blue;
        cursor: pointer;
    }
</style>
</head>
<body>

<%
String doctorIDToSearch = request.getParameter("ID"); // 獲取使用者輸入的doctor_ID
if (doctorIDToSearch != null && !doctorIDToSearch.isEmpty()) {
    Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
    Connection con = DriverManager.getConnection("jdbc:ucanaccess://" + objDBconfig.FilePath() + ";");

    PreparedStatement pstmt = con.prepareStatement("SELECT * FROM work WHERE work.doctor_ID = ?");
    pstmt.setString(1, doctorIDToSearch);
    ResultSet rs = pstmt.executeQuery();

    // 處理查詢結果
    while (rs.next()) {
        // 獲取查詢結果的欄位值
        String start = rs.getString("start");
        String end = rs.getString("end");
        String doctorID = rs.getString("doctor_ID");
        String solution = rs.getString("solution");
        String link = "<a class='result-link' href='schedule_off.jsp?doctorID=ID" + doctorID + "&start=" + start + "&end=" + end + "&solution=" + solution + "'>Doctor ID: " + doctorID + ", Start: " + start + ", End: " + end + ", 狀態: " + solution + "</a><br>";

        // 在這裡處理查詢結果，例如將結果顯示在頁面上
        out.println(link);
       
    }

    // 關閉資源
    rs.close();
    pstmt.close();
    con.close();
}
%>
</body>
</html>
