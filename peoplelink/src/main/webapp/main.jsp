<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>PeopleLink</title>
  <link rel="stylesheet" href="">

</head>
<body>
  <%
    String userID = null;
    if (session.getAttribute("userID") != null) {
      userID = (String) session.getAttribute("userID");
    }
  %>
  <%@ include file="navbar.jsp" %>

  <nav class="navbar navbar-expand-lg navbar-light bg-light">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-controls="bs-example-navbar-collapse-1" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <a class="navbar-brand" href="index.jsp">PeopleLink</a>
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="navbar-nav">
        <li class="nav-item active"><a class="nav-link" href="index.jsp">메인</a></li>
        <li class="nav-item"><a class="nav-link" href="bbs.jsp">게시판</a></li>
      </ul>
      <%
        // 로그인이 되어 있지 않다면
        if(userID == null) {
      %>
      <ul class="navbar-nav ml-auto">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown"
             aria-haspopup="true" aria-expanded="false">
            접속하기 <span class="caret"></span>
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="login.jsp">로그인</a>
            <a class="dropdown-item" href="join.jsp">회원가입</a>
          </div>
        </li>
      </ul>
      <%
        } else {
      %>
      <ul class="navbar-nav ml-auto">
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown"
             aria-haspopup="true" aria-expanded="false">
            회원관리 <span class="caret"></span>
          </a>
          <div class="dropdown-menu" aria-labelledby="navbarDropdown">
            <a class="dropdown-item" href="logoutAction.jsp">로그아웃</a>
          </div>
        </li>
      </ul>
      <%
        }
      %>
    </div>
  </nav>
</body>
</html>