<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.ArrayList, java.util.List" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PLACE 4 YOU - 검색 결과</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('your-background-image.jpg'); /* 배경 이미지 */
            background-size: cover;
            background-position: center;
            height: 100vh; /* 전체 화면을 꽉 채움 */
            display: flex;
            justify-content: center;
            align-items: flex-start; /* 상단에 배치 */
        }

        .container {
            text-align: center;
            background-color: rgba(255, 255, 255, 0.8);
            padding: 30px;
            border-radius: 10px;
            max-width: 100%;
            width: 100%;
            margin-top: 50px; /* 상단 여백 */
        }

        /* 타이틀 영역 */
        .title {
            position: absolute;
            top: 20px;
            left: 20px;
            font-size: 2em;
            color: #333;
        }
        .title a {
            color: #333;
            text-decoration: none;
            margin-left: 10px;
        }

        /* 네비게이션 링크 */
        .nav-links {
            position: absolute;
            top: 10px;
            right: 50px;
            font-size: 1em;
            color: #333;
        }
        .nav-links a {
            color: #333;
            text-decoration: none;
            margin-left: 10px;
        }

        /* 검색창 */
        .search-bar {
            margin-bottom: 30px;
        }
        .search-bar input {
            width: 300px;
            padding: 10px;
            font-size: 1em;
            border-radius: 5px;
            border: 1px solid #ccc;
        }

        .search-bar button {
            padding: 10px 20px;
            background-color: #333;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 1em;
            cursor: pointer;
        }
        .search-bar button:hover {
            background-color: #555;
        }

        /* 검색 결과 */
        .search-results {
            margin-top: 30px;
            text-align: left;
            width: 100%;
        }

        .result-item {
            background-color: #fff;
            border-radius: 5px;
            padding: 15px;
            margin: 10px 0;
            box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.1);
        }

        .result-item a {
            color: #333;
            text-decoration: none;
        }

        .result-item a:hover {
            text-decoration: underline;
        }

        /* 오류 메시지 */
        .error-message {
            color: red;
            font-size: 1em;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="title"><a href="main.jsp">PLACE 4 YOU</a></div>
    <div class="nav-links">
        <a href="howtouse.jsp">How to use</a>
        <a href="signup.jsp">Signup</a>
        <a href="mypage.jsp">My Page</a>
        <a href="login.jsp">Login</a>
    </div>

    <!-- 검색 창과 결과 표시 -->
<!--         <div class="search-bar">
            검색 입력폼
            <form action="searchServlet" method="GET">
                <input type="text" name="search" placeholder="검색어를 입력하세요" required>
                <button type="submit">검색</button>
            </form>
        </div> -->

        <!-- 검색 결과 리스트 -->
<%
	   		String regionName = request.getParameter("region_name");
    		String cityName = request.getParameter("city_name");

		    if ((regionName == null || regionName.trim().isEmpty()) || 
        		(cityName == null || cityName.trim().isEmpty())) {
%>
        <div class="container">
            <p class="error-message">지역과 시를 모두 선택해 주세요.</p>
            <a href="main.jsp" class="back-link">뒤로 가기</a>
        </div>
<%
    		} else {
        // 데이터베이스 연결
        	Connection conn = null;
        	PreparedStatement stmt = null;
        	ResultSet rs = null;
        	String query = "SELECT region_index.region_name, region_index.region_location, category.category_name, region_index.latitude, region_index.longtitude " +
             	          "FROM region_index " +
                	       "JOIN category ON region_index.region_name = category.region_name " +
                    	   "WHERE region_index.region_name = ? AND category.category_name = ?";

                    try {
                        // DB 연결
                        String driverName="org.mariadb.jdbc.Driver";
						String url = "jdbc:mariadb://gwedu.org:3306/team8";
						String username = "team8";
						String password = "a1234";

					    Class.forName(driverName);
  						conn = DriverManager.getConnection(url, username, password);

                        // 쿼리 작성
                        stmt = conn.prepareStatement(query);
           				stmt.setString(1, regionName);
         				stmt.setString(2, cityName);

            rs = stmt.executeQuery();

            if (!rs.next()) {
%>
                <div class="container">
                    <p class="error-message">검색 결과가 없습니다.</p>
                    <a href="main.jsp" class="back-link">뒤로 가기</a>
                </div>
<%
            } else {
                // 결과 출력
                List<String> results = new ArrayList<>();
                do {
                    String region = rs.getString("region_name");
                    String location = rs.getString("region_location1");
                    String location2 = rs.getString("region_location2");
                    String category = rs.getString("category_name");
                    double latitude = rs.getDouble("latitude");
                    double longitude = rs.getDouble("longtitude");

                    String result = "지역: " + region + ", 위치: " + location + location2 + ", 카테고리: " + category + 
                                    ", 위도: " + latitude + ", 경도: " + longitude;
                    results.add(result);
                } while (rs.next());
%>
                <div class="container">
                    <div class="title">검색 결과</div>
                    <div class="search-results">
                        <% for (String result : results) { %>
                            <div class="result-item"><%= result %></div>
                        <% } %>
                    </div>
                    <a href="main.jsp" class="back-link">뒤로 가기</a>
                </div>
<%
            }
        } catch (SQLException e) {
            e.printStackTrace();
%>
            <div class="container">
                <p class="error-message">오류가 발생했습니다. 잠시 후 다시 시도해 주세요.</p>
                <a href="main.jsp" class="back-link">뒤로 가기</a>
            </div>
<%
        } finally {
            // DB 연결 종료
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
%>

</body>
</html>