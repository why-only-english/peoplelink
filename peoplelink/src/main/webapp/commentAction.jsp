<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.example.peoplelink.post.CommentDAO" %>

<%
    // 사용자 세션 확인
    String userID = (String) session.getAttribute("userID");
    if (userID == null) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('로그인 후 이용해주세요.');");
        script.println("location.href='login.jsp';"); // 로그인 페이지로 리다이렉션
        script.println("</script>");
    } else {
        // POST 요청 처리
        int postID = (request.getParameter("postID") != null) ? Integer.parseInt(request.getParameter("postID")) : 0;
        String postComment = request.getParameter("postComment");

        if (postID != 0 && postComment != null && !postComment.trim().isEmpty()) {
            // 댓글 DAO를 사용해 댓글 추가
            CommentDAO commentDAO = new CommentDAO();
            commentDAO.insertComment(postID, userID, postComment);

            // 게시글 페이지로 리다이렉션
            response.sendRedirect("view.jsp?postID=" + postID);
        } else {
            // 유효하지 않은 입력 처리
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('댓글을 작성해주세요.');");
            script.println("history.back();");
            script.println("</script>");
        }
    }
%>
