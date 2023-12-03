package com.example.peoplelink.tags;

import javax.servlet.jsp.tagext.SimpleTagSupport;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import java.io.IOException;
import java.util.ArrayList;
import com.example.peoplelink.post.Comment;
import com.example.peoplelink.post.CommentDAO;

public class CommentListTag extends SimpleTagSupport {
    private Integer postID;
    private String userID;

    public void setPostID(Integer postID) {
        this.postID = postID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }

    @Override
    public void doTag() throws JspException, IOException {
        CommentDAO commentDAO = new CommentDAO();
        ArrayList<Comment> comments = (ArrayList<Comment>) commentDAO.getComments(postID);
        JspWriter out = getJspContext().getOut();

        out.println("<ul>");
        for (Comment comment : comments) {
            out.println("<li>" + comment.getUserID() + " : " + comment.getCommentContent());
            if (userID != null && userID.equals(comment.getUserID())) {
                out.println("<a style='color: red; text-decoration: none;' onclick='return confirm(\"댓글을 삭제하시겠어요?\")' href='deleteComment.jsp?commentID=" + comment.getCommentID() + "'>삭제</a>");
            }
            out.println("</li>");
        }
        out.println("</ul>");
    }
}
