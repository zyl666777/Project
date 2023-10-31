<!DOCTYPE html>
<html lang="en">
 <%@ page import="java.sql.*"%>
 <%@ page language="java" import="java.util.*" contentType="text/html;charset=UTF-8"%>
 <%@ page import="java.io.*,java.util.*" %>
 <%@ page import="javax.servlet.*,java.text.*" %>
 <%@ page import="tool.mail.Javamail" %>
    <head>
    <meta name="viewport" content="width=device-width,initial-scale=1,user-scalable=no">
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
	<meta http-equiv="Pragma" content="no-cache" />
	<meta http-equiv="Expires" content="0" />      
  </head>
 
  <%
  	try{
	  String customer = request.getParameter("email");
	  
	  Javamail mail = new Javamail();
	  
	  Object storedCode = session.getAttribute("code1");
	  
	     if(request.getMethod().equalsIgnoreCase("post")) {

	       String code1 = String.format("%06d", new Random().nextInt(1000000));// 驗證碼6碼生成的程式碼
	       
	       mail.setCustomer(customer);
           //信件標題
	       mail.setSubject("註冊帳號驗證");
           //信件內文樣式
	       mail.setTxt( "<table style=\"margin: 0 auto;\">"+
	    		        "<tr><td><p><img src=\"cid:image\"></p><hr></td></tr>"+
	    		        "<tr><td height=\"200px\" align='center' valign='middle'><H1>驗證碼："+code1+"</H1><br></td></tr>"+
	    		    	"</table>");
           /*code2fsh的樣式
           mail.setTxt( "<table style=\"margin: 0 auto;\">"+
   		        "<tr><td align='center'><p><img src=\"cid:image\"></p><hr></td></tr>"+
   		        "<tr><td height=\"200px\" align='center' valign='middle'><H1>"+messages.getString("mbemailText6")+code1+"，"+messages.getString("mbemailText7")+"</H1><br></td></tr>"+
                   "<tr style=\"background-color:#6c6e6e;\"><td height=\"100px\" align='center' valign='middle'><a style=\"color:white\">©2023Code2FSH"+
                   "</a></td></tr>"+
   		    	"</table>");
                */
	       session.removeAttribute("code1");
	       session.setAttribute("email", customer);
	       session.setAttribute("code1", code1);
	       session.setMaxInactiveInterval(60); // 設置Session過期時間為60秒
	       
	       mail.SendMail();
	       
	     }
	     
	     	out.println("<script>");
			out.println("location='memberAdd.jsp'");
			out.println("</script>");
	  
	  
	  

  %>
  <body>
  
 <%
	   }catch(Exception e){
	      e.printStackTrace(new PrintWriter(out));
	   }
  %>
</body>

</html>