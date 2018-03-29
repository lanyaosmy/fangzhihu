<%@ page import="java.io.*,java.util.*,java.sql.*" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*,java.net.URLEncoder,java.util.regex.*" %>
<jsp:useBean id="connDbBean" scope="page" class="db.db"/>
<% 
response.setContentType("text/html;charset=UTF-8");
String sql="";
 sql="select a_c.questionID,q_p.userID,`user`.username,q_p.title,q_p.content,count(AnswerID) as aswcnt,sum(visit.zanNum) as zansum from visit,a_c,q_p,`user` where visit.visitID=a_c.AnswerID and a_c.questionID=q_p.q_pID and `user`.userID=q_p.userID group by a_c.questionID order by sum(visit.zanNum) desc";
 ResultSet RS_result=connDbBean.executeQuery(sql);
 while(RS_result.next())
{
	out.print("<div id='anode_'"+RS_result.getString(4)+" class='explore-feed feed-item'><h2><a class='ContentItem-title titleleft' href='wenti.html?questionID="+RS_result.getString(1)+"' target='_blank'>"+RS_result.getString(4)+"</a></h2><div class='zm-item-answer'><div class='zm-item-vote'><a class='zm-item-vote-count js-expand js-vote-count'>"+RS_result.getInt(7)+"</a></div><div class='answer-head'><div class='zm-item-answer-author-info'><span class='summary-wrapper'> <span class='author-link-line'> <a class='author-link' href='#' target='_blank'>"+RS_result.getString(3)+"</a></span></span></div></div><div class='zm-item-rich-text expandable js-collapse-body'><div class='zh-summary summary clearfix'>"+RS_result.getString(5)+"<a class='toggle-expand' href='wenti.html?questionID="+RS_result.getString(1)+"'>显示全部</a></div></div><div class='zm-item-meta answer-actions clearfix js-contentActions'><div class='zm-meta-panel'><a class='follow-link zg-follow meta-item' href='#' id='"+"+RS_result.getString(1)+"+"' onclick='guanzhu(this.id)'>关注问题</a> <span class='zg-bull'>•</span><a name='addcomment' class='meta-item toggle-comment js-toggleCommentBox' href='#'> "+RS_result.getString(6)+" 条评论</a><span class='zg-bull'>•</span><a class='meta-item copyright'> 作者保留权利 </a></div></div></div></div>");
}
RS_result.close();
%>