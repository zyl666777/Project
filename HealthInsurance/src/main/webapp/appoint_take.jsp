<%@ page language="java" contentType="text/html; charset=BIG5" pageEncoding="BIG5"%>
<%@ page import="java.sql.*, java.text.SimpleDateFormat" %>

<jsp:useBean id='objDBconfig' scope='request' class='hitstd.group.tool.database.DBconfig' />
<!DOCTYPE html>
<html>
<head>
<meta charset="BIG5">
<title>teake appointment</title>
</head>
<body>
<%
	// 檢查請求中是否包含字符編碼信息
	if (request.getCharacterEncoding() == null) {
	    request.setCharacterEncoding("BIG5");
	}

	// 獲取表單欄位的值
	
	
	
	
	String Fdiagnosis = request.getParameter("first-diagnosis");
	if (Fdiagnosis != null) {
		Fdiagnosis = new String(Fdiagnosis);
	}

    String NFdiagnosis = request.getParameter("Not-first-diagnosis");
    if (NFdiagnosis != null) {
    	NFdiagnosis = new String(NFdiagnosis);
	}

    
    
	String patientID = request.getParameter("patientID");
	if (patientID != null) {
		patientID = new String(patientID);
	}
	String role = request.getParameter("role");
	if (role != null) {
		role = new String(role);
	}

	String MN = request.getParameter("MN");
	if (MN!= null) {
		MN = new String(MN);
	}

	// 連接到數據庫並插入數據
	
	    Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
	    Connection con=DriverManager.getConnection("jdbc:ucanaccess://"+objDBconfig.FilePath()+";");
	    Statement smt= con.createStatement();
	    //smt.execute("INSERT INTO appoint (patient_ID, doctor, estimate, frequency) VALUES('"+patientID+"','"+role+"','"+MN+"','"+Fdiagnosis+"')");
	    //smt.execute("INSERT INTO appoint (patient_ID, birth, doctor, appointdate, estimate, frequency) VALUES('"+textboxValue+"','"+pointValue+"','"+chooseValue+"')");
	    //response.sendRedirect("correctA.jsp");
	    
	    out.println("patientID: " + patientID + "<br>");
		out.println("role: " + role + "<br>");
		out.println("MN: " + MN + "<br>");
		out.println("Fdiagnosis: " + Fdiagnosis + "<br>");

		if (patientID != null && role != null && MN != null && Fdiagnosis != null) {
	        
	    	smt.execute("INSERT INTO appoint (patient_ID, doctor, estimate, frequency) VALUES('"+patientID+"','"+role+"','"+MN+"','"+Fdiagnosis+"')");
	        response.sendRedirect("correctA.jsp");
	    } else {
	     
	        response.sendRedirect("test.jsp");
	    }

	    con.close();
	    
	   
	

	
	%>




</body>
</html>
