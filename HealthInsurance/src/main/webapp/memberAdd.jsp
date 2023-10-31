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
	  
	  Object customer = session.getAttribute("email");  
	  Object storedCode = session.getAttribute("code1");
	  
	  Javamail mail = new Javamail();	 	   

  %>
  <body>
  <div class="wrapper">
   <br>
   <div class="containerLeft">
      	 <div class="container">
       <div class="container" >
              <br>
           <div class="container stephr">
             <h2 class="text-center"><b>註冊</b></h2>
	<form action="memberVC.jsp" method="post" id="myForm">
	  <div class="container" style="width:43%;line-height: 2.5rem;">
	    	<br>
	  		   <p><span class="zh">信箱</span></p>
                 <input class="form-control1" type="email" name="email"<%if (customer !=null) {out.println("value="+customer);}%> placeholder="請填寫您的信箱，即為您的帳號，如：xxxx＠gmail.com" required>
	             <button type="submit" id="allBtn"class="btn-theme2 btn mx-2"name="next">取得驗證碼</button>
	        </div>
	              </form>
          </div>
          </div>
          </div>
          </div>
          </div>

  <%
	   }catch(Exception e){
	      e.printStackTrace(new PrintWriter(out));
	   }
  %>
</body>

</html>