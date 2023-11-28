<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.peoplelink.post.Post" %>
<%@ page import="com.example.peoplelink.post.PostDAO" %>
<%@ page import="com.example.peoplelink.post.Comment" %>
<%@ page import="com.example.peoplelink.post.CommentDAO" %>

<%
    CommentDAO commentDAO = new CommentDAO();
%>

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
    String userID = (String) session.getAttribute("userID");
    int postID = (request.getParameter("postID") != null) ? Integer.parseInt(request.getParameter("postID")) : 0;

    if (postID == 0) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('유효하지 않은 글입니다.');");
        script.println("location.href = 'bbs.jsp'");
        script.println("</script>");
    }

    Post post = new PostDAO().getPost(postID);
    ArrayList<Comment> comments = commentDAO.getComments(postID);
%>

<div id="viewContainer">
    <h1 class="title"><%= post.getPostTitle() %></h1>
    <div><img class="close-img" src="./png/close.png" onclick="goBack()"></div>

    <div class="post-container">
        <div class="img-box"></div>
        <div>
            <div class="title-box">
                작성자 : <%= post.getUserID() %> <br>
                내용 : <%= post.getPostContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %>
            </div>
            <div class="content-box">
                <ul>
                    <% for (Comment comment : comments) { %>
                    <li><strong><%= comment.getUserID() %></strong>: <%= comment.getContent() %></li>
                    <% } %>
                </ul>
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
