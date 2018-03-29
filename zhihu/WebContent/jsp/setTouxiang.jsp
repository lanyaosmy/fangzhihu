<%@ page import="java.io.*,java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*,java.net.URLEncoder,java.util.regex.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<% 
response.setContentType("text/html;charset=UTF-8");
if(session.isNew())
{
	session.setAttribute("userID","13713628064");
}
String addr = request.getParameter("addr");
String userID = (String)session.getAttribute("userID");
String sql="";
 sql="update `user` set touxiang='pic/"+addr+"' where userID='"+userID+"'";
 connDbBean.executeUpdate(sql);
 out.println("更新成功!");
%>