<%@ page import="java.io.*,java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*,java.net.URLEncoder,java.util.regex.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<% 
response.setContentType("text/html;charset=UTF-8");
String sql="";
 sql="select * from topic";
 ResultSet RS_result=connDbBean.executeQuery(sql);
 while(RS_result.next())
{
	out.print("<li class='listyle'><div id='"+RS_result.getString(1)+"' class='topicli' onmousedown='choose(this.id)'>"+RS_result.getString(2)+"</div></li>");
}
RS_result.close();
%>