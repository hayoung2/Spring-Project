<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>설문조사</title>
</head>

<style>
  
 
    input[type="text"], input[type="password"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #e0e0e0;
        border-radius: 4px;
    }

   

    label.radio {
        padding: 8px 12px;
        border: 2px solid #007BFF;
        border-radius: 4px;
        margin-right: 10px;
        cursor: pointer;
    }

    input[type="radio"]:checked + label.radio {
        background-color: #007BFF;
        color: white;
    }

    textarea {
        width: 100%;
        padding: 10px;
        border: 1px solid #e0e0e0;
        border-radius: 4px;
        resize: none;
    }

    input[type="submit"] {
        display: block;
        width: 100%;
        padding: 10px;
        background-color: #007BFF;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        margin-top: 20px;
    }

    input[type="submit"]:hover {
        background-color: #0056b3;
    }
    
    .form-container {
            width: 100%;
            margin: 0 auto; /* 중앙 정렬 */
            display: flex;
            justify-content: center;
        }

        .form-section {
            width: 100%; /* 각 섹션의 너비 조절 */
            padding: 20px;
            border: none;
         
        }
        
         .mbti-btn {
      display: inline-block;
      padding: 10px 20px;
      border: 1px solid #000;
      color: #000;
      transition: background-color 0.3s, color 0.3s;
  }

 
  .mbti-btn:checked + label {
      background-color: #007BFF;
      color: #fff;
  }

 
  .mbti-btn[type="radio"] {
      display: none;
  }
  
  .mbti-group {
    display: inline-block;
    margin-right: 10px;
}
</style>
<body style="background-color:#fff">

  <jsp:include page="../common/header.jsp" />
 
 
  <br><br><br>

<div class="form-container">
    <h3><img src="../img/pin.svg">나의 기본정보</h3>
<br><br>
</div>
<%
String dbURL = "jdbc:mysql://localhost:3306/tourmate?useUnicode=true&characterEncoding=UTF-8";
String dbUser = "root";
String dbPass = "0000";

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

String currentUsername = (String) session.getAttribute("username"); // 세션에서 username 가져옴

String query = "SELECT * FROM users WHERE username = ?";
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
    pstmt = conn.prepareStatement(query);
    pstmt.setString(1, currentUsername);
    rs = pstmt.executeQuery();

    if (rs.next()) {
%>

<div class="form-container">
   <br><br>
   <p>아이디: <%= rs.getString("username") %></p>
</div>
<div class="form-container">
   <br><br>
   <p>닉네임: <%= rs.getString("nickname") %></p>
</div>
<div class="form-container">
    <br><br>
    <p>성별: <%= rs.getString("gender") %></p>
</div>
<div class="form-container">
    <br><br>
    <p>나이대: <%= rs.getString("age") %>대</p>
</div>
<div class="form-container">
    <br><br>
    <p>MBTI: <%= rs.getString("mbti") %></p>
</div>
<div class="form-container">
    <br><br>
    <p>간단한 소개: <%= rs.getString("introduction") %></p> 
</div>

<%
    }

} catch (Exception e) {
    out.print("Error: " + e.getMessage());
} finally {
    if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
    if (pstmt != null) try { pstmt.close(); } catch (SQLException ignore) {}
    if (conn != null) try { conn.close(); } catch (SQLException ignore) {}
}
%>
  


<div class="form-container">
    <form action="/project/DeleteAccountServlet" method="post" style="margin-right:1vw;" >
        <div class="form-section">
            <input type="submit" value="탈퇴하기" style="background-color:red;">
        </div>
    </form>
    <div width="4px"></div> <form action="/project/LogoutServlet" method="post">
        <div class="form-section">
            <input type="submit" value="로그아웃">
        </div>
    </form>
</div>



</body>
</html>