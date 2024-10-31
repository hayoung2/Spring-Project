package project;

import java.io.IOException;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



@WebServlet("/DeleteCommentServlet")
public class DeleteCommentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int commentId = Integer.parseInt(request.getParameter("commentId"));
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String dbURL = "jdbc:mysql://localhost:3306/tourmate?useUnicode=true&characterEncoding=UTF-8";
            String dbUser = "root";
            String dbPass = "0000";
            java.sql.Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            String query = "DELETE FROM comments WHERE comment_id = ?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setInt(1, commentId);
            pstmt.executeUpdate();

            pstmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect(request.getHeader("referer")); // 댓글이 삭제된 후 이전 페이지로 리다이렉트
    }
}