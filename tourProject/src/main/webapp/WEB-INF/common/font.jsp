  <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
   <link rel="stylesheet" href="../css/font.css">
  
 <div style="margin-left:6vw; margin-top:2vw; margin-right:10vw; margin-bottom:2vw;">
 <div style="float:left;">
 <h4><%= request.getParameter("title") %></h4>
 </div>
 <div style="float:right;">
 <p><a href="<%=request.getParameter("page")%>" style="text-decoration:none; color:#6E6E6E;">더보기 ></a></p>
 </div>
 </div>