<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>PeopleLink</title>
    <link rel="stylesheet" href="./css/navbar.css">
</head>
<style>
    a, a:hover {
        color: #000000;
        text-decoration: none;
    }
</style>
<body>
<div id="mainContainer">
    <div id="navContainer">
        <img src="./png/serviceLogo.png" id="logo" alt="peopleLink 로고">
        <ul>
            <li>
                <a href="main.jsp">
                    <img src="./png/home.png" alt="홈버튼" class="nav-icon">
                    <span class="nav-text">홈</span>
                </a>
            </li>
            <li>
                <a href="search.jsp">
                    <img src="./png/search.png" alt="검색버튼" class="nav-icon">
                    <span class="nav-text">검색</span>
                </a>
            </li>
            <li>
                <a href="write.jsp">
                    <img src="./png/add_box.png" alt="만들기 버튼" class="nav-icon">
                    <span class="nav-text">만들기</span>
                </a>
            </li>
            <li>
                <a href="./profile.jsp">
                    <img src="./png/account_box.png" alt="프로필 버튼" class="nav-icon">
                    <span class="nav-text">프로필</span>
                </a>
            </li>
        </ul>
    </div>
</div>
</body>
</html>