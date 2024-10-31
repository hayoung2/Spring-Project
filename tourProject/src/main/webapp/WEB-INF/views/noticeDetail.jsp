<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ page import="com.example.demo.model.Notice" %>
<%@ page import="java.util.*" %>

<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>공지사항 상세 - TOURMATE</title>
    <link rel="stylesheet" href="../css/noticeDetail.css">
</head>
<body>
    
<jsp:include page="../common/header.jsp" />

 <jsp:include page="../common/container.jsp">
    <jsp:param name="headerText" value="공지사항 주목! 👀" />
    <jsp:param name="subHeaderText1" value="투어메이트만의 이벤트는 공지사항에서 확인하세요!🤫" />
    <jsp:param name="subHeaderText2" value="다양한 이벤트와 공지사항이 가득✨" />
    <jsp:param name="imgSrc" value="../img/note2.png" />
     <jsp:param name="bgColor" value="#F2F3FF" />
</jsp:include>


<div class="notice-detail-container">
    <% 
    int noticeId = Integer.parseInt(request.getParameter("id"));
    Notice notice = Notice.getNoticeById(noticeId);
    Notice.updateViewCount(noticeId); 
    %>
    <table class="notice-table">
        <tr>
            <th>제목</th>
            <td><%= notice.getTitle() %></td>
        </tr>
        <tr>
            <th>작성일</th>
            <td><%= notice.getCreatedAt().toString() %></td>
        </tr>
        <tr>
            <th>조회수</th>
            <td><%= notice.getViewCount() %></td>
        </tr>
        <tr>
            <td colspan="2"><%= notice.getContent() %></td>
        </tr>
    </table>

    <!-- Navigation for next and previous notices -->
    <div class="navigation">
        <% Notice prevNotice = Notice.getPrevNotice(noticeId);
           Notice nextNotice = Notice.getNextNotice(noticeId);
           if(prevNotice != null) { 
        %>
        <a href="/noticeDetail?id=<%= prevNotice.getId() %>">이전글: <%= prevNotice.getTitle() %></a>
        <% } else { %>
        <p>이전 글이 없습니다.</p>
        <% } 
           if(nextNotice != null) { 
        %>
        <a href="/noticeDetail?id=<%= nextNotice.getId() %>">다음글: <%= nextNotice.getTitle() %></a>
        <% } else { %>
        <p>다음 글이 없습니다.</p>
        <% } 
        %>
    </div>
</div>

<jsp:include page="../common/footer.jsp" />

</body>
</html>
