<%@ page language="java" contentType="text/html; charset=BIG5" pageEncoding="BIG5"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<jsp:useBean id='objDBconfig' scope='session' class='hitstd.group.tool.database.DBconfig' />
<%@ page import="date.text.turndate" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>���T�w�Z��&�а���ƪ�</title>
</head>
<body>

<%
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
    // �إ߸�Ʈw�s��
    Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
    conn = DriverManager.getConnection("jdbc:ucanaccess://"+objDBconfig.FilePath()+";");

    // �ǳ�SQL�d��
    String query = "SELECT * FROM break, work WHERE break.start <= ? AND break.end >= ? AND break.solution = ? AND work.start <= ? AND work.end >= ? AND work.solution = ? AND break.doctor_ID = work.doctor_ID";
    pstmt = conn.prepareStatement(query);

    // ���o��e�����java.sql.Date����
    java.sql.Date currentDate = turndate.convertToSqlDate("2023/10/31");

    // �]�w�Ѽ�
    pstmt.setDate(1, currentDate);
    pstmt.setDate(2, currentDate);
    pstmt.setBoolean(3, true);
    pstmt.setDate(4, currentDate);
    pstmt.setDate(5, currentDate);
    pstmt.setBoolean(6, false);

    // ����SQL�d��
    rs = pstmt.executeQuery();

    // �B�z�d�ߵ��G
    while (rs.next()) {
        // ����d�ߵ��G������
        String start = rs.getString("start");
        String end = rs.getString("end");
        String solution = rs.getString("solution");
        String doctorID = rs.getString("doctor_ID");

        // �b�o�̳B�z�d�ߵ��G�A�Ҧp�N���G��ܦb�����W
        out.println("Doctor ID: " + doctorID + ", Start: " + start + ", End: " + end + ", Solution: " + solution + "<br>");
    }
} catch (SQLException e) {
    // �NSQL�ҥ~�ߵ��W�h�B�z�]�i��O���~�����Ϊ�Servlet�e�������~�����B�z����^
    throw new ServletException(e);
} catch (Exception e) {
    // ��L�������ҥ~�B�z
    e.printStackTrace();
} finally {
    // �����귽
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
