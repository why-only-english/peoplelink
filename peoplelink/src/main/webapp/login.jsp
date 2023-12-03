<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>PeopleLink</title>
    <link rel="stylesheet" href="./css/login.css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
</head>
<script>
</script>
<body>
<%
    session.invalidate(); // 세션 무효화
%>
<div id="loginContainer">
    <div id="leftContainer">

    </div>
    <div id="rightContainer">
        <form class="loginBox" method="post" action="loginAction.jsp">
            <img id="logo" src="./png/serviceLogo.png" alt="peopleLink 로고">
            <input type="text" name="userID" placeholder="아이디" required>
            <input type="password" name="userPassword" placeholder="비밀번호" required>
            <button type="submit" class="loginBtn">로그인</button>
        </form>
        <div id="membershipContainer">
                <span>
                    계정이 없으신가요?
                </span>
            <a href="./join.jsp" class="join-membership" onclick="logout()">가입하기</a>
        </div>
    </div>
</div>
</body>
</html>