<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>PeopleLink</title>
    <link rel="stylesheet" href="./css/write.css">

</head>
<body>
<%
    String userID = null;
    if (session.getAttribute("userID") != null) {
        userID = (String) session.getAttribute("userID");
    }
%>
<div id="createContainer">
    <form method="post" action="writeAction.jsp" enctype="multipart/form-data">
        <h1 class="title">새 게시물 만들기</h1>
        <input type="submit" class="share-btn" value="공유">
        <div class="input-container">
            <div class="img-input">
                <input type="file" name="fileName" accept="image/*"/>
            </div>
            <div>
                <div class="atitle-input">
                    <input type="text" name="postTitle" placeholder="제목을 입력하세요"/>
                </div>
                <div class="text-input">
                    <input type="text" name="postContent" placeholder="게시글 내용을 입력하세요"/>
                </div>
            </div>
        </div>
    </form>
</div>
</body>
</html>