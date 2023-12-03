<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.example.peoplelink.post.CommentDAO" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>PeopleLink</title>
</head>
<body>
<%
    // 댓글 삭제를 위한 commentID 파라미터 받기
    int commentID = (request.getParameter("commentID") != null) ? Integer.parseInt(request.getParameter("commentID")) : 0;

    // 댓글 삭제 처리
    if (commentID != 0) {
        CommentDAO commentDAO = new CommentDAO();
        commentDAO.deleteComment(commentID);
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('댓글 삭제했습니다.');");
        script.println("history.back()");  // 이전 페이지로 돌려주기
        script.println("</script>");
    } else {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('댓글 삭제에 실패했습니다.');");
        script.println("history.back()");  // 이전 페이지로 돌려주기
        script.println("</script>");    }
%>

</body>
</html>