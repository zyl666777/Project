<%@page contentType="text/html"%>
<%@page pageEncoding="BIG5"%>
<%@page import="java.sql.*, java.util.Date, java.text.SimpleDateFormat"%>

<jsp:useBean id='objDBConfig' scope='session' class='hitstd.group.tool.database.DBConfig' />
 <%
	if(request.getParameter("account") !=null &&
	request.getParameter("password") !=null &&
	request.getParameter("role") !=null){
    Class.forName("net.ucanaccess.jdbc.UcanaccessDriver");
		Connection con=DriverManager.getConnection("jdbc:ucanaccess://"+objDBConfig.FilePath()+";");
		Statement smt= con.createStatement();
		String getpaperdata = "SELECT * FROM Login WHERE account='"+
				request.getParameter("account")+"' AND password='" +
				request.getParameter("password")+"' AND role='" +
				request.getParameter("role")+"'";
		ResultSet paperrs = smt.executeQuery(getpaperdata);
		if(paperrs.next()){
			session.setAttribute("accessId",request.getParameter("account"));
			//session.setMaxInactiveInterval(20); 自動登出
			response.sendRedirect("index.jsp");
			
			response.setHeader("Refresh","5;url=doctor.jsp");
			
		
		}else
			out.println("帳號密碼不符！請重新登入");
	}%>
	
	
