<%@ page language="java" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
%>
<%@ page language="java"
	import="java.sql.*,java.util.Date,java.text.SimpleDateFormat,java.util.Calendar"%>
<jsp:useBean id="connDbBean" scope="page" class="db.db" />
<!DOCTYPE HTML >
<html>
<head>

<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
<title>发布</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="themes/default/css/umeditor.css" type="text/css"
	rel="stylesheet">
<link href="wenzhang.css" type="text/css" rel="stylesheet">
<script type="text/javascript" src="third-party/jquery.min.js"></script>
<script type="text/javascript" src="third-party/template.min.js"></script>
<script type="text/javascript" charset="utf-8"
	src="./js/umeditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="./js/umeditor.min.js"></script>
<script type="text/javascript" src="lang/zh-cn/zh-cn.js"></script>
</head>
<body>
	
	<%
		

		String sql = "";
		ResultSet RS_result = null;
		String pid="";
		String title;
		String content;
		String date = "";
		////////q_pID
		sql="select count(*) as total from q_p where q_pID like'P%'";
		RS_result=connDbBean.executeQuery(sql);
		
		int temp=0;
		while(RS_result.next())
			
		{
			temp=RS_result.getInt("total");
		}
		temp++;
		pid="P"+String.valueOf(temp);
		//////title

		//title = new String(request.getParameter("biaoti").getBytes("iso-8859-1"), "utf-8");
		title=request.getParameter("biaoti");
		/////content
		//content=new String(request.getParameter("content").getBytes("iso-8859-1"), "utf-8");;
		content=request.getParameter("content");
		/////date
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		date = sdf.format(d);
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
		sql = "insert into q_p (q_pID,userID,title,content,date)values('" + pid + "','"+userID+"','" + title + "','" + content + "','" + date + "')";
		connDbBean.executeUpdate(sql);
	%>
</body>
</html>