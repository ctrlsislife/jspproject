<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PLACE 4 YOU - 로그인</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('your-background-image.jpg'); /* 배경 이미지 */
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
        .subtitle {
            font-size: 2em;
            color: #333;
            margin-bottom: 20px;
        }
        .form-gruop{
            margin-bottom: 15px;
            text-align: left;
        }
        .form-group label {
            font-size: 1em;
            color: #333;
        }
        .form-group input {
            width: 300px;
            padding: 10px;
            margin-top: 5px;
            border-radius: 5px;
            border: 1px solid #ccc;
            font-size: 1em;
        }
        .login-button {
			align: "center";
            padding: 10px 20px;
            background-color: #333;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 1.1em;
            cursor: pointer;
            width: 300px;
        }
        .login-button:hover {
        	align: center;
            background-color: #555;
        }
        .error-message {
            color: red;
            font-size: 1em;
            margin-top: 10px;
        }
        .signup-link {
            margin-top: 20px;
            font-size: 1em;
        }
        .signup-link a {
            color: #333;
            text-decoration: none;
        }
        .signup-link a:hover {
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
        </div><br><br><br><br><br>
        <div class="subtitle">로그인</div>
        <!-- 로그인 폼 -->
        <form action="loginReg.jsp" method="POST">
            <!-- 아이디 입력 -->
            <div class="form-group">
                <label for="id"><b>아이디</b></label>&nbsp;&nbsp;&nbsp;&nbsp;
                <input type="text" id="id" name="login_id" required placeholder="아이디를 입력하세요">
            </div><br>

            <!-- 비밀번호 입력 -->
            <div class="form-group">
                <label for="password"><b>비밀번호</b></label>
                <input type="text" id="password" name="login_pw" required placeholder="비밀번호를 입력하세요">
            </div><br><br>

            <!-- 로그인 버튼 -->
            <button type="submit" class="login-button">로그인</button>
        </form>

        <!-- 오류 메시지 표시 -->
        <c:if test="${not empty errorMessage}">
            <div class="error-message">${errorMessage}</div>
        </c:if>

        <!-- 회원가입 링크 -->
        <div class="signup-link">
            <p>회원이 아니신가요? <a href="signup.jsp">회원가입</a></p>
        </div>
    </div>
</body>
</html>
