package project;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddCommentServlet")
public class AddCommentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html;charset=UTF-8");
        String content = request.getParameter("content");
        String username = request.getParameter("username");
        int postId = Integer.parseInt(request.getParameter("post_id"));

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String dbURL = "jdbc:mysql://localhost:3306/tourmate?useUnicode=true&characterEncoding=UTF-8";
            String dbUser = "root";
            String dbPass = "0000";
            Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            String query = "INSERT INTO comments (content, username, post_id) VALUES (?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, content);
            pstmt.setString(2, username);
            pstmt.setInt(3, postId);

            int result = pstmt.executeUpdate();
            
            pstmt.close();
            conn.close();

            if (result > 0) {
                response.sendRedirect(request.getHeader("Referer"));
            } else {
                response.getWriter().write("댓글 작성에 실패했습니다.");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}