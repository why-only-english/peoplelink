<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.peoplelink.post.PostDAO" %>
<%@ page import="com.example.peoplelink.post.Post" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>PeopleLink</title>
    <link rel="stylesheet" href="./css/main.css">
    <style type="text/css">
        a, a:hover {
            color: #000000;
            text-decoration: none;
        }
    </style>
</head>
<body>
<%
    String userID = null;
    if (session.getAttribute("userID") != null) {
        userID = (String) session.getAttribute("userID");
    }
    int pageNumber = 1;
    if (request.getParameter("pageNumber") != null) {
        pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
    }
    String search = request.getParameter("search");
    if (request.getParameter("search") != null) {
        search = request.getParameter("search");
    }
%>
<div style="display: flex;">
    <%@ include file="navbar.jsp" %>

    <div style="margin-left: 32px;
    width: 630px;
    display: flex;
    flex-direction: column;">
        <%
            PostDAO postDAO = new PostDAO();
            ArrayList<Post> list = postDAO.searchList(search, pageNumber);
            for (int i = 0; i < list.size(); i++) {
        %>
        <div class="post-container">
            <img src="./png/account_box.png" alt="프로필 이미지" class="nav-icon">
            <span class="post-nickname"><%= list.get(i).getUserID() %></span>
            <span>•몇시간 전</span>
            <img src="./png/more.png" alt="더보기 버튼" class="more-btn">

            <div class="more-options">
                <% if (userID != null && userID.equals(list.get(i).getUserID())) { %>
                <a href="update.jsp?postID=<%= list.get(i).getPostID() %>">수정</a>
                <a onclick="return confirm('게시글을 삭제하시겠어요?')"
                   href="deleteAction.jsp?postID=<%= list.get(i).getPostID() %>">삭제</a>
                <% } %>
            </div>

            <div class="post-img-box">
                <img style="width: 468px; height: 468px;" src="upload/<%=list.get(i).getFileName()%>">
            </div>
            <div class="icon-container">
                <img src="./png/heart.png" alt="좋아요 버튼" class="nav-icon">
                <a href="view.jsp?postID=<%= list.get(i).getPostID() %>">
                    <img src="./png/chat.png" alt="댓글 버튼" class="nav-icon">
                </a>
            </div>
            <div class="contents-container">
                <h2 class="post-title">
                    <%= list.get(i).getPostTitle() %>
                </h2>
                <p>
                    <%= list.get(i).getPostContent() %>
                </p>
            </div>
        </div>
        <%
            }
        %>
    </div>
</div>
</body>
</html>