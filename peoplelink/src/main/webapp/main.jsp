<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.example.peoplelink.post.PostDAO" %>
<%@ page import="com.example.peoplelink.post.Post" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>PeopleLink</title>
    <link rel="stylesheet" href="./css/main.css">
</head>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        var moreBtns = document.querySelectorAll(".more-btn");

        moreBtns.forEach(function (btn) {
            btn.addEventListener("click", function () {
                var moreOptions = this.closest(".post-container").querySelector(".more-options");
                moreOptions.style.display = moreOptions.style.display === "none" ? "flex" : "none";
            });
        });
    });
</script>
<body>
<div style="display: flex;">
    <%
        String userID = null;
        if (session.getAttribute("userID") != null) {
            userID = (String) session.getAttribute("userID");
        }
        int pageNumber = 1;
        if (request.getParameter("pageNumber") != null) {
            pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
        }
    %>
    <%@ include file="navbar.jsp" %>

    <div style="margin-left: 32px;
    width: 630px;
    display: flex;
    flex-direction: column;">
        <%
            PostDAO postDAO = new PostDAO();
            ArrayList<Post> list = postDAO.getList(pageNumber);

            for (int i = 0; i < list.size(); i++) {
        %>
        <div class="post-container">
            <img src="./png/account_box.png" alt="프로필 이미지" class="nav-icon">
            <span class="post-nickname"><%= list.get(i).getUserID() %></span>
            <span>•몇시간 전</span>
            <img src="./png/more.png" alt="더보기 버튼" class="more-btn">

            <div class="more-options" style="display: none;">
                <% if (userID != null && userID.equals(list.get(i).getUserID())) { %>
                <a href="update.jsp?postID=<%= list.get(i).getPostID() %>">수정</a>
                <a onclick="return confirm('게시글을 삭제하시겠어요?')"
                   href="deleteAction.jsp?postID=<%= list.get(i).getPostID() %>">삭제</a>
                <% } %>
            </div>

            <div class="post-img-box">
                asd
            </div>
            <div class="icon-container">
                <img src="./png/heart.png" alt="좋아요 버튼" class="nav-icon">
                <img src="./png/chat.png" alt="댓글 버튼" class="nav-icon">
            </div>
            <div class="contents-container">
                <h2>
                    <a href="view.jsp?postID=<%= list.get(i).getPostID() %>"><%= list.get(i).getPostTitle() %>
                    </a>
                </h2>
                <p><%= list.get(i).getPostContent() %>
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
