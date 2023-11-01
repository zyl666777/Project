<%@ page language="java" contentType="text/html; charset=BIG5"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<jsp:useBean id='objDBconfig' scope='session' class='hitstd.group.tool.database.DBconfig' />
<%@ page import="date.text.turndate" %>
<%@include file ="menu.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>firm schedule</title>
</head>
<body>
<h2>請假成功，固定班表</h2>
<%
Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
Connection con = null;
PreparedStatement updateWorkStmt = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
    con = DriverManager.getConnection("jdbc:ucanaccess://" + objDBconfig.FilePath() + ";");
    

    String sql = "SELECT doctor_ID, solution FROM work WHERE solution = ?";
    pstmt = con.prepareStatement(sql);
    pstmt.setBoolean(1, true);
    rs = pstmt.executeQuery();

    out.println("<h2>符合條件的工作：</h2>");
    out.println("<ul>");

    while (rs.next()) {
        String doctorID = rs.getString("doctor_ID");
        boolean solution = rs.getBoolean("solution");

        out.println("<li>Doctor ID: " + doctorID + ", Solution: " + solution + "</li>");
    }

    out.println("</ul>");
} catch (Exception e) {
    e.printStackTrace();
} finally {
    try {
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (updateWorkStmt != null) updateWorkStmt.close();
        if (con != null) con.close();
    } catch (SQLException ex) {
        ex.printStackTrace();
    }
}
%>
</body>
</html>
