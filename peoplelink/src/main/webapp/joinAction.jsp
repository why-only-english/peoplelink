<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.peoplelink.user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="com.example.peoplelink.user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<jsp:setProperty name="user" property="userNickname" />
<jsp:setProperty name="user" property="userEmail" />
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>PeopleLink</title>
</head>
<body>
<%
    // 사용자가 입력 안 한 항목이 있을 때
    if (user.getUserID() == null || user.getUserPassword() == null
            || user.getUserNickname() == null || user.getUserEmail() == null) {
        PrintWriter script = response.getWriter();
        script.println("<script>");
        script.println("alert('입력이 안 된 항목이 있습니다.');");
        script.println("history.back()");  // 이전 페이지로 돌려주기
        script.println("</script>");
    }
    else {
        UserDAO userDAO = new UserDAO();
        // join에서 설정해 준 각각의 결괏값이 result에 담기게 됨
        int result = userDAO.join(user);
        // 데이터베이스 오류
        if (result == -1) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('이미 존재하는 아이디입니다.');");
            script.println("history.back()");  // 이전 페이지로 돌려주기
            script.println("</script>");
        }
        // 회원가입 완료 -> 로그인 페이지로 이동
        else {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('회원가입이 완료되었습니다.');");
            script.println("history.back()");  // 이전 페이지로 돌려주기
            script.println("</script>");
        }
    }
%>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>