<%@ page language="java" contentType="text/html; charset=BIG5"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<jsp:useBean id='objDBconfig' scope='session' class='hitstd.group.tool.database.DBconfig' />
<%@ page import="date.text.turndate" %>
<!DOCTYPE html>
<html>
<head>
<title>預約資料</title>
</head>
<body>
<%

try {
	Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
	Connection con = DriverManager.getConnection("jdbc:ucanaccess://" + objDBconfig.FilePath() + ";");
	System.out.println("Connection successful!"); 
    PreparedStatement psmt = con.prepareStatement("SELECT * FROM appoint WHERE patient_ID=?");
    

    ResultSet rs = psmt.executeQuery();
   
    while (rs.next()) {
%>
<table>
    <tr>
        <td><%= rs.getString("patient_ID") %></td>
        <td><%= rs.getString("doctor") %></td>
        <td><%= rs.getString("estimate") %></td>
        <td><%= rs.getString("frequency") %></td>
    </tr>
    </table>
<%
    }
    
    rs.close();
    psmt.close();
    con.close();
} catch (Exception e) {
    // Handle exceptions if needed
	 e.printStackTrace(); 
}
%>
</body>
</html>
