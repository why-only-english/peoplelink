<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.example.peoplelink.post.PostDAO" %>
<%@ page import="com.example.peoplelink.post.Post" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>PeopleLink</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">

    <style type="text/css">
        a, a:hover {
            color : #000000;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <%
        String userID = null;
        if (session.getAttribute("userID") != null) {
            userID = (String) session.getAttribute("userID");
        }
        int pageNumber = 1;
        if (request.getParameter("pageNumber") != null) {
            pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
        }
    %>

    <div class="container">
        <div class="row">
            <table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
                <thead>
                    <tr>
                        <th style="background-color: #eeeeee; text-align: center;">번호</th>
                        <th style="background-color: #eeeeee; text-align: center;">제목</th>
                        <th style="background-color: #eeeeee; text-align: center;">작성자</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        PostDAO postDAO = new PostDAO();
                        ArrayList<Post> list = postDAO.getList(pageNumber);
                        for (int i = 0; i < list.size(); i++) {
                    %>
                    <tr>
                        <td><%= list.get(i).getPostID() %></td>
                        <td><a href="view.jsp?postID=<%= list.get(i).getPostID() %>"><%= list.get(i).getPostTitle() %></a></td>
                        <td><%= list.get(i).getUserID() %></td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            <%
                if (pageNumber != 1) {
            %>
                <a href="bbs.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn-success btn-arrow-left">이전</a>
            <%
                } if (postDAO.nextPage(pageNumber + 1)) {
            %>
                <a href="bbs.jsp?pageNumber=<%=pageNumber + 1%>" class="btn btn-success btn-arrow-left">다음</a>
            <%
                }
            %>
            <a href="write.jsp" class="btn btn-primary pull-right">글 작성</a>
        </div>
    </div>

</body>
</html>