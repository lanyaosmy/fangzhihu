package com;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.*;
import javax.servlet.http.*;

import java.sql.*;

import net.sf.json.JSONArray;  
import net.sf.json.JSONObject; 

import java.util.HashMap;
import java.util.Map;
/**
 * Servlet implementation class Mainframe
 */
public class Mainframe extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private String url;
    private String user;
    private String password; 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Mainframe() {
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
		String userID = new String("");
		HttpSession session=request.getSession();
		if (session.isNew()){
	    	session.setAttribute(userIDKey, userID);
	 	} else {
		   userID = (String)session.getAttribute(userIDKey);
	 	}
		String topic[]=new String[10];
		String id="";
		String aid="";
		JSONArray jsonarr=new JSONArray();
		try{
		Connection conn=DriverManager.getConnection(url, user, password);
		Statement stmt=conn.createStatement();
		ResultSet rs=null;
		ResultSet rs2=null;
		ResultSet rs3=null;
		ResultSet rs4=null;
		ResultSet rs5=null;
		int l=0;
		
		String sql="select topicname from guanzhu,topic where userID = "+userID+" and beigzID like 'T%' and beigzID=topicID;";
		rs=stmt.executeQuery(sql);
		while(rs.next()){
			topic[l]=rs.getString("topicname");
			l++;
		}
			Map<String, Object> map=new HashMap<String, Object>();
			
			String sql2="select a_c.AnswerID,a_c.answer,a_c.userID,q_p.q_pID,topic.topicname,q_p.title,`user`.username,`user`.touxiang,visit.zanNum,visit.caiNum from a_c,q_p,topic,`user`,visit where visit.visitID=a_c.AnswerID and `user`.userID=a_c.userID and a_c.questionID=q_p.q_pID and topic.topicID=q_p.topicID";
			Statement stmt2=conn.createStatement();
			rs2=stmt2.executeQuery(sql2);
			while(rs2.next()){
				String sql3 = "select count(*) from a_c where questionID='"+rs2.getString("q_pID")+"' group by questionID";
				Statement stmt3=conn.createStatement();
				rs3=stmt3.executeQuery(sql3);
				int count = 0;
				if(rs3.next())
					count = rs3.getInt(1);
				map.put("topic", rs2.getString("topicname"));	
				map.put("title", rs2.getString("title"));	
				map.put("username",rs2.getString("username"));
				map.put("answer",rs2.getString("answer"));
				map.put("up",rs2.getString("zanNum"));
				map.put("comment", count);
				map.put("aid",rs2.getString("AnswerID"));
				map.put("up",rs2.getString("caiNum"));
				map.put("questionID",rs2.getString("q_pID"));
				map.put("touxiang",rs2.getString("touxiang"));
				JSONObject json =JSONObject.fromObject(map);
	    		jsonarr.add(json);
	    		map.clear();
			
			}		
		}catch(SQLException e){
			e.printStackTrace();
		}
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out=response.getWriter();
		out.println(jsonarr.toString());  
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
