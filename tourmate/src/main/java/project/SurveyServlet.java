package project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/SurveyServlet")
public class SurveyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
   
    private static final String DB_URL = "jdbc:mysql://localhost:3306/tourmate?useUnicode=true&characterEncoding=UTF-8";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "0000";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	 request.setCharacterEncoding("UTF-8");
    	response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        
        String tmp="ddd";
        java.sql.Connection conn = null;
        PreparedStatement pstmt = null;
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
       
        try {
          
        	Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
            out.println("<p>"+tmp+"</p>");
            
            if (conn != null) {
            	
            	tmp+="데이터베이스 연결 성공";
            	out.println("<p>"+tmp+"</p>");
                
           
                String sql = "INSERT INTO users (username, password, nickname, gender, age, mbti, introduction) VALUES (?, ?, ?, ?, ?, ?, ?)";
                pstmt = conn.prepareStatement(sql);
           
                pstmt.setString(1, request.getParameter("username"));
                pstmt.setString(2, request.getParameter("password"));
                pstmt.setString(3, request.getParameter("nickname"));
                pstmt.setString(4, request.getParameter("gender"));
                pstmt.setString(5, request.getParameter("age"));
                
                String mbti = request.getParameter("mbti1") + request.getParameter("mbti2") + request.getParameter("mbti3") + request.getParameter("mbti4");
                pstmt.setString(6, mbti);
                pstmt.setString(7, request.getParameter("comments"));
                
               
                int rowsAffected = pstmt.executeUpdate();
                
                response.setCharacterEncoding("UTF-8");
                response.setContentType("text/html;charset=UTF-8");
                if (rowsAffected > 0) {
                    response.getWriter().print("<script>alert('Tourmate 회원가입 완료');</script>");                   
                    response.sendRedirect("/project/scripts/login.jsp");
                 
                } else {
                	tmp+="회원가입에 실패했습니다. 여긴 좋아 ";
                	out.println("<p>"+tmp+"</p>");;
                }
            } else {
            	tmp+="연결이안됨";
                out.println("<p>데이터베이스 연결 실패</p>");
                out.println("<p>"+tmp+"</p>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<p>회원가입에 실패했습니다. 오류나서 싟ㄹ패 </p>");
            out.println("<p>"+tmp+"</p>");
        } catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
            try {
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            out.close();
        }
    }
}





