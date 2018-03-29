<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.sql.*"%>
    <%@ page import="java.io.*,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="./js/jquery-3.2.1.js"></script>
<link href="./css/main.app.40e8a6bbb95c9451d33f.css" rel="stylesheet">
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<%
	String userIDKey = new String("userID");
	String userID = new String("15528036619");
	if (session.isNew()){
    	session.setAttribute(userIDKey, userID);
 	} else {
	   userID = (String)session.getAttribute(userIDKey);
 	}
	String topic[]=new String[10];
	String Username="";
	String Title="";
	String Content="";
	String id="";
	ResultSet rs=null;
	ResultSet rs2=null;
	ResultSet rs3=null;
	int l=0;
	
	String sql="select topicname from guanzhu,topic where userID = "+userID+" and beigzID like 'T%' and beigzID=topicID;";

	rs=connDbBean.executeQuery(sql);
	while(rs.next()){
		topic[l]=rs.getString("topicname");
		l++;
	}
	for( int i=0;i<l;i++){
		String sql2="select title,q_pID from q_p natural join topic natural join user where topicname='"+topic[i]+"' limit 1";
		rs2=connDbBean.executeQuery(sql2);
		
		while(rs2.next()){
			Title=rs2.getString("title");
			id=rs2.getString("q_pID");		
		}		
		System.out.println(id);
		String sql3="select username,answer from a_c natural join user,q_p where questionID='"+id+"' and questionID=q_pID limit 1";
		rs3=connDbBean.executeQuery(sql3);
		
		if(rs3.next()){
			do{
			Username=rs3.getString("username");
			Content=rs3.getString("answer");
			}while(rs3.next());
		}else
			continue;
		System.out.println(Content);
%>
<script>
$(function(){
	$("#mainframe").append("<div class=\"Card TopstoryItem\" width=1000px id=content<%=i%>></div><p>");
	$("#content<%=i%>").append("<div class=\"Feed-title\" width=500><div class=\"Feed-meta\">"+
		"<span class=\"Feed-meta-item\">来自话题:<span><a class=\"TopicLink\" href=\"test.html\"><%=topic[i]%></a>"+
		"</span></span></div></div>");
	$("#content<%=i%>").append("<div class=AuthorInfo Feed-meta-author AuthorInfo--plain id=nameframe<%=i%>><span class=\"UserLink AuthorInfo-avatarWrapper\"><div class=\"Popover\">"+
			"<div aria-haspopup=true aria-expanded=false aria-owns=Popover-43344-36794-content>"+
				"<a class=\"UserLink-link\" href=\"test.html\">"+
				"	<img class=\"Avatar AuthorInfo-avatar\" width=24 height=24 src=\"./img/touxiang1.jpg\">"+
				"	</a></div></div></span>");
	
	$("#nameframe<%=i%>").append("<div class=\"AuthorInfo-content\">"+
		"<div class=\"AuthorInfo-head\">"+
		"<span class=\"UserLink AuthorInfo-name\"><div class=\"Popover\">"+
			"<div aria-haspopup=\"true\" aria-expanded=\"false\" aria-owns=\"Popover-43356-88207-content\">"+
				" <a class=\"UserLink-link\" href=\"test.html\"><%=Username%></a>"+
		"</div></div></span></div>");
	$("#content<%=i%>").append("<div class=\"ContentItem AnswerItem\" margin-top=14px><h2 class=\"ContentItem-title\">"+
			"<div><a target=\"_blank\" href=\"test.html\"><%=Title%></a>"+
			"</div></h2>");
	$("#content<%=i%>").append("<div class=\"RichContent-inner\" style=\"max-height: 400px;\">"+
		"<span class=\"RichText CopyrightRichText-richText\" itemprop=\"text\"><%=Content%></span></div></div>");
});
</script>
<%}%>
</head>
<body>
<div class="Topstory-container">
<div class="Topstory-mainColumn">
<div id="mainframe" class="Topstory-Main"></div></div></div>
</body>
</html>