<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>PeopleLink</title>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-controls="bs-example-navbar-collapse-1" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <a class="navbar-brand" href="index.jsp">PeopleLink</a>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="index.jsp">메인</a></li>
                <li class="nav-item"><a class="nav-link" href="bbs.jsp">게시판</a></li>
            </ul>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-toggle="dropdown"
                       aria-haspopup="true" aria-expanded="false">
                        접속하기 <span class="caret"></span>
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item active" href="login.jsp">로그인</a>
                        <a class="dropdown-item" href="join.jsp">회원가입</a>
                    </div>
                </li>
            </ul>
        </div>
    </nav>
    <div class="container">
            <div class="col-lg-4"></div>
            <div class="col-lg-4">
                <div class="jumbotron" style="padding-top: 20px;">
                    <form method="post" action="LoginAction.jsp">
                        <h3 style="text-align: center;">로그인 화면</h3>
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="아이디" name="userID" maxlength="20">
                        </div>
                    </form>
                        <div class="form-group">
                            <input type="password" class="form-control" placeholder="비밀번호" name="userPassword" maxlength="20">
                        </div>
                        <input type="submit" class="btn btn-primary form-control" value="로그인">
                </div>
            </div>
        <div class="col-lg-4"></div>
    </div>

<%--    <script src="js/jquery-3.7.1.min.map"></script>--%>
<%--    <link rel="stylesheet" href="css/bootstrap.css">--%>
<%--    <script src="js/bootstrap.js"></script>--%>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>