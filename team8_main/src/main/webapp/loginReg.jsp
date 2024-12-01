<%@ page import="model.InformationDAO" %>
<%@ page import="model.InformationDTO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String login_id = request.getParameter("login_id");
    String login_pw = request.getParameter("login_pw");

    String msg = "정보가 맞지 않습니다.";
    String successLogin = "login.jsp";

    // 사용자의 정보 조회
    InformationDTO member_info = new InformationDAO().getUserInfo(login_id);

    if (member_info != null) {
        if (member_info.getPassword().equals(login_pw)) {
            msg = "로그인 성공했습니다";
            successLogin = "main3.jsp";
            session.setAttribute("user", member_info);
        }
    }
%>
out.println("<h1>안녕하세요, " + user.getUsername() + "님</h1>");
<script type="text/javascript">
    alert("<%=msg%>")
    location.href = "<%=successLogin%>";
</script>
