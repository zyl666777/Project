<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<jsp:useBean id='objDBConfig'  scope='request' class='hitstd.group.tool.database.DBconfig' />
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>�а�</title>
</head>
<body>
<label>�d�ݤW�Z���</label>
<form action="schedule_pick2.jsp" method="post">
 <input type="text" name="ID"> 
 <input type="submit">   
</form> 
<%request.getParameter("doctorID"); %>
<label>�а��ӽ�</label>
<form action="schedule_Insert.jsp" method="post">     
<select name="role">
                <option>�п�ܩm�W</option>
                <option value="123456">���p��</option>
                <option value="789223">���j��</option>
                <option value="111213">�����</option>
            </select>
 <input type="date" name="dateValue">
 <lable>�}�l</lable>
 <input type="time" name="timeValue">
 <lable>����</lable>
 <input type="time" name="timeValue2">
 <input type="text" name="textValue">
 <input type="submit" >

</form> 
</body>
</html>