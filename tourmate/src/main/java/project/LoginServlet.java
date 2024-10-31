package project;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // DB 연결 정보
    private static final String DB_URL = "jdbc:mysql://localhost:3306/tourmate?useUnicode=true&characterEncoding=UTF-8";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "0000";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
           
        	Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS);
            
  
            String sql = "SELECT * FROM users WHERE username = ? AND password = ?";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            
      
            pstmt.setString(1, request.getParameter("username"));
            pstmt.setString(2, request.getParameter("password"));
            
         
            ResultSet rs = pstmt.executeQuery();

            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html;charset=UTF-8");
            if(rs.next()) {
          
                HttpSession session = request.getSession();
                session.setAttribute("username", rs.getString("username"));
                session.setAttribute("nickname", rs.getString("nickname"));
                response.getWriter().print("<script>alert('로그인 되었습니다!'); location.href='/project/scripts/home.jsp';</script>");
            } else {
                response.getWriter().print("<script>alert('아이디 또는 비밀번호가 틀립니다.'); history.back();</script>");
            }

     
            rs.close();
            pstmt.close();
            conn.close();

        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
			// TODO 자동 생성된 catch 블록
			e.printStackTrace();
		}
    }
}