<%@ page import="java.io.*,java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*,java.net.URLEncoder,java.net.URLDecoder,java.util.regex.*" %>
<% 
	response.setContentType("text/html;charset=UTF-8");
	String userName = (String)session.getAttribute("userID");
	out.print(userName);
%>