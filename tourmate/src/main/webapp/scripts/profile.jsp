 <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
 <% request.setCharacterEncoding("UTF-8"); %>
 <%@ page import="java.sql.*" %>
 
 <link rel="stylesheet" type="text/css" href="../css/profile.css">
 
 <jsp:include page="../common/font.jsp">
    <jsp:param name="title" value="찰떡궁합 여행메이트를 찾아봐요!" />
    <jsp:param name="page" value="profilePage.jsp" />
</jsp:include>

<div class="profile-container">
<%
    Class.forName("com.mysql.cj.jdbc.Driver"); 
    String dbURL =  "jdbc:mysql://localhost:3306/tourmate?useUnicode=true&characterEncoding=UTF-8";
    String dbUser = "root"; 
    String dbPass = "0000"; 
    
    Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
    
   
    String query = "SELECT nickname, gender, mbti, introduction FROM users"; 
    Statement stmt = conn.createStatement();
    ResultSet rs = stmt.executeQuery(query);
    int count=0;
 
    
    while(rs.next()) {
    	count++;
    	if(count<5){
    		   String imgSrc="../img/male.png";
    		    
    		    if(rs.getString("gender").contains("여성")){
    		    	imgSrc="../img/female.png";
    		    }	
    	%>
    
    <div class="profile-card">
    <div style="float:left;">
    <img src=<%=imgSrc%> /> 
    </div>
        <div class="profile-info" style="float:right;">
            <h3><%= rs.getString("nickname") %></h3>
            <p> <%= rs.getString("gender") %>·<%= rs.getString("mbti") %></p>
            <span> <%= rs.getString("introduction") %></span>
        </div>
    </div>
    
<% } 
    	}
   
    rs.close();
    stmt.close();
    conn.close();
%>
</div>