<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
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
                닉네임
            </span>
                <span>
                게시글 수
            </span>
            </div>
        </div>
        <div class="my-post-list">
            <div class="post-box">

            </div>
            <div class="post-box">

            </div>
            <div class="post-box">

            </div>
            <div class="post-box">

            </div>
            <div class="post-box">

            </div>
        </div>
    </div>
</div>
</body>
</html>