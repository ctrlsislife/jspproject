<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Place 4 You - 마이페이지</title>
    <style>
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
        .subtitle {
        	position: absolute;
            font-size: 1.5em;
            color: #333;
            margin-top: 0; /* 제목 위에 불필요한 여백 제거 */
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
        .user-info {
            margin-top: 30px;
            font-size: 1.2em;
            color: #666;
        }
        .user-info p {
            margin: 10px 0;
        }
        .user-info a {
            display: inline-block;
            padding: 10px 20px;
            background-color: #333;
            color: #fff;
            border-radius: 5px;
            text-decoration: none;
            margin-top: 20px;
        }
        .user-info a:hover {
            background-color: #555;
        }
        .logout-button {
            display: inline-block;
            padding: 10px 20px;
            background-color: #d9534f;
            color: #fff;
            border-radius: 5px;
            text-decoration: none;
            margin-top: 20px;
        }
        .logout-button:hover {
            background-color: #c9302c;
        }
    </style>
</head>
<body>
    <div class="container">
    	 <div class="title"><a href="main.jsp">PLACE 4 YOU</a></div><br><br>
        <div class="subtitle"><b>마이페이지</b></div>
        <div class="nav-links">
            <a href="howtouse.jsp">How to use</a>
            <a href="signup.jsp">Signup</a>
            <a href="mypage.jsp">My Page</a>
            <a href="login.jsp">Login</a>
        </div>

        <!-- 사용자 정보 표시 -->
        <div class="user-info">
            <p><strong>이름:</strong> ${user.name}</p>
            <p><strong>이메일:</strong> ${user.email}</p>
            <p><strong>가입일:</strong> ${user.registrationDate}</p>

            <!-- 프로필 수정 및 로그아웃 -->
            <a href="editProfile.jsp">프로필 수정</a>
            <a href="logout.jsp" class="logout-button">로그아웃</a>
        </div>
    </div>
</body>
</html>
