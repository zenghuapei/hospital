 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>科室医生信息</title>
</head>
<body>
<div class="container">
<jsp:include page="../../head.jsp"></jsp:include>
 <div id="main" style="width: 100%;overflow:hidden;margin-top: 20px">
 	 <div style="margin-top: 50px">
				<table  class="table table-bordered" style="width: 70%;margin: 0 auto;" >
						<tr >
							  <td style="width: 250px;text-align: right;"><h3>科室值班医生：<h3></td>
								  <td style="line-height: 60px;font-size: 15px">
									<c:forEach items="${requestScope.doctorList}" var="doctorList">
										  <a href="${pageContext.request.contextPath}/dutyInfo/queryDutyInfo.do?doctorId=${doctorList.doctorId}">${doctorList.doctorName}</a> 
									</c:forEach>
								  </td>
						</tr> 
					
		 		</table>
		   </div>
 </div>
</div>

</body>
</html>