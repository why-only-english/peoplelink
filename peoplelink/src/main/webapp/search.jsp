<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>PeopleLink</title>

</head>
<body>
  <%
  %>
  <div class="container" align="center">
    <div class="col-lg-4"></div>
    <div class="col-lg-4">
      <div class="jumbotron" style="padding-top: 20px;">
        <h3><br>제목 검색</h3>
        <form name="c_search">
          <input type="text" id="search">
          <input type="button" onclick="send()" value="검색">
        </form>
      </div>
    </div>
    <div class="col-lg-4"></div>
  </div>
</body>
<script>
  function send(){
    var search = document.c_search.search.value;
    var url = "searchBbs.jsp?search=" + search;
    window.location.href = url;
  }
</script>
</html>