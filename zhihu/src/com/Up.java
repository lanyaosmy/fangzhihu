package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.UnavailableException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Up
 */
public class Up extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private String url;
    private String user;
    private String password; 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Up() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
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
		String aid=request.getParameter("aid");
		PrintWriter out=response.getWriter();
		ResultSet rs=null;
		int row;
		try {
			Connection conn = DriverManager.getConnection(url, user, password);
			Statement stmt=conn.createStatement();
			String sql="update visit set zanNum=zanNum+1 where visitID='"+aid+"'";
			row=stmt.executeUpdate(sql);
			if(row>0){
				String sql2="select zanNum from visit where visitID='"+aid+"'";
				rs=stmt.executeQuery(sql2);
				while(rs.next()){
					out.print(rs.getString("zanNum"));
				}
			}else{
				out.print("error");
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
