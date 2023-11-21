<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="com.example.peoplelink.post.Post" %>
<%@ page import="com.example.peoplelink.post.PostDAO" %>
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
        // 사용자가 게시글 제목 클릭 시 postID에 해당 값 담김
        int postID = 0;
        if (request.getParameter("postID") != null) {
            postID = Integer.parseInt(request.getParameter("postID"));
        }
        if (postID == 0) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('유효하지 않은 글입니다.');");
            script.println("location.href = 'bbs.jsp'");
            script.println("</script>");
        }
        Post post = new PostDAO().getPost(postID);
    %>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-controls="bs-example-navbar-collapse-1" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <a class="navbar-brand" href="index.jsp">PeopleLink</a>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="navbar-nav">
                <li class="nav-item"><a class="nav-link" href="index.jsp">메인</a></li>
                <li class="nav-item active"><a class="nav-link" href="bbs.jsp">게시판</a></li>
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
    <div class="container">
        <div class="row">
            <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
                <thead>
                <tr>
                    <th colspan="3" style="background-color: #eeeeee; text-align: center;">게시판 글 보기</th>
                </tr>
                </thead>
                <tbody>
                    <tr>
                        <td style="width: 20%;">글 제목</td>
                        <td colspan="2"><%= post.getPostTitle() %></td>
                    </tr>
                    <tr>
                        <td>작성자</td>
                        <td colspan="2"><%= post.getUserID() %></td>
                    </tr>
                    <tr>
                        <td>내용</td>
                        <td colspan="2" style="min-height: 200px; text-align: left" ><%= post.getPostContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></td>
                    </tr>
                </tbody>
            </table>
            <a href="bbs.jsp" class="btn btn-primary">목록</a>
            <%
                if (userID != null && userID.equals(post.getUserID())) {
            %>
                    <a href="update.jsp?postID=<%= postID %>" class="btn btn-primary">수정</a>
                    <a onclick="return confirm('게시글을 삭제하시겠어요?')" href="deleteAction.jsp?postID=<%= postID %>" class="btn btn-primary">삭제</a>
            <%
                }
            %>
        </div>
    </div>
    <%--    <script src="js/jquery-3.7.1.min.map"></script>--%>
    <%--    <link rel="stylesheet" href="css/bootstrap.css">--%>
    <%--    <script src="js/bootstrap.js"></script>--%>
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</body>
</html>