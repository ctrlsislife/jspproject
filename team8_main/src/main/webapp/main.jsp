<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.ArrayList, java.util.List" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Place 4 You</title>
    <style>
        /* 스타일은 그대로 유지 */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: 100%;
            background-image: url('your-background-image.jpg');
            background-size: cover;
            background-position: center;
        }
        .container {
            text-align: center;
            background-color: rgba(255, 255, 255, 0.8);
            padding: 30px;
            border-radius: 10px;
            max-width: 100%;
            width: 100%;
        }
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
        .nav-links {
            position: absolute;
            top: 10px;
            right: 20px;
            font-size: 1em;
            color: #333;
        }
        .nav-links a {
            color: #333;
            text-decoration: none;
            margin-left: 10px;
        }
        .search-label {
            font-size: 1.2em;
            color: #666;
            margin-top: 60px;
        }
        .search-input {
            width: 500px;
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 1em;
        }
        .search-button {
            padding: 10px 20px;
            background-color: #333;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 1em;
            cursor: pointer;
        }
        .search-button:hover {
            background-color: #555;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="title"><a href="main.jsp">PLACE 4 YOU</a></div>
        <div class="nav-links">
            <a href="howtouse.jsp">How to use</a>
            <a href="signup.jsp">Signup</a>
            <a href="mypage.jsp">My Page</a>
            <a href="login.jsp">Login</a>
        </div><br><br><br>
        <p class="search-label">숨은 명소를 찾아보세요!</p>
        <form action="search2.jsp" method="GET">
            <div class="form-group">
                <label for="region">지역 선택:</label>
                <select name="region_name" id="region" onchange="updateCities()">
                    <option value="">-- 지역을 선택하세요 --</option>
                    <option value="서울">서울</option>
                    <option value="경기">경기/인천</option>
                    <option value="강원">강원</option>
                    <option value="충청">충청/대전</option>
                    <option value="전라">전라/광주</option>
                    <option value="경남">경남/부산</option>
                    <option value="경북">경북/울산/대구</option>
                    <option value="제주">제주</option>
                </select>
            </div><br>
            <div class="form-group">
                <label for="city">시 선택:</label>
                <select name="city_name" id="city">
                    <option value="">-- 시를 선택하세요 --</option>
                </select>
            </div><br>
            <button type="submit" class="search-button">탐색 시작</button>
        </form>
    </div>

    <script>
        // 지역별 시 목록
        const cities = {
            '서울': ['강남구', '종로구', '서초구', '송파구', '마포구'],
            '경기': ['수원', '고양', '성남', '안양', '용인', '부천', '인천'],
            '강원': ['춘천', '강릉', '원주', '속초', '동해'],
            '충청': ['대전', '세종', '청주', '천안', '공주'],
            '전라': ['광주', '전주', '순천', '여수', '목포'],
            '경남': ['부산', '창원', '김해', '양산', '진주'],
            '경북': ['대구', '울산', '경산', '포항', '김천'],
            '제주': ['제주', '서귀포']
        };

        // 지역이 선택되면 해당 시 목록 업데이트
        function updateCities() {
            const region = document.getElementById("region").value;
            const citySelect = document.getElementById("city");

            // 시 선택 박스 초기화
            citySelect.innerHTML = '<option value="">-- 시를 선택하세요 --</option>';

            // 지역이 선택되지 않으면 종료
            if (!region) return;

            // 해당 지역에 맞는 시 목록 추가
            const selectedCities = cities[region] || [];
            selectedCities.forEach(function(city) {
                const option = document.createElement("option");
                option.value = city;
                option.textContent = city;
                citySelect.appendChild(option);
            });
        }
    </script>
</body>
</html>
