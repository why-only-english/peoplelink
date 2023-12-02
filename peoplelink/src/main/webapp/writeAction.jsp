<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.example.peoplelink.post.PostDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="post" class="com.example.peoplelink.post.Post" scope="page" />
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page import="java.io.File" %>
<jsp:setProperty name="post" property="postTitle" />
<jsp:setProperty name="post" property="postContent" />
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

    //        String realFolder="";
    String saveFolder = "C:\\Users\\gmfd7\\OneDrive\\문서\\instagram_jsp\\peoplelink\\src\\main\\webapp\\upload";
    String encType = "utf-8";
    int maxSize=5*1024*1024;

//        ServletContext context = getServletConfig().getServletContext();
    String realFolder = saveFolder;

    try {
        MultipartRequest multi = null;

        multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());

        // form으로 전달받은 3가지를 가져온다
        String fileName = multi.getFilesystemName("fileName");
        String postTitle = multi.getParameter("postTitle");
        String postContent = multi.getParameter("postContent");
        post.setPostTitle(postTitle);
        post.setPostContent(postContent);

        if (userID == null) {
            PrintWriter script = response.getWriter();
            script.println("<script>");
            script.println("alert('로그인을 하세요.');");
            script.println("location.href = 'login.jsp'");
            script.println("</script>");
        }
        // 로그인이 되어 있을 때
        else {
            // 사용자가 입력 안 한 항목이 있을 때
            if (post.getPostTitle() == null || post.getPostContent() == null) {
                PrintWriter script = response.getWriter();
                script.println("<script>");
                script.println("alert('입력이 안 된 항목이 있습니다.');");
                script.println("history.back()");  // 이전 페이지로 돌려주기
                script.println("</script>");
            }
            else {
                PostDAO postDAO = new PostDAO();
                int result = postDAO.write(post.getPostTitle(), userID, post.getPostContent());
                // 데이터 베이스 오류
                if (result == -1) {
                    PrintWriter script = response.getWriter();
                    script.println("<script>");
                    script.println("alert('글쓰기에 실패했습니다.');");
                    script.println("history.back()");  // 이전 페이지로 돌려주기
                    script.println("</script>");
                }
                // 글 작성 완료 -> 메인 페이지로 이동
                else {
                    PrintWriter script = response.getWriter();
                    if(fileName != null){
//                        File oldFile = new File(realFolder + "\\" + fileName);
//                        File newFile = new File(realFolder + "\\" + (result-1) + "사진.jpg");
                        File oldFile = new File(realFolder + File.separator + fileName);
                        File newFile = new File(realFolder + File.separator + (result - 1) + "사진.jpg");

                        oldFile.renameTo(newFile);
                    }
                    script.println("<script>");
                    script.println("alert('글 작성이 완료되었습니다.');");
                    script.println("location.href = 'main.jsp'");  // 게시판 페이지로 돌려주기
                    script.println("</script>");
                }
                String imageFilePath = realFolder + File.separator + (result - 1) + "사진.jpg";
                request.setAttribute("imageFilePath", imageFilePath);

                System.out.println("Uploaded file name: " + fileName);
                System.out.println("Image file path: " + imageFilePath);
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
    }

%>
</body>
</html>