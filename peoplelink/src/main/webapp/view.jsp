<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.peoplelink.post.Post" %>
<%@ page import="com.example.peoplelink.post.PostDAO" %>
<%@ page import="com.example.peoplelink.post.Comment" %>
<%@ page import="com.example.peoplelink.post.CommentDAO" %>
<%@ taglib prefix="custom" uri="http://example.com/commentTags" %>
<% CommentDAO commentDAO = new CommentDAO(); %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>PeopleLink</title>
    <link rel="stylesheet" href="./css/view.css">
</head>
<script>

</script>
<body>
<%
    String userID = (String) session.getAttribute("userID");
    int postID = (request.getParameter("postID") != null) ? Integer.parseInt(request.getParameter("postID")) : 0;

    if (postID == 0) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('유효하지 않은 글입니다.');");
        script.println("location.href = 'main.jsp'");
        script.println("</script>");
    }

    Post post = new PostDAO().getPost(postID);
    ArrayList<Comment> comments = (ArrayList<Comment>) commentDAO.getComments(postID);

    // 댓글 추가 처리
    if (userID != null && request.getMethod().equalsIgnoreCase("POST")) {
        String postComment = request.getParameter("postComment");
        if (postComment != null && !postComment.trim().isEmpty()) {
            commentDAO.insertComment(postID, userID, postComment);
        }
    }
%>

<div id="viewContainer">
    <h1 class="title"><%= post.getPostTitle() %>
    </h1>
    <a href="./main.jsp"><img class="close-img" src="./png/close.png" alt="개시글 이미지"></a>

    <div class="post-container">
        <div class="img-box">
            <img style="width: 468px; height: 468px;" src="upload/<%= post.getFileName() %>">
        </div>
        <div>
            <div class="title-box">
                작성자 : <%= post.getUserID() %> <br>
                내용
                : <%= post.getPostContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %>
            </div>
            <div class="content-box">
                <div class="content-box">
                    <!-- 커스텀 태그를 사용하여 댓글 목록 표시 -->
                    <custom:commentList postID="<%= postID %>" userID="<%= userID %>"/>
                </div>
            </div>
            <form method="post" action="commentAction.jsp">
                <input type="hidden" name="postID" value="<%= postID %>">
                <input type="text" class="comment-input" name="postComment" placeholder="댓글 달기..."/>
                <input type="submit" class="send-btn" value="전송">
            </form>
        </div>
    </div>
</div>
</body>
</html>