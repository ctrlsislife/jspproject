<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // POST 요청 시 폼 데이터 받기
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String u_name = request.getParameter("id");
        String u_passwd = request.getParameter("password");
        String u_email = request.getParameter("email");
        
    if (u_name == null || u_name.isEmpty()) {
            out.println("<h3>아이디를 입력해 주세요.</h3>");
            return;
        }
    if (u_passwd == null || u_passwd.isEmpty()) {
            out.println("<h3>이메일을 입력해 주세요.</h3>");
            return;
        }
    if (u_email == null || u_email.isEmpty()) {
        out.println("<h3>이메일을 입력해 주세요.</h3>");
        return;
    }
        // 데이터베이스 연결 (JDBC)
        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            // 데이터베이스 연결
            Class.forName("org.mariadb.jdbc.Driver");
            String url = "jdbc:mariadb://gwedu.org:3306/team8";
            String username = "team8";
            String password = "a1234";

            conn = DriverManager.getConnection(url, username, password);

            // SQL 쿼리
            String sql = "INSERT INTO user_index (username, passwd, email) VALUES (?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, u_name);
            stmt.setString(2, u_passwd);
            stmt.setString(3, u_email);

            // 쿼리 실행
            int result = stmt.executeUpdate();
            
            if (result > 0) {
%>
            <h3>회원가입 성공!</h3>
            <p>회원가입이 완료되었습니다. 로그인 페이지로 이동하려면 아래 버튼을 클릭하세요.</p>
            <form action="login.jsp">
                <button type="submit">로그인 페이지로 이동</button>
            </form>
<%
            } else {
                out.println("<h3>회원가입 실패!</h3>");
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<h3>오류가 발생했습니다: " + e.getMessage() + "</h3>");
        } finally {
            // 자원 해제
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>
