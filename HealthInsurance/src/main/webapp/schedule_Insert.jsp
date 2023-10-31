<%@ page language="java" contentType="text/html; charset=BIG5" pageEncoding="BIG5"%>
<%@ page import="java.sql.*, java.text.SimpleDateFormat" %>

<jsp:useBean id='objDBconfig' scope='request' class='hitstd.group.tool.database.DBconfig' />
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>INSERT</title>
</head>
<body>
<%
    // �ˬd�ШD���O�_�]�t�r�Žs�X�H��
    if (request.getCharacterEncoding() == null) {
        request.setCharacterEncoding("BIG5");
    }

    // ��������쪺��
    String textValue = request.getParameter("textValue");
if (textValue != null && !textValue.isEmpty()) {
    // �b�o�̨ϥ�textValue
} else {
    // �B�ztextValue��null�ΪŪ����p
    response.sendRedirect("test.jsp"); // ���w�V����~��������ܿ��~����
}

    String role = request.getParameter("role");
    if (role != null && !role.isEmpty()) {
        // �b�o�̨ϥ�textValue
    } else {
        // �B�ztextValue��null�ΪŪ����p
        response.sendRedirect("test.jsp"); // ���w�V����~��������ܿ��~����
    }
    String dateValueStr = request.getParameter("dateValue");
    if (dateValueStr != null && !dateValueStr.isEmpty()) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        java.util.Date utilDate = dateFormat.parse(dateValueStr);
        java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
        // �l�U���N�X
    } else {
        // �B�zdateValueStr��null�ΪŪ����p�A�Ҧp���w�V��t�@�ӭ�������ܿ��~�����C
        response.sendRedirect("test.jsp"); // �Nerror.jsp�������A�����~�B�z����
    
    }


    // �N����r���ഫ�� java.util.Date ��H
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    java.util.Date utilDate = dateFormat.parse(dateValueStr);
    
    // �N java.util.Date ��H�ഫ�� java.sql.Date ��H
    java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());

    // �s����ƾڮw�ô��J�ƾ�
    Connection con = null;
    PreparedStatement updateWorkStmt = null;

    try {
        Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
        con = DriverManager.getConnection("jdbc:ucanaccess://" + objDBconfig.FilePath() + ";");
        Statement smt = con.createStatement();
        String insertQuery = "INSERT INTO break (doctor_ID, reason, `date`) VALUES (?, ?, ?)";
        PreparedStatement insertStmt = con.prepareStatement(insertQuery);
        insertStmt.setString(1, role);
        insertStmt.setString(2, textValue);
        insertStmt.setDate(3, sqlDate); // �ϥ� java.sql.Date ����
        insertStmt.executeUpdate();

        String updateWorkQuery = "UPDATE work SET solution = false WHERE doctor_ID = ?";
        updateWorkStmt = con.prepareStatement(updateWorkQuery);
        updateWorkStmt.setString(1, role); // �ϥΪ�洣�檺 role �Ѽ�
        updateWorkStmt.executeUpdate();

        response.sendRedirect("work_schedule.jsp");

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // �T�O�����귽
        try {
            if (updateWorkStmt != null) {
                updateWorkStmt.close();
            }
            if (con != null) {
                con.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
</body>
</html>
