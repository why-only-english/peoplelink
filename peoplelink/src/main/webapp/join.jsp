<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>PeopleLink</title>
    <link rel="stylesheet" href="./css/join.css">

</head>
<body>
<div id="accountsContainer">
    <img id="logo" src="./png/serviceLogo.png" alt="peopleLink 로고">
    <p>추억을 저장해요</p>
    <form class="accountBox" action="joinAction.jsp" method="POST">
        <input type="email" placeholder="이메일" name="userEmail">
        <input type="text" name="userID" placeholder="아이디" required>
        <input type="password" name="userPassword" placeholder="비밀번호" required>
        <input type="password" name="confirmation" placeholder="비밀번호확인" required>
        <input type="text" name="userNickname" placeholder="닉네임" required>
        <button type="submit" class="account-btn">가입</button>
    </form>
    <div>
            <span>
                계정이 있으신가요??
                <a href="./login.jsp" class="join-login">로그인</a>
            </span>
    </div>
</div>
<%--        <input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">--%>
<%--    </div>--%>
<%--    <div class="form-group">--%>
<%--        <input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">--%>
<%--    </div>--%>
<%--    <div class="form-group">--%>
<%--        <input type="text" class="form-control" placeholder="닉네임" name="userNickname" maxlength="20">--%>
<%--    </div>--%>
<%--    <div class="form-group">--%>
<%--        <input type="email" class="form-control" placeholder="이메일" name="userEmail" maxlength="50">--%>
<%--    </div>--%>
<%--    <input type="submit" class="btn btn-primary form-control" value="회원가입">--%>
</div>
</body>
</html>