package com.example.peoplelink.post;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class PostDAO {

    private Connection conn;
    private ResultSet rs;

    public PostDAO() {
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

    // 글 작성 시 현재 시간
    public String getDate() {
        String SQL3 = "SELECT NOW()";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL3);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getString(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";  // 데이터베이스 오류
    }

    public int getNext() {
        // 가장 마지막에 쓰인 글 가져오는 쿼리
        String SQL4 = "SELECT postID FROM POST ORDER BY postID DESC";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL4);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) + 1;
            }
            return 1; // 첫 번째 게시물인 경우
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;  // 데이터베이스 오류
    }

    public int write(String postTitle, String userID, String postContent) {
        String SQL5 = "INSERT INTO POST VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL5);
            pstmt.setInt(1, getNext());
            pstmt.setString(2, postTitle);
            pstmt.setString(3, userID);
            pstmt.setString(4, getDate());
            pstmt.setString(5, postContent);
            pstmt.setInt(6, 1);  // available 최초엔 1
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;  // 데이터베이스 오류
    }

    public ArrayList<Post> getList(int pageNumber) {
        String SQL6 = "SELECT * FROM POST WHERE postID < ? AND postAvailable = 1 ORDER BY postID DESC LIMIT 10";
        ArrayList<Post> list = new ArrayList<>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL6);
            pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Post post = new Post();
                post.setPostID(rs.getInt(1));
                post.setPostTitle(rs.getString(2));
                post.setUserID(rs.getString(3));
                post.setPostDate(rs.getString(4));
                post.setPostContent(rs.getString(5));
                post.setPostAvailable(rs.getInt(6));
                list.add(post);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // 페이징 처리
    public boolean nextPage(int pageNumber) {
        String SQL7 = "SELECT * FROM POST WHERE postID < ? AND postAvailable = 1";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL7);
            pstmt.setInt(1, getNext() - (pageNumber - 1) * 10);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    // 게시글 보기
    public Post getPost(int postID) {
        String SQL8 = "SELECT * FROM POST WHERE postID = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL8);
            pstmt.setInt(1, postID);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                Post post = new Post();
                post.setPostID(rs.getInt(1));
                post.setPostTitle(rs.getString(2));
                post.setUserID(rs.getString(3));
                post.setPostDate(rs.getString(4));
                post.setPostContent(rs.getString(5));
                post.setPostAvailable(rs.getInt(6));
                return post;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // 게시글 수정
    public int update(int postID, String postTitle, String postContent) {
        String SQL9 = "UPDATE POST SET postTitle = ?, postContent = ? WHERE postID = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL9);
            pstmt.setString(1, postTitle);
            pstmt.setString(2, postContent);
            pstmt.setInt(3, postID);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;  // 데이터베이스 오류
    }

    public int delete(int postID) {
        String SQL10 = "UPDATE POST SET postAvailable = 0 WHERE postID = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL10);
            pstmt.setInt(1, postID);
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;  // 데이터베이스 오류
    }

    // 검색된 게시글 가져오기
    public ArrayList<Post> searchList(String postTitle, int pageNumber) {
        String SQL11 = "SELECT * FROM POST WHERE postTitle LIKE ? AND postAvailable = 1 ORDER BY postID DESC LIMIT 10";
        ArrayList<Post> list = new ArrayList<>();
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL11);
            pstmt.setString(1, "%" + postTitle + "%");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Post post = new Post();
                post.setPostID(rs.getInt(1));
                post.setPostTitle(rs.getString(2));
                post.setUserID(rs.getString(3));
                post.setPostDate(rs.getString(4));
                post.setPostContent(rs.getString(5));
                post.setPostAvailable(rs.getInt(6));
                list.add(post);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

}