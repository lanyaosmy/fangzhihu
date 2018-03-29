<%@ page import="java.io.*,java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*,java.net.URLEncoder,java.util.regex.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<% 
response.setContentType("text/html;charset=UTF-8");
String value = request.getParameter("value");
String sql="";
 sql="select beigzID,count(userID) from guanzhu where beigzID like 'T%' group by beigzID order by count(userID) desc";
 ResultSet RS_result=connDbBean.executeQuery(sql);
 String result = "";
 int count = 0;
while(RS_result.next())
{
	count++;
	//out.print(RS_result.getString(1));
	//out.print(RS_result.getInt(2));
	String thisID = RS_result.getString(1);
	String thisName = "";
	int thisGuan = RS_result.getInt(2);
	int thisCan = 0;
	result += RS_result.getString(1)+","; //ID号
	String namesql = "select topicname from topic where topicID='"+RS_result.getString(1)+"'";
	ResultSet nameset = connDbBean.executeQuery(namesql);
	if(nameset.next()){
		result += nameset.getString(1)+","; //名字
		thisName = nameset.getString(1);
	}
	result += RS_result.getInt(2)+","; //关注人数
	String countsql = 
		"select count(a_c.AnswerID),q_p.topicID from a_c,q_p where a_c.questionID=q_p.q_pID and topicID='"+RS_result.getString(1)+"' group by q_p.topicID order by count(a_c.AnswerID) ";
	ResultSet countset = connDbBean.executeQuery(countsql);
	if(countset.next()){
		result += countset.getInt(1); //参与人数
		thisCan = countset.getInt(1);
	}
	else{
		result += "0";
	}
	result += ";";
	out.print("<li class='clearfix'><div class='content'><a href='#' target='_blank'>"+thisName+"</a><div class='meta'><span>"+thisGuan+"人关注</span> <span class='zg-bull'>•</span> <span>"+thisCan+"人参与</span></div></div></li>");
	if(count==3) break;
}
RS_result.close();
%>
