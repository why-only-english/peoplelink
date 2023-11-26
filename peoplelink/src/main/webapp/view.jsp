<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.example.peoplelink.post.Post" %>
<%@ page import="com.example.peoplelink.post.PostDAO" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>PeopleLink</title>
    <link rel="stylesheet" href="./css/view.css">

</head>
<script>
    function goBack() {
        window.history.back();
    }
</script>
<body>
<%
    String userID = null;
    if (session.getAttribute("userID") != null) {
        userID = (String) session.getAttribute("userID");
    }
    // 사용자가 게시글 제목 클릭 시 postID에 해당 값 담김
    int postID = 0;
    if (request.getParameter("postID") != null) {
        postID = Integer.parseInt(request.getParameter("postID"));
    }
    if (postID == 0) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('유효하지 않은 글입니다.');");
        script.println("location.href = 'bbs.jsp'");
        script.println("</script>");
    }
    Post post = new PostDAO().getPost(postID);
%>
<div id="viewContainer">
    <h1 class="title">
        <%= post.getPostTitle() %>
    </h1>
    <div>
        <img class="close-img" src="./png/close.png" onclick="goBack()">
    </div>
    <div class="post-container">
        <div class="img-box">
        </div>
        <div>
            <div class="title-box">
                작성자 :
                <%= post.getUserID() %> <br>
                내용 :
                <%= post.getPostContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %>
            </div>
            <div class="content-box">
                여기는 댓글 나오는 곳
            </div>
            <form method="post" action="/">
                <input type="text" class="comment-input" name="postComment" placeholder="댓글 달기..."/>
                <input type="submit" class="send-btn" value="전송">
            </form>
        </div>
    </div>
</div>
</body>
</html>