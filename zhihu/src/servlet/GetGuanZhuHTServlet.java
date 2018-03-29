package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class GetGuanZhuHTServlet
 */
public class GetGuanZhuHTServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String url;
	private String user;
	private String password;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetGuanZhuHTServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    public void init() throws ServletException {
		// TODO Auto-generated method stub
		String driverClass = getServletContext().getInitParameter("driverClass");
		url = getServletContext().getInitParameter("url");
		user = getServletContext().getInitParameter("user");
		password = getServletContext().getInitParameter("password");
		try {
			Class.forName(driverClass);
		} catch (ClassNotFoundException ce) {
			System.out.println("������ݿ���ʧ�ܣ�");
			ce.printStackTrace();
		}
	}
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		//���ô�����ݱ��뷽ʽ
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		String userIDKey = new String("userID");
		String userID = new String("13713628064");
		HttpSession session = request.getSession();
		if (session.isNew()) {
			session.setAttribute(userIDKey, userID);
		} else {
			userID = (String) session.getAttribute(userIDKey);
		}

		Map<String, Object> map = new HashMap<String, Object>();
		JSONArray jsonarr = new JSONArray();
		try {
			Connection conn = DriverManager.getConnection(url, user, password);
			Statement stmt = conn.createStatement();
			ResultSet rs = null;

			int i = 0;

			String sql = "select topic.topicID, topic.topicname from topic, guanzhu where guanzhu.userID="
					+ userID + " and topic.topicID=guanzhu.beigzID";
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				map.clear();
				String topicID1 =  rs.getString("topicID");
				map.put("topicID", rs.getString("topicID"));
				map.put("topicname", rs.getString("topicname"));
				String sql1 = "select count(*) as count from guanzhu where beigzID='"+topicID1+"' ";
				Statement stmt1 = conn.createStatement();
				ResultSet rs1 = stmt1.executeQuery(sql1);
				if(rs1.next())
				{
					map.put("count",rs1.getInt(1));
				}
				JSONObject json = JSONObject.fromObject(map);
				jsonarr.add(json);				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(jsonarr.toString());
		out.flush();
		out.close();
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
