<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PLACE 4 YOU - 회원가입</title>
    <style>
        /* 스타일은 그대로 유지 */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('your-background-image.jpg');
            background-size: cover;
            background-position: center;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
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
        .subtitle {
            font-size: 2em;
            color: #333;
            margin-bottom: 20px;
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
        .form-group {
            margin-bottom: 15px;
            text-align: center;
        }
        .form-group label {
            font-size: 1em;
            color: #333;
        }
        .form-group input {
            width: 400px;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 1em;
        }
        .signup-button {
            display: block;
            margin: 20px auto;
            padding: 10px 20px;
            background-color: #333;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 1.1em;
            cursor: pointer;
            width: 400px;
        }
        .signup-button:hover {
            background-color: #555;
        }
        .error-message {
            color: red;
            font-size: 1em;
            margin-top: 10px;
        }
        .login-link {
            margin-top: 20px;
            font-size: 1em;
        }
        .login-link a {
            color: #333;
            text-decoration: none;
        }
        .login-link a:hover {
            text-decoration: underline;
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
        </div>
        <div class="subtitle">회원가입</div>
        <!-- 회원가입 폼 -->
        <form action="signup_process.jsp" method="POST">
            <!-- 아이디 입력 -->
            <div class="form-group">
                <label for="id"><b>아이디</b></label>
                <input type="text" id="id" name="id" required placeholder="아이디를 입력하세요">
            </div><br>

            <!-- 비밀번호 입력 -->
            <div class="form-group">
                <label for="password"><b>비밀번호</b></label>
                <input type="password" id="password" name="password" required placeholder="비밀번호를 입력하세요">
            </div><br>

            <!-- 비밀번호 확인 입력 -->
            <div class="form-group">
                <label for="passwordConfirm"><b>비밀번호 확인</b></label>
                <input type="password" id="passwordConfirm" name="passwordConfirm" required placeholder="비밀번호를 다시 입력하세요">
            </div><br>

            <!-- 이메일 입력 -->
            <div class="form-group">
                <label for="name"><b>이메일</b></label>
                <input type="text" id="email" name="email" required placeholder="이메일을 입력하세요">
            </div><br>

            <!-- 회원가입 버튼 -->
            <button type="submit" class="signup-button">회원가입</button>
        </form>

        <!-- 오류 메시지 표시 -->
        <c:if test="${not empty errorMessage}">
            <div class="error-message">${errorMessage}</div>
        </c:if>

        <!-- 로그인 링크 -->
        <div class="login-link">
            <p><a href="login.jsp">아이디, 비밀번호 찾기</a></p>
        </div>
    </div>
</body>
</html>
