<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*,java.net.URLDecoder,java.util.Date,java.text.SimpleDateFormat" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'topicChoose.jsp' starting page</title>
    
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
	 String value=request.getParameter("value");
	 String userID=request.getParameter("userID");
 	 Date currentTime = new Date();
     SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
     String date = formatter.format(currentTime);
	 String[] sp = value.split(";");
	 String sql="";
	 for(int i=0;i<sp.length;i++){
	 	sql = "insert into guanzhu values('"+date+"','"+userID+"','"+sp[i]+"')";
	 	out.println(sql);
	 	connDbBean.executeUpdate(sql);
	 } 
    %>
  </body>
</html>
