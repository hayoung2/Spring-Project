<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="java.sql.*" %>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>TOURMATE</title>
   
</head>
<style>
.profile-page-container {
    display: grid;
    grid-template-columns: repeat(4, 1fr); /* 4개의 동일한 너비의 칼럼 생성 */
    gap: 20px; /* 각 카드 사이의 간격 */
    width: 80%;
    margin: 0 auto;
    margin-top:2vw;
}

.profile-card {
    background-color: white;
    border-radius: 10px; /* 둥근 모서리 */
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); /* 그림자 */
    display: grid; 
    grid-template-columns: auto 1fr;

}

.profile-card img {
    max-width: 100%; 
    border-top-left-radius: 10px; 
    border-bottom-left-radius: 10px; 
}

.profile-info {
    padding: 10px;
}
.pagination{
	margin-bottom:20vw;
}
</style>
<body>
    <jsp:include page="../common/header.jsp" />

    <jsp:include page="../common/container.jsp">
        <jsp:param name="headerText" value="여행 동행을 구하는 가장 쉬운 방법" />
        <jsp:param name="subHeaderText1" value="투어메이트에서 프로필✨을 보고 딱 맞는 동행을 찾아보세요!" />
        <jsp:param name="subHeaderText2" value="서로에 대해 더 알아보고 가면 더 즐거운 여행이 될거에요🥰 " />
        <jsp:param name="imgSrc" value="../img/carrier.svg" />
        <jsp:param name="bgColor" value="#EBFBFF" />
    </jsp:include>


    <%
    int limit = 6;
    int offset = 0;
    int currentPage = 1;

    if(request.getParameter("page") != null) {
        currentPage = Integer.parseInt(request.getParameter("page"));
        offset = (currentPage - 1) * limit;
    }

    Class.forName("com.mysql.cj.jdbc.Driver"); 
    String dbURL =  "jdbc:mysql://localhost:3306/tourmate?useUnicode=true&characterEncoding=UTF-8";
    String dbUser = "root"; 
    String dbPass = "0000"; 
    Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
    String query = "SELECT nickname, gender, age, mbti, introduction FROM users LIMIT ? OFFSET ?"; 
    PreparedStatement pstmt = conn.prepareStatement(query);
    pstmt.setInt(1, limit);
    pstmt.setInt(2, offset);
    ResultSet rs = pstmt.executeQuery();
    %>

    <div class="profile-page-container">
    <% 
    while(rs.next()) { 
    %>
    <div class="profile-card">
        <img src="<%= rs.getString("gender").contains("여성") ? "../img/female.png" : "../img/male.png" %>" alt="Profile Image">
        <div class="profile-info">
            <h4><%= rs.getString("nickname") %></h4>
            <p><%= rs.getString("gender") %> - <%= rs.getString("mbti") %></p>
            <p><%= rs.getString("introduction") %></p>
        </div>
    </div>
    <% 
    } 
    %>
</div>
    <%
    rs.close();
    pstmt.close();

    String countQuery = "SELECT COUNT(*) FROM users";
    Statement stmt = conn.createStatement();
    ResultSet countRS = stmt.executeQuery(countQuery);
    int totalRecords = 0;

    if(countRS.next()) {
        totalRecords = countRS.getInt(1);
    }

    int totalPages = (int) Math.ceil(totalRecords / (double)limit);

    stmt.close();
    conn.close();
    %>

    <div class="pagination" >
        <% if(currentPage > 1) { %>
            <a href="?page=<%= currentPage - 1 %>">이전 페이지</a>
        <% } %>

        <% if(currentPage < totalPages) { %>
            <a href="?page=<%= currentPage + 1 %>">다음 페이지</a>
        <% } %>
    </div>

    <jsp:include page="../common/footer.jsp" />

</body>
</html>
