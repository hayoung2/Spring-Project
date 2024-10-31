 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <% request.setCharacterEncoding("UTF-8"); %>
  <%@ page import="java.sql.*" %>
  <%@ page import="java.net.URLEncoder" %>
  
  <link rel="stylesheet" type="text/css" href="../css/trip.css">
  
 <jsp:include page="../common/font.jsp">
    <jsp:param name="title" value="동행을 모집하고 있어요!" />
    <jsp:param name="page" value="tripmatePage.jsp" />
</jsp:include>

<div class="trip-container">
<%
    String dbURL =  "jdbc:mysql://localhost:3306/tourmate?useUnicode=true&characterEncoding=UTF-8";
    String dbUser = "root";
    String dbPass = "0000";
    
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
    
    String query = "select t.post_id, t.count, t.title, t.content, t.travel_schedule,u.introduction, u.nickname, u.gender, u.mbti FROM tripposts t INNER JOIN users u ON t.username COLLATE utf8mb4_unicode_ci = u.username COLLATE utf8mb4_unicode_ci";


    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(query);
    int count=0;
	while(rs.next()) {
		count++;
		if(count<3){
		%>
<div class="trip-card">
		<a href="tripPageDetails.jsp?introduction=<%=rs.getString("introduction")%>&post_id=<%= rs.getInt("post_id") %>&count=<%= rs.getString("count") %>&title=<%= URLEncoder.encode(rs.getString("title"), "UTF-8") %>&content=<%= URLEncoder.encode(rs.getString("content"), "UTF-8") %>&travel_schedule=<%= URLEncoder.encode(rs.getString("travel_schedule"), "UTF-8") %>&nickname=<%= URLEncoder.encode(rs.getString("nickname"), "UTF-8") %>&gender=<%= rs.getString("gender") %>&age=<%= rs.getString("age") %>&mbti=<%= rs.getString("mbti") %>">

        <div class="trip-header">
        <div>
        <img src="../img/2user.svg" width="18vw"  />
            <h5><%= rs.getString("count")+" "%> </h5>
            <p style="font-size:10px;"> 모집중</p>
            </div>
            <div >
            <img src="../img/message.png" />
            </div>
        </div>
          <h4><%= rs.getString("title") %></h4>
            <p id="content"><%= rs.getString("content") %></p>
            <div class="tags-container">
             <div class="trip-tags">
            <span>#<%= rs.getString("travel_schedule") %></span>
        </div>
             <div class="trip-tags">
            <span>#여행친구</span>
        </div>
            </div>
        <div class="trip-user">
            <h4><%= rs.getString("nickname") %></h4>
            <p><%= rs.getString("gender") %>· <%= rs.getString("mbti") %></p>
        </div>
        </a>
    </div>

<% }
		} 
    rs.close();
    stmt.close();
    conn.close();
%>
</div>