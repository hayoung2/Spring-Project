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


@WebServlet("/PostServlet")
public class PostServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    private static final String DB_URL = "jdbc:mysql://localhost:3306/tourmate?useUnicode=true&characterEncoding=UTF-8";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "0000";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html;charset=UTF-8");
    	String count = request.getParameter("count");
        String travel_schedule = request.getParameter("travel_schedule");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
     
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        
        Connection conn = null;
        PreparedStatement ps = null;
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        try {
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
         
            String sql = "INSERT INTO tripposts (username, count, travel_schedule, title, content) VALUES (?, ?, ?, ?, ?)";
            ps = conn.prepareStatement(sql);
            ps.setString(1, username);
            ps.setString(2, count);
            ps.setString(3, travel_schedule);
            ps.setString(4, title);
            ps.setString(5, content);

            ps.executeUpdate();

         
            session.setAttribute("message", "게시글이 성공적으로 작성되었습니다!");

        } catch (Exception e) {
            e.printStackTrace();
       
            session.setAttribute("message", "게시글 작성 중 오류가 발생했습니다.");
        } finally {
            try {
                if (ps != null) ps.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        
        response.sendRedirect("/project/scripts/tripmatePage.jsp");
    }
}