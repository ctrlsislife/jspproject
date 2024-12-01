import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.sql.*;

public class signupServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("id");
        String passwd = request.getParameter("password");
        String passwordConfirm = request.getParameter("passwordConfirm");
        String name = request.getParameter("name");

        String errorMessage = null;

        // 비밀번호 확인
        if (!passwd.equals(passwordConfirm)) {
            errorMessage = "비밀번호가 일치하지 않습니다.";
        }

        if (errorMessage == null) {
            // JDBC 연결
        	String url = "jdbc:mariadb://gwedu.org:3306/team8";
            String username = "team8";
            String password = "a1234";

            try (Connection conn = DriverManager.getConnection(url, username, password)) {
                String query = "INSERT INTO user_index (username, passwd, email) VALUES (?, ?, ?)";
                try (PreparedStatement stmt = conn.prepareStatement(query)) {
                    stmt.setString(1, userId);
                    stmt.setString(2, password); // 비밀번호는 해싱해서 저장하는 것이 좋습니다.
                    stmt.setString(3, name); // 이메일은 나중에 추가할 수 있습니다.

                    int result = stmt.executeUpdate();

                    if (result > 0) {
                        response.sendRedirect("login.jsp");
                    } else {
                        errorMessage = "회원가입에 실패했습니다. 다시 시도해주세요.";
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
                errorMessage = "DB 연결 오류가 발생했습니다.";
            }
        }

        if (errorMessage != null) {
            request.setAttribute("errorMessage", errorMessage);
            request.getRequestDispatcher("/signup.jsp").forward(request, response);
        }
    }
}
