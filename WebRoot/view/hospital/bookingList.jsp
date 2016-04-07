 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
      <%@ page isELIgnored="false" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 新 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/buttons.css">

<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="${pageContext.request.contextPath}/scripts/jquery-1.6.2.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="${pageContext.request.contextPath}/bootstrap/js/bootstrap.min.js"></script>
 <script src="${pageContext.request.contextPath}/scripts/boot.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/scripts/jquery.json-2.3.min.js" type="text/javascript"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>预约信息</title>
</head>
<body>
<div class="container">
<jsp:include page="../../head.jsp"></jsp:include>
 <div id="main" style="width: 100%;overflow:hidden;margin-top: 20px">
 	 <div style="margin-top: 50px">
				<table  class="table table-bordered" style="width: 70%;margin: 0 auto;" >
						<tr>
							<td>预约时间</td>
							<td>姓名</td>
							<td>地址</td>
							<td>手机号</td>
							<td>身份证号</td>
							<td>预约状态</td>
							<td>操作</td>
						</tr>
						<c:forEach items="${requestScope.bookingList}" var="bookingList">
							<tr>
								<td><fmt:formatDate value="${bookingList.booknow }" type="date"/></td>
								<td>${bookingList.bookName }</td>
								<td>${bookingList.bookAddress }</td>
								<td>${bookingList.bookNum }</td>
								<td>${bookingList.bookIdCard }</td>
								<td>${bookingList.bookingState }</td>
								<c:choose>
									<c:when test="${bookingList.bookingState =='预约成功' }">
										<td><a href="${pageContext.request.contextPath}/booking/updateBooking.do?bookingId=${bookingList.bookingId}">取消预约</a></td>
									</c:when>
									<c:otherwise>
										<td></td>
									</c:otherwise>
								</c:choose>
							</tr>
						</c:forEach>
		 		</table>
		   </div>
 </div>
</div>

</body>
</html>