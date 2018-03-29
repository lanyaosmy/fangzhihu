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
 * Servlet implementation class AnswerSubmit
 */
public class AnswerSubmit extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private String url;
    private String user;
    private String password;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnswerSubmit() {
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
			throw new UnavailableException("�������ݿ�����ʧ�ܣ�");
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
		String qid=request.getParameter("qid");
		String answer=request.getParameter("answer");
		//System.out.println(answer);
		PrintWriter out=response.getWriter();
		ResultSet rs=null;
	    Date currentTime = new Date();
	    SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	    String date = formatter.format(currentTime);
		int row=0;
		try {
			Connection conn = DriverManager.getConnection(url, user, password);
			Statement stmt=conn.createStatement();
			String sql1="select * from a_c where userID='"+userID+"' and questionID='"+qid+"'";
			rs=stmt.executeQuery(sql1);
			if(rs.next()){
				out.print("");
			}else{
				String sql2="select count(*) as total from a_c";
				rs=stmt.executeQuery(sql2);
				int temp=0;
				while(rs.next()){
					temp=rs.getInt("total");
				}
				temp++;
				String aid="A"+String.valueOf(temp);
				String sql3="insert into visit values('"+aid+"',0,0,0)";
				row=stmt.executeUpdate(sql3);
				String sql="insert into a_c values('"+aid+"','"+qid+"','"+userID+"','"+answer+"','"+date+"')";
				row=stmt.executeUpdate(sql);
				
				if(row==1)out.println("回答成功");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
