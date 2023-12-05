<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.example.peoplelink.post.CommentDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>PeopleLink</title>
</head>
<body>
<%
    String userID = (String) session.getAttribute("userID");
    PrintWriter script = response.getWriter();
    if (userID == null) {
        script.println("<script>");
        script.println("alert('로그인 후 이용해주세요.');");
        script.println("location.href='login.jsp';");
        script.println("</script>");
    } else {
        int postID = (request.getParameter("postID") != null) ? Integer.parseInt(request.getParameter("postID")) : 0;
        String postComment = request.getParameter("postComment");

        if (postID != 0 && postComment != null && !postComment.trim().isEmpty()) {
            CommentDAO commentDAO = new CommentDAO();
            commentDAO.insertComment(postID, userID, postComment);
            response.sendRedirect("view.jsp?postID=" + postID);
        } else {
            script.println("<script>");
            script.println("alert('댓글을 작성해주세요.');");
            script.println("view.jsp?postID=" + postID);
            script.println("</script>");
        }
    }
%>
</body>
</html>
