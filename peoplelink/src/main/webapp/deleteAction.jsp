<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.peoplelink.post.PostDAO" %>
<%@ page import="com.example.peoplelink.post.Post" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>PeopleLink</title>
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
        if (!userID.equals(post.getUserID())) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('권한이 없습니다.');");
            script.println("location.href = 'main.jsp'");
            script.println("</script>");
        }
        // 로그인이 되어 있을 때
        else {
            PostDAO postDAO = new PostDAO();
            int result = postDAO.delete(postID);
            // 데이터 베이스 오류
            if (result == -1) {
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('글 삭제에 실패했습니다.');");
                script.println("history.back()");  // 이전 페이지로 돌려주기
                script.println("</script>");
            }
            // 글 작성 완료 -> 메인 페이지로 이동
            else {
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('글 삭제가 완료되었습니다.');");
                script.println("location.href = 'main.jsp'");  // 게시판 페이지로 돌려주기
                script.println("</script>");
            }
        }
    %>
</body>
</html>