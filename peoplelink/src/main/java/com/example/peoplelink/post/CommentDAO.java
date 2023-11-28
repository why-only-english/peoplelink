package com.example.peoplelink.post;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class CommentDAO {

    // 기존 코드와 동일한 DB 연결 및 기능
    private Connection conn;
    private ResultSet rs;
    public CommentDAO() {
        try {
            String dbURL = "jdbc:mysql://localhost:3306/PL";
            String dbID = "root";
            String dbPassword = "1234";
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public int writeComment(int postID, String userID, String content) {
        String SQL = "INSERT INTO Comment (postID, userID, Content) VALUES (?, ?, ?)";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, postID);
            pstmt.setString(2, userID);
            pstmt.setString(3, content);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;  // 데이터베이스 오류
    }


    public int deleteComment(int commentID) {
        String SQL = "DELETE FROM Comment WHERE CommentID = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, commentID);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;  // 데이터베이스 오류
    }

    public ArrayList<Comment> getComments(int postID) {
        String SQL = "SELECT * FROM Comment WHERE postID = ?";
        ArrayList<Comment> comments = new ArrayList<>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            pstmt.setInt(1, postID);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Comment comment = new Comment();
                comment.setCommentID(rs.getInt("CommentID"));
                comment.setPostID(rs.getInt("postID"));
                comment.setUserID(rs.getString("userID"));
                comment.setContent(rs.getString("Content"));
                comments.add(comment);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return comments;
    }
    // 다른 필요한 댓글 관련 메서드들도 추가할 수 있습니다.
}
