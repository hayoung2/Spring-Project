<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.jsoup.Jsoup" %>
<%@ page import="org.jsoup.nodes.Document" %>
<%@ page import="org.jsoup.nodes.Element" %>
<%@ page import="org.jsoup.select.Elements" %>

<link rel="stylesheet" href="../css/article.css">
<link rel="stylesheet" href="../css/style.css">

 <jsp:include page="../common/font.jsp">
    <jsp:param name="title" value="최신 여행기사" />
    <jsp:param name="page" value="articlePage.jsp" />
</jsp:include>
 
 <div class="article-container">
<%
    Document doc = Jsoup.connect("https://www.traveltimes.co.kr/news/articleList.html?sc_section_code=S1N1&view_type=sm").get();
    Elements elements = doc.select(".types li");
    int count=0;
    for(Element e: elements){
    	count++;
    	if(count>3)
    		break;
        String imgUrl = e.select(".views .thumb img").attr("src");
        String titleText = e.select(".titles a").text();
        String titleLink = e.select(".titles a").attr("href");
        String description = e.select(".lead").text();
        String date = e.select(".byline").text();
        
        if (titleText.length() > 20) {
            titleText = titleText.substring(0, 15) + "...";
        }

        if (description.length() > 40) {
            description = description.substring(0, 30) + "...";
        }
%>

    <div class="article-item">
     <a href="https://www.traveltimes.co.kr/<%=titleLink%>" target="_top">
        <div class="article-image">
            <img src="<%=imgUrl%>" alt="">
        </div>
        <div class="article-content">
            <h4 class="article-title"><%=titleText%></h4>
            <p class="article-description">
                <%=description%>
            </p>
            <span class="article-date"><%=date%></span>
        </div>
        </a>
    </div>
    
<%
    }
%>
 </div>