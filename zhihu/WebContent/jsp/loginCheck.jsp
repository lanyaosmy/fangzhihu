<%@ page language="java" pageEncoding="ISO-8859-1"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*,java.net.URLEncoder" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>Login Check Page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  	<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
  	 <%
	 String uid=request.getParameter("account");
	 String pwd=request.getParameter("password");
	 String sql="";
	 sql="select * from user where userID='"+uid+"'"+"and password='"+pwd+"'";
	 ResultSet RS_result=connDbBean.executeQuery(sql);
	 if(!RS_result.next())
	{
		out.print("<script>alert('false!');window.history.go(-1);</script>");
	}
	else{
		 //response.sendRedirect("main.jsp");
		 out.println("<script>alert('true!');</script>");	 
		 Cookie name_cookie = new Cookie("username",URLEncoder.encode(RS_result.getString(2),"utf-8"));
		 Cookie phone_cookie = new Cookie("userID",uid);
		 name_cookie.setMaxAge(60*60*24); 
		 phone_cookie.setMaxAge(60*60*24); 
		 response.addCookie(name_cookie);
		 response.addCookie(phone_cookie);
	     session.setAttribute("userID",uid);
	     session.setAttribute("username",URLEncoder.encode(RS_result.getString(2),"utf-8"));
		 
		 response.sendRedirect("../index.html");
		} 
	RS_result.close();
	%>
  </body>
</html>
