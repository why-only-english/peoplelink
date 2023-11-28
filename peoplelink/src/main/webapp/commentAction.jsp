<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.peoplelink.post.CommentDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.example.peoplelink.post.Comment" %>
<jsp:useBean id="comment" class="com.example.peoplelink.post.Comment" scope="page" />
<jsp:setProperty name="comment" property="content" />
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
    // 로그인이 되어 있을 때
    else {
        // 사용자가 입력한 댓글 내용 가져오기
        String commentContent = request.getParameter("postComment").trim();

        // 사용자가 입력 안 한 항목이 있을 때
        if (commentContent.isEmpty()) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('입력이 안 된 항목이 있습니다.');");
            script.println("history.back();");  // 이전 페이지로 돌려주기
            script.println("</script>");
        }
        else {
            int postID = Integer.parseInt(request.getParameter("postID"));
            CommentDAO commentDAO = new CommentDAO();

            // 댓글 작성 부분
            int result = commentDAO.writeComment(postID, userID, commentContent);

            // 데이터 베이스 오류
            if (result == -1) {
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('댓글 작성에 실패했습니다.');");
                script.println("history.back();");  // 이전 페이지로 돌려주기
                script.println("</script>");
            }
            else {
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('댓글 작성이 완료되었습니다.');");
                script.println("history.back();");  // 이전 페이지로 돌려주기
                script.println("</script>");
            }
        }
    }
%>

</body>
</html>
