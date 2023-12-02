package com.example.peoplelink.post;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CommentDAO {

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

    public void close() {
        try {
            if (rs != null) rs.close();
            if (conn != null) conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void connect() {
        // Connection 연결 등
    }

    public int getNextCommentID() {
        String SQL = "SELECT CommentID FROM Comment ORDER BY CommentID DESC";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) + 1;
            }
            return 1; // 첫 번째 댓글인 경우
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;  // 데이터베이스 오류
    }

    public void insertComment(int postID, String userID, String content) {
        try {
            connect();
            String SQL = "INSERT INTO Comment (CommentID, postID, userID, Content) VALUES (?, ?, ?, ?)";
            try (PreparedStatement pstmt = conn.prepareStatement(SQL)) {
                pstmt.setInt(1, getNextCommentID()); // CommentID 설정
                pstmt.setInt(2, postID);
                pstmt.setString(3, userID);
                pstmt.setString(4, content);

                pstmt.executeUpdate();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }
    }

    public List<Comment> getComments(int postID) {
        List<Comment> comments = new ArrayList<>();

        try {
            connect();
            String SQL = "SELECT * FROM Comment WHERE postID = ?";
            try (PreparedStatement pstmt = conn.prepareStatement(SQL)) {
                pstmt.setInt(1, postID);
                try (ResultSet resultSet = pstmt.executeQuery()) {
                    while (resultSet.next()) {
                        Comment comment = new Comment();
                        comment.setCommentID(resultSet.getInt("CommentID"));
                        comment.setPostID(postID);
                        comment.setUserID(resultSet.getString("UserID"));
                        comment.setCommentContent(resultSet.getString("Content"));

                        comments.add(comment);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            close();
        }

        return comments;
    }

    // 추가적인 메서드 및 기능들을 필요에 따라 구현해주세요.
}
