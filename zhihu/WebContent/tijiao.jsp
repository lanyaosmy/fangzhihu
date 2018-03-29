
<%@ page language="java" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	request.setCharacterEncoding("gb2312");
	response.setCharacterEncoding("gb2312");
%>
<%@ page language="java"
	import="java.sql.*,java.util.Date,java.text.SimpleDateFormat,java.util.Calendar"%>
<jsp:useBean id="connDbBean" scope="page" class="db.db" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>问题标题</title>
</head>
<body>
	<%
		String sql = "";
		ResultSet RS_result = null;
		String qid = "";
		
		String title ="";
		String content = "";
		String topicname="";
		String topicID = "";
		String date = "";
		
		////////q_pID
		sql="select q_pID from q_p where q_pID like'Q%'";
		RS_result=connDbBean.executeQuery(sql);
		
		if (!RS_result.next()) {
			qid = "Q1";
		} else {
			while (RS_result.next()) {
				qid = RS_result.getString("q_pID");
			}
			String s = qid.replaceAll("\\D+", "");
			int a = Integer.parseInt(s);
			int num = a + 1;
			qid = "" + 'Q' + num;
		}
		//////title
		title=request.getParameter("biaoti");
		
		//////topicID
		topicname=request.getParameter("huati");
		sql="select topicID from topic where topicname='" + topicname + "'";
		RS_result=connDbBean.executeQuery(sql);
		while(RS_result.next())
		{
			topicID=RS_result.getString("topicID");
		}
		
		/////content
		content=request.getParameter("xiangxi");
		/////date
		Date d = new Date();  
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");  
        date= sdf.format(d);  
       /////用cookie获取userID
       //获取客户端Cookie数组
		/*Cookie[] cookies = request.getCookies();

		//判断客户端是否存在Cookie对象
		if (cookies != null) {
		//预定义保存用户ID的变量

		String userID = "";
		//遍历Cookie数组

		for (int i = 0; i < cookies.length; i++) {
		//取得每一个Cookie对象
		Cookie cookie = cookies[i];
		//判断Cookie的名称是否等于"accpLoginName"
		if ("userID".equals(cookie.getName())) {
		userID = cookie.getValue();
		}
        */
		String userID = (session.getAttribute("userID")).toString();
		sql = "insert into q_p (q_pID,userID,title,content,topicID,date)values('" + qid + "','"+userID+"','" + title + "','" + content + "','" + topicID + "','" + date + "')";
		connDbBean.executeUpdate(sql);
	%>
	<script>
	window.location.href="./index.html";
	</script>
</body>
</html>