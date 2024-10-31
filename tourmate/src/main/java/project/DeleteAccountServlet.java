package project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/DeleteAccountServlet")
public class DeleteAccountServlet extends HttpServlet {
    
    private static final String DB_URL = "jdbc:mysql://localhost:3306/tourmate?useUnicode=true&characterEncoding=UTF-8";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "0000";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        if (username != null && !username.isEmpty()) {
            Connection conn = null;
            PreparedStatement pstmt = null;
            try {
                
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                
                
                String deleteQuery = "DELETE FROM users WHERE username = ?";
                pstmt = conn.prepareStatement(deleteQuery);
                pstmt.setString(1, username);
                pstmt.executeUpdate();
                
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                } catch (SQLException se) {
                    se.printStackTrace();
                }
            }

           
            session.invalidate();
        }

        response.sendRedirect("/project/scripts/login.jsp"); 
    }
}