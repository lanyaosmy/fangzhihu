<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
    
    <title>Register Process Page</title>
    
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
     request.setCharacterEncoding("utf8");
	 response.setCharacterEncoding("utf8");
	 String name=request.getParameter("fullname");
	 String phone = request.getParameter("phone_num");
	 String pass=request.getParameter("password_reg");
	 String sql="";
	 sql="insert into user values('"+phone+"','"+name+"','"+pass+"','pic/touxiang1.jpg')";
	 out.print(sql);
	 connDbBean.executeUpdate(sql);
	 Cookie name_cookie = new Cookie("username",URLEncoder.encode(name,"utf-8"));
	 Cookie phone_cookie = new Cookie("userID",phone);
	 name_cookie.setMaxAge(60*60*24); 
	 phone_cookie.setMaxAge(60*60*24); 
	 response.addCookie(name_cookie);
	 response.addCookie(phone_cookie);

     session.setAttribute("userID",phone);
     session.setAttribute("username",URLEncoder.encode(name,"utf-8"));
	 
	 response.sendRedirect("../topicChoose.html");
	%>
  </body>
</html>
