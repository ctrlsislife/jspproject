<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.ArrayList, java.util.List" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Place 4 You - 검색 결과</title>
</head>
<body>
    <div class="container">
        <h2>검색 결과</h2>
        <%
            // 지역과 시 값을 받아오기
            String regionQuery = request.getParameter("city_name");  // 지역

            // DB 연결 정보
            String driverName = "org.mariadb.jdbc.Driver";
            String url = "jdbc:mariadb://gwedu.org:3306/team8";
            String username = "team8";
            String password = "a1234";
            Connection conn = null;
            PreparedStatement stmt = null;
            ResultSet rs = null;

            // 검색어가 빈 값이 아니라면 쿼리 실행
            if ((regionQuery != null && !regionQuery.trim().isEmpty())) {
                List<String> results = new ArrayList<>();
                
                try {
                    // DB 연결
                    conn = DriverManager.getConnection(url, username, password);
                    
                    // 쿼리 작성
                    String sql = "SELECT r.* FROM recommendations r " +
                                 "JOIN region_index rg ON r.region_id = rg.region_id " +
                                 "WHERE rg.region_name LIKE ?";
                    stmt = conn.prepareStatement(sql);
                    stmt.setString(1, "%" + regionQuery.trim() + "%");  // 지역명 검색
                    
                    // 쿼리 실행
                    rs = stmt.executeQuery();
                    
                    // 결과 처리
                    while (rs.next()) {
                        String r_name = rs.getString("a_name");
                        String reg_id = rs.getString("region_id");
                        results.add("Name: " + r_name + " | Region: " + reg_id);
                    }
                    
                    // 결과 출력
                    if (!results.isEmpty()) {
                        for (String result : results) {
            %>
                            <div class="result-item">
                                <p><%= result %></p>
                            </div>
            <%
                        }
                    } else {
            %>
                        <div class="error-message">검색 결과가 없습니다.</div>
            <%
                    }
                } catch (SQLException e) {
                    out.println("<div class='error-message'>검색 중 오류가 발생했습니다.</div>");
                    e.printStackTrace();  // 에러 로그 출력
                } finally {
                    try {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            } else {
                out.println("<div class='error-message'>지역과 시를 모두 선택하세요.</div>");
            }
        %>
    </div>
</body>
</html>
