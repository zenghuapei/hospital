<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ page isELIgnored="false" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/buttons.css">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="${pageContext.request.contextPath}/scripts/jquery-1.6.2.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/scripts/boot.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/scripts/jquery.json-2.3.min.js" type="text/javascript"></script>
<body>
	<div style="text-align: right;margin: 0px;padding: opx">
		<h3>
		<c:choose>
		   <c:when test="${sessionScope.currentUser== null}">  
		     	<a href="login1.jsp" class="button button-uppercase button-primary">登陆</a>
				<a href="register.jsp" class="button button-uppercase button-primary">注册</a>    
		   </c:when>
		   <c:otherwise> 
				  欢迎：<a>${sessionScope.currentUser.userName}</a> <a href="./logout.do">退出</a>
		   </c:otherwise>
		</c:choose>
			
		</h3>
	</div>
	<div class="jumbotron" style="text-align: center;">
	        <h1>XX医院网上挂号系统</h1>	        	        	     	        
	</div>
	<div class="button-group" style="text-align: center;">
	    <a  class="button button-uppercase button-primary" style="margin-left: 150px" href="${pageContext.request.contextPath}/subject/querySubject.do">网上预约挂号</a>
	    <a  class="button button-uppercase button-primary" style="margin-left: 150px" href="view/hospatil/makeQuery.jsp">预约挂号查询</a>
	    <a  class="button button-uppercase button-primary" style="margin-left: 150px" href="view/hospatil/deselectMake.jsp">取消网上预约</a>
 	 </div>
</body>
</html>
