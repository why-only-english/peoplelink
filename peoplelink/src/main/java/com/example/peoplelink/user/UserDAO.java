package com.example.peoplelink.user;

import com.example.peoplelink.post.Post;

import javax.servlet.annotation.WebServlet;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

    // 데이터베이스에 접근하게 해주는 객체
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    // 실제로 mysql에 접속하게 해주는 부분 == DAO
    public UserDAO() {
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

    public int login(String userID, String userPassword) {
        String SQL1 = "SELECT userPassword FROM USER WHERE userID = ?";
        try {
            pstmt = conn.prepareStatement(SQL1);
            pstmt.setString(1, userID);
            rs= pstmt.executeQuery();  // 결과 담기
            if (rs.next()) {
                if (rs.getString(1).equals(userPassword)) {
                    return 1;  // 로그인 성공
                }
                else
                    return 0;  // 비밀번호 불일치
            }
            return -1;  // 아이디가 없음
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -2;  // 데이터베이스 오류
    }

    public int join(User user) {
        String SQL2 = "INSERT INTO USER VALUES (?,?,?,?)";
        // INSERT 문 일 경우 0보다 큰 값이 나오기 때문에 return 값 -1 일 때만 오류 처리
        try {
            pstmt = conn.prepareStatement(SQL2);
            pstmt.setString(1, user.getUserID());
            pstmt.setString(2, user.getUserPassword());
            pstmt.setString(3, user.getUserNickname());
            pstmt.setString(4, user.getUserEmail());
            return pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return -1;  // 데이터베이스 오류
    }

    public User getUserInfo(String userID) {
        String SQL = "SELECT userNickname FROM USER WHERE userID = ?";
        try {
            pstmt = conn.prepareStatement(SQL);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                User user = new User();
                user.setUserNickname(rs.getString("userNickname"));
                return user;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;  // 데이터베이스 오류 또는 해당 유저 정보가 없을 경우
    }

    // 내가 쓴 글 가져오기
    public List<Post> getUserPosts(String userID) {
        String SQL3 = "SELECT * FROM POST WHERE userID = ?";
        try {
            PreparedStatement pstmt = conn.prepareStatement(SQL3);
            pstmt.setString(1, userID);
            rs = pstmt.executeQuery();
            List<Post> userPosts = new ArrayList<>();
            while (rs.next()) {
                Post post = new Post();
                post.setPostID(rs.getInt(1));
                post.setPostTitle(rs.getString(2));
                post.setUserID(rs.getString(3));
                post.setPostDate(rs.getString(4));
                post.setPostContent(rs.getString(5));
                post.setPostAvailable(rs.getInt(6));
                post.setFileName(rs.getString(7));
                userPosts.add(post);
            }
            return userPosts;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


}
