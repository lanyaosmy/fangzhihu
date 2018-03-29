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
 * Servlet implementation class QuestionContent
 */
public class QuestionContent extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private String url;
    private String user;
    private String password; 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionContent() {
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

		JSONArray jsonarr=new JSONArray();
		try{
		Connection conn=DriverManager.getConnection(url, user, password);
		Statement stmt=conn.createStatement();
		Statement stmt2=conn.createStatement();
		ResultSet rs=null;
		ResultSet rs2=null;
		String aid="";
		
		String sql="select AnswerID,username,answer,answDate,touxiang from a_c natural join user where questionID='"+questionID+"' order by answDate desc";
		rs=stmt.executeQuery(sql);
		while(rs.next()){
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("username", rs.getString("username"));
			map.put("answer", rs.getString("answer"));
			map.put("answDate", rs.getString("answDate"));
			map.put("answerID",rs.getString("answerID"));	
			map.put("touxiang",rs.getString("touxiang"));
			aid=rs.getString("answerID");
			String sql4="select zanNum,caiNum from visit where visitID='"+aid+"'";
			rs2=stmt2.executeQuery(sql4);
			if(rs2.next()){
				do{
				map.put("up", rs2.getInt("zanNum"));
				map.put("down", rs2.getInt("caiNum"));
				}while(rs2.next());
			}
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
