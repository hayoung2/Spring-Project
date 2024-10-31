
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<%@ page import="org.jsoup.Jsoup" %>
<%@ page import="org.jsoup.nodes.Document" %>
<%@ page import="org.jsoup.nodes.Element" %>
<%@ page import="org.jsoup.select.Elements" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>TOURMATE</title>    
</head>
<style>


        
        .article-item {
            width: calc(25%);
            margin-bottom: 20px;
            box-shadow: 0 1px 1px rgba(0,0,0,0.1);
            transition: 0.3s;
            border-radius: 0.5px;
            border: 0.1px solid #ECEDEE;
        }

        .article-item:hover {
            box-shadow: 0 8px 16px rgba(0,0,0,0.2);
        }

        .article-image {
            width: 100%;
            max-height: 200px;
            border-radius: 8px 8px 0 0;
            overflow: hidden;
        }

        .article-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .article-content {
            padding: 15px;
        }

        .article-title {
            font-size: 18px;
            margin-bottom: 10px;
            font-weight: bold;
        }

        .article-description {
            font-size: 14px;
            margin-bottom: 10px;
        }

        .article-date {
            font-size: 12px;
            color: gray;
        }
.articles-grid {
    width: 75%;
    margin: 0 auto;
    margin-bottom:10vw;
}

.article-row {
    display: flex;
    justify-content: space-between;
    width: 100%;
    margin-bottom: 5vw; /* 원하는 간격으로 조절 */
}
.article-item {
    flex: 1;
  margin: 0 30px;
   
}

</style>
<body>

   <jsp:include page="../common/header.jsp" />
   
    <jsp:include page="../common/container.jsp">
    <jsp:param name="headerText" value="아 이건 여행 전에 알아야 됐는데...😭" />
    <jsp:param name="subHeaderText1" value="투어메이트의 아티클✨에 필수로 알야아 할 여행 꿀팁이 한가득!" />
    <jsp:param name="subHeaderText2" value=" 여행 준비할 때 꼭!! 읽고 가세요⭐" />
    <jsp:param name="imgSrc" value="../img/book.svg" />
    <jsp:param name="bgColor" value="#EDFAF7" />
</jsp:include>
    
    
    <div style=" width:100%; height:5vh;"></div>

<%
    Document doc = Jsoup.connect("https://www.traveltimes.co.kr/news/articleList.html?sc_section_code=S1N1&view_type=sm").get();
    Elements elements = doc.select(".types li");
    int count = 0;
%>

<div class="articles-grid">

<% for(Element e: elements) { 
    if(count >= 12) break; 
    if(count % 3 == 0 && count != 0) { %>
        </div>
    <% }
    if(count % 3 == 0) { %>
        <div class="article-row">
    <% } 
    count++;
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
                <p class="article-description"><%=description%></p>
                <span class="article-date"><%=date%></span>
            </div>
        </a>
    </div>

<% } %>
</div>


</div>

<jsp:include page="../common/footer.jsp"/>


</body>

</html>