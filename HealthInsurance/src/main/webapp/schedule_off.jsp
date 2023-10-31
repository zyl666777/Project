<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@page import="java.sql.*"%>
<%@ page import="java.util.*" %>
<jsp:useBean id='objDBConfig'  scope='request' class='hitstd.group.tool.database.DBconfig' />
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>請假</title>
</head>
<body>
<label>查看上班日期</label>
<form action="schedule_pick2.jsp" method="post">
 <input type="text" name="ID"> 
 <input type="submit">   
</form> 
<%request.getParameter("doctorID"); %>
<label>請假申請</label>
<form action="schedule_Insert.jsp" method="post">     
<select name="role">
                <option>請選擇姓名</option>
                <option value="123456">王小美</option>
                <option value="789223">王大有</option>
                <option value="111213">王曉明</option>
            </select>
 <input type="date" name="dateValue">
 <lable>開始</lable>
 <input type="time" name="timeValue">
 <lable>結束</lable>
 <input type="time" name="timeValue2">
 <input type="text" name="textValue">
 <input type="submit" >

</form> 
</body>
</html>