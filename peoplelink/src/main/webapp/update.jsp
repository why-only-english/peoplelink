<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.example.peoplelink.post.Post" %>
<%@ page import="com.example.peoplelink.post.PostDAO" %>
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
        if (userID == null) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('로그인을 하세요.');");
            script.println("location.href = 'login.jsp'");
            script.println("</script>");
        }
        int postID = 0;
        if (request.getParameter("postID") != null) {
            postID = Integer.parseInt(request.getParameter("postID"));
        }
        if (postID == 0) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('유효하지 않은 글입니다.');");
            script.println("location.href = 'main.jsp'");
            script.println("</script>");
        }
        Post post = new PostDAO().getPost(postID);
        // 세션에 있는 값과 글을 작성한 사람의 ID가 동일하지 않을 때
        if (!userID.equals(post.getUserID())) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('권한이 없습니다.');");
            script.println("location.href = 'main.jsp'");
            script.println("</script>");
        }
    %>
    <div id="createContainer">
        <form method="post" action="updateAction.jsp?postID=<%= postID %>">
            <h1 class="title">게시판 글 수정</h1>
            <input type="submit" class="share-btn" value="수정">
            <div class="input-container">
                <div class="img-input">
                    <input type="file" accept="image/*"/>
                </div>
                <div>
                    <div class="title-input">
                        <input type="text" name="postTitle" placeholder="제목을 입력하세요" value="<%= post.getPostTitle() %>"/>
                    </div>
                    <div class="text-input">
                        <input type="text" name="postContent" placeholder="게시글 내용을 입력하세요" value="<%= post.getPostContent() %>"/>
                    </div>
                </div>
            </div>
        </form>
    </div>
</body>
</html>