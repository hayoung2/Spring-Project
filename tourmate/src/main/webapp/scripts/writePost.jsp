<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TOURMATE</title>
</head>
<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
}

.center-container {
	width: 60%; /* or desired width */
	margin: 0 auto;
}

.section-title {
	margin-bottom: 20px;
	font-weight: bold;
	align-items: center;
}

span {
	margin-right: 10px;
	font-weight: bold;
	align-items: center;
}

select {
	padding: 5px;
	margin-left: 10px;
}

.input-group {
	margin-top: 20px;
	position: relative;
}

.input-group input {
	width: 100%;
	padding: 10px;
	box-sizing: border-box;
	margin-top: 10px;
	font-size: 16px;
}

.input-group textarea {
	width: 100%;
	height: 200px;
	padding: 10px;
	box-sizing: border-box;
	margin-top: 10px;
	font-size: 16px;
}

button {
	margin-top: 1vw;
	padding: 10px 20px;
	margin-bottom: 3vw;
	border: none; /* 테두리 제거 */
	border-radius: 1px;
	cursor: pointer;
	background-color: #007bff; /* 파란색 배경색 */
	color: white; /* 텍스트 색상 */
	transition: background-color 0.3s; /* hover 효과에 사용할 속성 설정 */
	text-align: center; /* 텍스트 중앙 정렬 */
}

/* hover 효과 */
button:hover {
	background-color: #0056b3; /* hover 시 배경색 변경 */
}

/* 버튼 그룹 중앙 정렬 */
.button-group {
	text-align: center;
}
</style>
<body style="background-color: white;">

	<jsp:include page="../common/header.jsp" />


	<jsp:include page="../common/container.jsp">
		<jsp:param name="headerText" value="동행모집글 작성 팁 🧐" />
		<jsp:param name="subHeaderText1"
			value="모집인원과 여행일정을 선택하고, 여행계획에 대해 상세하게 소개해주세요! " />
		<jsp:param name="subHeaderText2"
			value="진정성이 보일수록 더 좋은 상대를 발견할 가능성 up 🤸🤸" />
		<jsp:param name="imgSrc" value="../img/note2.png" />
		<jsp:param name="bgColor" value="#E9EAFF" />
	</jsp:include>


	<div class="center-container">
    <form action="/project/PostServlet" method="post">
        <br> <br> 
        <span><img src="../img/pin.svg"> 기본정보</span>
        <div class="section-title">
            <br>
            <div style="float: left;">
                모집인원 
                <select name="count">
                    <option>1명</option>
                    <option>2명</option>
                    <option>3명이상</option>
                </select>
            </div>
            <div style="float: left; margin-left: 5vw">
                여행일정 
                <input type="text" name="travel_schedule" placeholder="ex) 2023.10.28~2023.10.31" pattern="\d{4}\.\d{2}\.\d{2}~\d{4}\.\d{2}\.\d{2}">
            </div>
        </div>
        <br> <br> 
        <span><img src="../img/pin.svg"> 여행소개</span>
        <div class="input-group">
            <input type="text" name="title" placeholder="글 제목을 입력해주세요." maxlength="30">
            <div class="input-group">
                <textarea name="content" placeholder="여행 계획에 대해 소개해주세요." maxlength="400"></textarea>
            </div>
            <div class="button-group">
                <button type="button" onclick="location.href='home.jsp'">취소하기</button>
                <button type="submit">등록하기</button>
            </div>
        </div>
    </form>
</div>
</body>

</body>
</html>