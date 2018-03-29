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
 * Servlet implementation class ArticleContent
 */
public class ArticleContent extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private String url;
    private String user;
    private String password;    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ArticleContent() {
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
		String pid=request.getParameter("pid");
		JSONArray jsonarr=new JSONArray();
		try{
		Connection conn=DriverManager.getConnection(url, user, password);
		Statement stmt=conn.createStatement();
		ResultSet rs=null;
		Map<String, Object> map=new HashMap<String, Object>();
		String sql="select username,title,content,date,touxiang from q_p natural join user where q_pID='"+pid+"'";
		rs=stmt.executeQuery(sql);
		while(rs.next()){
			map.put("author", rs.getString("username"));
			map.put("title", rs.getString("title"));
			map.put("content", rs.getString("content"));
			map.put("date", rs.getString("date"));
			map.put("touxiang", rs.getString("touxiang"));
		}
			JSONObject json =JSONObject.fromObject(map);
    		jsonarr.add(json);
    		map.clear();
		
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
