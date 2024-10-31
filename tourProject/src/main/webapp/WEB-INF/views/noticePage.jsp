<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
    <%@ page import="com.example.demo.model.Notice" %>

    
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>TOURMATE</title>
  
</head>
  <link rel="stylesheet" href="../css/noticeTable.css">
<body>
 
  <jsp:include page="../common/header.jsp" />
 

        
   
 <jsp:include page="../common/container.jsp">
    <jsp:param name="headerText" value="공지사항 주목! 👀" />
    <jsp:param name="subHeaderText1" value="투어메이트만의 이벤트는 공지사항에서 확인하세요!🤫" />
    <jsp:param name="subHeaderText2" value="다양한 이벤트와 공지사항이 가득✨" />
    <jsp:param name="imgSrc" value="../img/note2.png" />
     <jsp:param name="bgColor" value="#F2F3FF" />
</jsp:include>
    
    <div class="notice-container">
  <table border="1">
        <tr>
            <th>번호</th>
            <th>제목</th>
            <th>조회수</th>
            <th>작성일</th>
        </tr>
        <%
            int currentPage = 1;
            int recordsPerPage = 8;
            if(request.getParameter("page") != null)
                currentPage = Integer.parseInt(request.getParameter("page"));

            Notice[] notices = Notice.getNotices((currentPage-1)*recordsPerPage, recordsPerPage);
            for (Notice notice : notices) {
                if (notice != null) {
        %>
            <tr>
                <td><%= notice.getId() %></td>
                <td><a href="/noticeDetail?id=<%= notice.getId() %>"><%= notice.getTitle() %></a></td>
                <td><%= notice.getViewCount() %></td>
                <td><%= notice.getCreatedAt().toString() %></td>
            </tr>
        <%
                }
            }
        %>
    </table>
    <div>
        <% 
            int noOfRecords = Notice.getNoOfRecords();
            int noOfPages = (int) Math.ceil(noOfRecords * 1.0 / recordsPerPage);
            for (int i = 1; i <= noOfPages; i++) {
                if (i == currentPage) {
        %>
                    <b><%= i %></b>
        <%      } else { %>
                    <a href="/noticePage?page=<%= i %>"><%= i %></a>
        <%
                }
            }
        %>
    </div>
</div>


<jsp:include page="../common/footer.jsp" />
      
     
</body>
</html>