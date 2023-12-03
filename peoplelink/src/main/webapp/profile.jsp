<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.example.peoplelink.user.User" %>
<%@ page import="com.example.peoplelink.user.UserDAO" %>
<%@ page import="com.example.peoplelink.post.Post" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.peoplelink.post.PostDAO" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>PeopleLink</title>
    <link rel="stylesheet" href="./css/profile.css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<body>
    <div id="profileContainer">
        <%@ include file="navbar.jsp" %>
        <div id="myProfile">
            <div class="data-container">
                <div class="my-img"></div>
                <div class="right-data-container">
                <span>
                    <%
                        String loggedInUserID = (String) session.getAttribute("userID");
                        if (loggedInUserID != null) {
                            // 로그인한 유저의 아이디를 사용하여 유저 정보를 가져옴
                            UserDAO userDAO = new UserDAO();
                            User user = userDAO.getUserInfo(loggedInUserID);
                            if (user != null) {
                                out.println(user.getUserNickname());
                            }
                        }
                    %>
                </span>
                    <span>
                        게시글 수
                    </span>
                </div>
            </div>
            <div class="my-post-list">
                <%
                    // 사용자가 작성한 글을 출력
                    // 사용자가 작성한 글을 출력
                    UserDAO userDAO = new UserDAO();
                    List<Post> userPosts = userDAO.getUserPosts(loggedInUserID);

                    for (Post post : userPosts) {
                %>
                <div class="post-box">
                    <p><%= post.getPostTitle() %></p>
                    <p><%= post.getPostContent() %></p>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </div>
</body>
</html>


