<%--
  Created by IntelliJ IDEA.
  User: kuro
  Date: 2018/12/30
  Time: 17:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员登陆</title>
    <jsp:include page="${pageContext.request.contextPath}/jsps/public/inc.jsp"/>
</head>
<body background="${pageContext.request.contextPath}/image/adbg.jpg" style="text-align: center">
    <div class="container text-center well" style="margin-top: 25%;width: 30%">
        <h2>管理员登录</h2>
        <form role="form" method="post" action="${pageContext.request.contextPath}/adLogin">
            <div class="form-group">
                <input type="text" name="uid" class="form-control" placeholder="账号"/>
            </div>
            <div class="form-group">
                <input type="password" name="password" class="form-control" placeholder="密码"/>
            </div>
            <div class="form-group">
                <input type="submit" name="password" class="form-control" value="登录"/>
            </div>
        </form>
    </div>
</body>
</html>
