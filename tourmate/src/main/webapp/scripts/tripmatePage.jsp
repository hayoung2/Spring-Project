<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.sql.*"%>
<%@ page import="java.net.URLEncoder"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="../css/tripmateList.css">
<meta charset="UTF-8">
<title>TOURMATE</title>
</head>
<%
String message = (String) session.getAttribute("message");
if (message != null) {
%>
<script>
        alert('<%=message%>
	');
</script>
<%
session.removeAttribute("message");
}
%>
<body>
	<jsp:include page="../common/header.jsp" />


	<jsp:include page="../common/container.jsp">
		<jsp:param name="headerText" value="어딘가 떠나고 싶은데 혼자 가긴 망설여 진다구요?" />
		<jsp:param name="subHeaderText1" value="동행을 구하는 다양한 모집글✨이 올라와 있어요! " />
		<jsp:param name="subHeaderText2"
			value="원하는 조건이 없다면 직접 글을 작성해 동행을 모집해보세요 🛫" />
		<jsp:param name="imgSrc" value="../img/map.svg" />
		<jsp:param name="bgColor" value="#F2F3FF" />
	</jsp:include>

	<%
	String dbURL = "jdbc:mysql://localhost:3306/tourmate?useUnicode=true&characterEncoding=UTF-8";
	String dbUser = "root";
	String dbPass = "0000";

	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

	// 현재 페이지 번호를 얻습니다.
	int currentPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

	// 전체 데이터 개수를 가져옵니다.
	String countQuery = "SELECT COUNT(*) FROM tripposts";
	Statement countStmt = conn.createStatement();
	ResultSet countRs = countStmt.executeQuery(countQuery);
	countRs.next();
	int totalItems = countRs.getInt(1);
	countRs.close();
	countStmt.close();

	// 한 페이지에 보여줄 아이템의 개수
	int itemsPerPage = 8;
	// 전체 페이지 수를 계산합니다.
	int totalPages = (int) Math.ceil((double) totalItems / itemsPerPage);

	int offset = (currentPage - 1) * itemsPerPage;

	String query = "select t.post_id, t.count, t.title, t.content, t.travel_schedule,u.introduction, u.nickname, u.gender, u.age, u.mbti FROM tripposts t INNER JOIN users u ON t.username COLLATE utf8mb4_unicode_ci = u.username COLLATE utf8mb4_unicode_ci";

	Statement stmt = conn.createStatement();
	ResultSet rs = stmt.executeQuery(query);
	%>

	<div class="container" style="margin-top:3vw;">
		<%
		while (rs.next()) {
		%>
		<div class="trip-card" style="background-color: white;">
			<a
				href="tripPageDetails.jsp?introduction=<%=rs.getString("introduction")%>&post_id=<%=rs.getInt("post_id")%>&count=<%=rs.getString("count")%>&title=<%=URLEncoder.encode(rs.getString("title"), "UTF-8")%>&content=<%=URLEncoder.encode(rs.getString("content"), "UTF-8")%>&travel_schedule=<%=URLEncoder.encode(rs.getString("travel_schedule"), "UTF-8")%>&nickname=<%=URLEncoder.encode(rs.getString("nickname"), "UTF-8")%>&gender=<%=rs.getString("gender")%>&age=<%=rs.getString("age")%>&mbti=<%=rs.getString("mbti")%>">

				<div class="trip-header" style="background-color: white;">
					<h4><%=rs.getString("title")%></h4>
					<p style="overflow: hidden; text-overflow: ellipsis;"><%=rs.getString("content")%></p>
				</div>
				<div class="trip-tags" style="background-color: white;">
					<span>#<%=rs.getString("travel_schedule")%></span> <span>#<%=rs.getString("count") + " 모집중"%></span>
				</div>
				<div class="trip-user"
					style="float: right; display: display:inline-block;">
					<h5><%=rs.getString("nickname")%></h5>
					<p><%=rs.getString("gender")%>
						-
						<%=rs.getString("age")%>대 -
						<%=rs.getString("mbti")%></p>
				</div>
			</a>
		</div>
		<%
		}
		rs.close();
		stmt.close();
		conn.close();
		%>
	</div>
	<div class="pagination">
		<%
		for (int i = 1; i <= totalPages; i++) {
		%>
		<a href="?page=<%=i%>"><%=i%></a>
		<%
		}
		%>
	</div>


	<jsp:include page="../common/footer.jsp" />

</body>
</html>