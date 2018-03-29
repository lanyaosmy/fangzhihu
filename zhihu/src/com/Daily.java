package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
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
 * Servlet implementation class Daily
 */
public class Daily extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private String url;
    private String user;
    private String password;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Daily() {
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
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8"); 
		String userIDKey = new String("userID");
		String userID = new String("15528036619");
		HttpSession session=request.getSession();
		if (session.isNew()){
	    	session.setAttribute(userIDKey, userID);
	 	} else {
		   userID = (String)session.getAttribute(userIDKey);
	 	}
		PrintWriter out=response.getWriter();
		ResultSet rs=null;
		JSONArray jsonarr=new JSONArray();
		Map<String, Object> map=new HashMap<String, Object>();
		int row=0;
		try {
			Connection conn = DriverManager.getConnection(url, user, password);
			Statement stmt=conn.createStatement();
			String sql1="select questionID,title from a_c ,visit,q_p where AnswerID=visitID and q_pID=questionID order by zanNum desc limit 3";
			rs=stmt.executeQuery(sql1);
			while(rs.next()){
				map.put("dailyqid", rs.getString("questionID"));
				map.put("dailytitle", rs.getString("title"));
				JSONObject json =JSONObject.fromObject(map);
	    		jsonarr.add(json);
	    		map.clear();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
