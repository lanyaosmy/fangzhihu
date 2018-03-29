<%@ page import="java.io.*,java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*,java.net.URLEncoder,java.util.regex.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<% 
response.setContentType("text/html;charset=UTF-8");
String value = request.getParameter("value");
String sql="";
 sql="select * from user where userID='"+value+"'";
 ResultSet RS_result=connDbBean.executeQuery(sql);
 if(!RS_result.next() && value!=null)
{
	if(value.length() == 11)
	{
	    String regEx = "^13[0-9]{1}[0-9]{8}$|15[0189]{1}[0-9]{8}$|189[0-9]{8}$";
	    Pattern pattern = Pattern.compile(regEx);
	    Matcher matcher = pattern.matcher(value);
	    boolean rs = matcher.matches();
	    if(!rs)
			out.print(URLEncoder.encode("格式不正确","utf-8"));
		else
			out.print(URLEncoder.encode("1","utf-8"));
	}
	else
		out.print(URLEncoder.encode("位数不正确","utf-8"));
}
else{
	 //response.sendRedirect("main.jsp");
	 out.print(URLEncoder.encode("已注册","utf-8")); 
	} 
RS_result.close();
%>