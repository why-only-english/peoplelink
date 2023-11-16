<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.peoplelink.user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="com.example.peoplelink.user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<jsp:setProperty name="user" property="userPassword" />
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>PeopleLink</title>
</head>
<body>
<%
  UserDAO userDAO = new UserDAO();
  // login에서 설정해 준 각각의 결괏값이 result에 담기게 됨
  int result = userDAO.login(user.getUserID(), user.getUserPassword());
  // 로그인 성공
  if (result == 1) {
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("location.href = 'main.jsp'");
    script.println("</script>");
  }
  // 비밀번호 오류
  else if (result == 0) {
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('비밀번호가 틀립니다.');");
    script.println("history.back()");  // 이전 페이지로 돌려주기
    script.println("</script>");
  }
  // 아이디 존재 x
  else if (result == -1) {
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('존재하지 않는 아이디입니다.');");
    script.println("history.back()");  // 이전 페이지로 돌려주기
    script.println("</script>");
  }
  // 데이터베이스 오류
  else if (result == -2) {
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('데이터베이스 오류가 발생했습니다.');");
    script.println("history.back()");  // 이전 페이지로 돌려주기
    script.println("</script>");
  }
%>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>