<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<%@ page import="java.sql.*, java.util.*"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TOURMATE</title>
</head>
<style>
.tripDetailsContainer {
	width: 80%;
	display: flex;
	gap: 2vw;
	margin: 0 auto;
}

.trip-info-section {
	background-color: white;
	border-radius: 15px;
	padding: 10px;
	width: 70%;
	margin-top: 3vw;
	margin-left: 2vw;
}

.user-info-section {
	background-color: white;
	padding: 10px;
	margin-top: 3vw;
	line-height: 1.5vw;
}

button {
	background-color: #E9EAFF;
}

.user-info-section {
	display: flex;
	align-items: center;
	width: 80%; /* 너비 고정 */
	overflow: hidden;
	line-height: 1.5vw;
}

.user-info-section img {
	width: 30%;
	height: 30%;
	margin-right: 5px;
}

textarea {
	width: 80%;
	height: 25%;
	resize: none;
	margin-left: 3px;
	margin-bottom: 1vw;
}

.trip-info-section>div {
	display: flex;
	align-items: center;
	gap: 10px; /* 아이템 간의 간격 */
}

/* form 태그 내의 div를 가로 정렬 */
form>div {
	display: flex;
	align-items: center;
	gap: 10px;
}

.trip-info-section h2 {
	margin-left: 1.5vw;
}

.trip-info-section h4 {
	margin-left: 1.5vw;
}

.trip-info-section div {
	margin-left: 2vw;
}
.comment-container ul{
 list-style-type: none;
}

.comment-container li {
    margin-bottom: 1vw;
}

#content{
 margin-left:2.5vw;
 margin-right:1vw;
}
</style>
<body>
	<jsp:include page="../common/header.jsp" />

	<div class="tripDetailsContainer">
		<div class="trip-info-section">
			<br>
			<br>
			<h2><%=request.getParameter("title")%></h2>
			<br>
			<div>
				<p>
					<img src="../img/2user.svg" width="13%" height="13%" />모집인원:
					<%=request.getParameter("count")%></p>
				<p>
					<img src="../img/calendar.svg" width="9%" height="9%" />여행 일정:
					<%=request.getParameter("travel_schedule")%></p>
			</div>

			<br> <br>
			<p id="content"><%=request.getParameter("content")%></p>
			<br> <br>

			<h4>
				<img src="../img/comment.png" /> 댓글
			</h4>
			<br>
			<%
			if (request.getSession().getAttribute("username") != null) {
			%>
			<form action="/project/AddCommentServlet" method="post">
				<input type="hidden" name="post_id"
					value="<%=request.getParameter("post_id")%>"> <input
					type="hidden" name="username"
					value="<%=request.getSession().getAttribute("username")%>">
				<div>
					<textarea name="content" placeholder="함께 여행하고 싶다면 댓글을 작성해보세요!"
						required></textarea>
					<input type="submit" value="댓글 등록">
				</div>

			</form>
			<%
			}
			%>

			<%
			List<String> commentsList = new ArrayList<>();

			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				String dbURL = "jdbc:mysql://localhost:3306/tourmate?useUnicode=true&characterEncoding=UTF-8";
				String dbUser = "root";
				String dbPass = "0000";
				Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

				String query = "SELECT content, username FROM comments WHERE post_id = ?";
				PreparedStatement pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, Integer.parseInt(request.getParameter("post_id")));

				ResultSet rs = pstmt.executeQuery();

				while (rs.next()) {
					String comment = rs.getString("username") + ": " + rs.getString("content");
					commentsList.add(comment);
				}

				pstmt.close();
				rs.close();
				conn.close();

			} catch (Exception e) {
				e.printStackTrace();
			}
			%>


			<div class="comment-container">
				<ul>
					<%
					for (String comment : commentsList) {
					%>
					<li><%=comment%></li>
					
					<%
					}
					%>
				</ul>

			</div>

		</div>
		<div>
			<div class="user-info-section">
				<img
					src="<%=request.getParameter("gender").contains("여성") ? "../img/female.png" : "../img/male.png"%>">
				<div>
					<h4><%=request.getParameter("nickname")%>
					</h4>
					<p><%=request.getParameter("gender")%>
						<%=request.getParameter("age")%>대
						<%=request.getParameter("mbti")%>
					</p>
					<p><%=request.getParameter("introduction")%></p>
				</div>
			</div>
			<%
			if (request.getSession().getAttribute("username") != null) {
				if (request.getSession().getAttribute("username").equals(request.getParameter("username"))) {
			%>
			<button>삭제하기</button>
			<%
			} else {
			%>
			<%
			}
			}
			%>
		</div>

	</div>


	<jsp:include page="../common/footer.jsp" />
</body>
</html>