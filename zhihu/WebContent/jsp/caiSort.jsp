<%@ page import="java.io.*,java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*,java.net.URLEncoder,java.util.regex.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<% 
response.setContentType("text/html;charset=UTF-8");
String value = request.getParameter("value");
String sql="";
 sql="select q_p.title,a_c.answer,visit.caiNum from q_p,a_c,visit where q_p.q_pID=a_c.questionID and a_c.AnswerID=visit.visitID order by caiNum desc";
 ResultSet RS_result=connDbBean.executeQuery(sql);
 String result = "";
 int count = 0;
while(RS_result.next())
{
	count++;
	String title = RS_result.getString(1);
	String answer = RS_result.getString(2);
	int zannum = RS_result.getInt(3);
	out.print("<li class='clearfix'><div class='content'><a href='#' target='_blank'>"+title+"</a><div class='meta'><span class='sortspan' title='"+zannum+"人踩"+answer+"'>"+zannum+"人踩<span class='zg-bull'>•</span>"+answer+"</span></div></div></li>");
	if(count==3) break;
}
RS_result.close();
%>