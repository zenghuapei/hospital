<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ page isELIgnored="false" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登陆</title>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/buttons.css">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="${pageContext.request.contextPath}/scripts/jquery-1.6.2.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
 <div class="container">
	<div id="loginWindow" style="width: 20%;margin: 100px auto;">
	
      <form class="form-signin" method="POST" action="./login.do">
        <h2 class="form-signin-heading">登录</h2>
        <label for="inputAccount" class="sr-only">用户名</label>
        <input type="text" name="account" id="inputAccount" class="form-control" placeholder="用户名" required autofocus>
        <label for="inputPassword" class="sr-only">密码</label>
        <input type="password" name="password" id="inputPassword" style="margin-top: 10px" class="form-control" placeholder="密码" required>
        <div class="checkbox">
          <label style="color: red;text-align: left;">
            ${requestScope.message_login} 
          </label>
        </div>
        	<button class="button button-uppercase button-primary" type="submit" >登录</button>
			<a href="register.jsp" class="button button-uppercase button-primary">注册</a>
      </form>
	</div>

    </div> 
</body>
</html>