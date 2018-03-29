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
 * Servlet implementation class GetSelfQServlet
 */
public class GetSelfQServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String url;
    private String user;
    private String password;  
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetSelfQServlet() {
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
		String userID = new String("");
		HttpSession session = request.getSession();
		if (session.isNew()) {
			session.setAttribute(userIDKey, userID);
		} else {
			userID = (String) session.getAttribute(userIDKey);
		}

		Map<String, String> map = new HashMap<String, String>();
		JSONArray jsonarr = new JSONArray();
		try {
			Connection conn = DriverManager.getConnection(url, user, password);
			Statement stmt = conn.createStatement();
			ResultSet rs = null;
			
			int i = 0;
                                                                                                                                                        
//			String sql = "select q_p.q_pID, q_p.title, q_p.content, q_p.topicID, q_p.date from a_c,q_p where a_c.userID='"+userID+ "' and a_c.questionID=q_p.q_pID;";
			//String sql = "select q_p.q_pID, q_p.userID, q_p.title, q_p.content, q_p.topicID, q_p.date from q_p,a_c where a_c.userID="+userID+" and a_c.questionID=q_p.q_pID";
			//String sql = "select q_p.q_pID, q_p.userID, q_p.title, q_p.content, q_p.topicID, q_p.date from q_p,a_c where a_c.userID="+userID+ " and a_c.questionID=q_p.q_pID";
			String sql = "select q_p.q_pID, q_p.userID, q_p.title, q_p.content, q_p.topicID, q_p.date from q_p where q_p.userID='"+userID+ "' and q_p.q_pID like 'Q%'";
			rs = stmt.executeQuery(sql);
			while(rs.next()){
				map.clear();
				map.put("q_pID", rs.getString("q_pID"));
				map.put("userID", rs.getString("userID"));
				map.put("title", rs.getString("title"));
				map.put("content", rs.getString("content"));
				map.put("topicID", rs.getString("topicID"));
				map.put("date", rs.getString("date"));
				
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
