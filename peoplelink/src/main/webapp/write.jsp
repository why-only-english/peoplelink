<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>PeopleLink</title>
    <link rel="stylesheet" href="./css/write.css">

</head>
<body>
<%
    String userID = null;
    if (session.getAttribute("userID") != null) {
        userID = (String) session.getAttribute("userID");
    }
%>

<%--<div class="container">--%>
<%--    <div class="row">--%>
<%--        <form method="post" action="writeAction.jsp">--%>
<%--            <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">--%>
<%--                <thead>--%>
<%--                <tr>--%>
<%--                    <th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글쓰기</th>--%>
<%--                </tr>--%>
<%--                </thead>--%>
<%--                <tbody>--%>
<%--                <tr>--%>
<%--                    <td><input type="text" class="form-control" placeholder="글 제목" name="postTitle" maxlength="50"></td>--%>
<%--                </tr>--%>
<%--                <tr>--%>
<%--                    <td><textarea class="form-control" placeholder="글 내용" name="postContent" maxlength="2048"--%>
<%--                                  style="height: 350px;"></textarea></td>--%>
<%--                </tr>--%>
<%--                </tbody>--%>
<%--            </table>--%>
<%--            <input type="submit" class="btn btn-primary pull-right" value="글 작성">--%>
<%--        </form>--%>
<%--    </div>--%>
<%--</div>--%>
<div id="createContainer">
    <form method="post" action="writeAction.jsp">
        <h1 class="title">새 게시물 만들기</h1>
        <input type="submit" class="share-btn" value="공유">
        <div class="input-container">
            <div class="img-input">
                <input type="file" accept="image/*"/>
            </div>
            <div>
                <div class="title-input">
                    <input type="text" name="postTitle" placeholder="제목을 입력하세요"/>
                </div>
                <div class="text-input">
                    <input type="text" name="postContent" placeholder="게시글 내용을 입력하세요"/>
                </div>
            </div>
        </div>
    </form>
</div>
</body>
</html>