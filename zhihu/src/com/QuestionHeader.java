package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.UnavailableException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class QuestionHeader
 */
public class QuestionHeader extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private String url;
    private String user;
    private String password;  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionHeader() {
        super();
        // TODO Auto-generated constructor stub
    }

	public void init() throws ServletException {
		// TODO Auto-generated method stub
		String driverClass = getServletContext().getInitParameter("driverClass");
		url=getServletContext().getInitParameter("url");
		user=getServletContext().getInitParameter("user");
		password=getServletContext().getInitParameter("password");
		try{
			Class.forName(driverClass);
		}catch(ClassNotFoundException ce){
			throw new UnavailableException("加载数据库驱动失败！");
		}
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	@SuppressWarnings("null")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String userIDKey = new String("userID");
		String userID = new String("15528036619");
		HttpSession session=request.getSession();
		if (session.isNew()){
	    	session.setAttribute(userIDKey, userID);
	 	} else {
		   userID = (String)session.getAttribute(userIDKey);
	 	}
		String questionID=request.getParameter("questionID");

		JSONObject json=null;
		try{
		Connection conn=DriverManager.getConnection(url, user, password);
		Statement stmt=conn.createStatement();
		ResultSet rs=null;
		ResultSet rs2=null;
		Map<String, Object> map=new HashMap<String, Object>();
		String sql="select title,topicname,content from q_p natural join topic where q_pID='"+questionID+"'";
		rs=stmt.executeQuery(sql);
		while(rs.next()){
			map.put("topic", rs.getString("topicname"));
			map.put("title", rs.getString("title"));
			map.put("content", rs.getString("content"));
		}	
		String sql2="select count(*) as countAnsw from a_c where questionID='"+questionID+"'";
		rs2=stmt.executeQuery(sql2);
		while(rs2.next()){
			map.put("countAnsw", rs2.getInt("countAnsw"));
		}
		String sql3="select count(*) as countfollow from guanzhu where beigzID='"+questionID+"'";
		rs2=stmt.executeQuery(sql3);
		while(rs2.next()){
			map.put("follow", rs2.getInt("countfollow"));
		}
		String sql4="select * from guanzhu where beigzID='"+questionID+"' and userID='"+userID+"'";
		rs2=stmt.executeQuery(sql4);
		if(rs2.next()){
			map.put("check", 0);
		}else{
			map.put("check", 1);
		}
		json =JSONObject.fromObject(map);
    		
    		map.clear();
    		
		}catch(SQLException e){
			e.printStackTrace();
		}
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		out.println(json.toString());  
        out.flush();  
        out.close(); 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
