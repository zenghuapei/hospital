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
<title>修改个人信息</title>
<script type="text/javascript">

 $(document).ready(function(){
        $(".nav li").click(function(){
        $(".nav li").eq($(this).index()).addClass("active").siblings().removeClass('active');
        if($(this).index()==0){
        	$("#div1").show();
        	$("#div2").hide();
        }else if($(this).index()==1){
        	$("#div1").hide();
        	$("#div2").show();
        }
		//$("div").hide().eq($(this).index()).show();
       //另一种方法: $("div").eq($(".tab li").index(this)).addClass("on").siblings().removeClass('on'); 

        });
    });
</script>
</head>
<body>
<div class="container">
<jsp:include page="../../head.jsp"></jsp:include>




<ul class="nav nav-tabs">
  <li  role="presentation" id="one" class="active" onclick=""><a>个人信息管理</a></li>
  <li role="presentation" id="one1" onclick=""><a>密码管理</a></li>
</ul>
<div id="div1">
	<form class="form-horizontal" action="${pageContext.request.contextPath}/userInfo/updateUserInfo.do" method="post">
    <fieldset>
      <div id="legend" class="">
        <legend class=""></legend>
      </div>
      <div style="margin-top: 50px">
      <input type="hidden" name="userId" value="${sessionScope.currentUser.userId}" />
				<table  class="table" style="width: 70%;margin: 0 auto;" >
					
					<tr >
						  <td style="width: 200px;text-align: right;"><h4>用户昵称：</h4></td>
						  <td><input type="text" name="userName" class="form-control" value="${sessionScope.currentUser.userName}" id="t_userName" placeholder="请输入昵称" required autofocus></td>
						  <td><span class="help-inline" id="s_userName"></span></td>
					</tr> 
					<tr>
						  <td style="text-align: right;"><h4>性别：</h4></td>
						  <td>
						  <c:if test="${sessionScope.currentUser.sex =='男'}">
						  	 <input type="radio" name="sex" id="inlineRadio2" value="男" checked="checked"> 男
						  	 <input type="radio" name="sex" id="inlineRadio3" value="女"> 女
						  </c:if>
						   <c:if test="${sessionScope.currentUser.sex =='女'}">
						  	 <input type="radio" name="sex" id="inlineRadio2" value="男" > 男
						  	 <input type="radio" name="sex" id="inlineRadio3" value="女" checked="checked"> 女
						  </c:if>
						  </td>
						  <td></td>
					</tr> 
					<tr>
						  <td style="text-align: right;"><h4>身份证号：</h4></td>
						  <td><input type="text" name="idCard" class="form-control" value="${sessionScope.currentUser.idCard}" id="t_idCard" placeholder="请输入身份证号" required autofocus> </td>
		   					<td><span class="help-inline" id="s_idCard"></span></td>
					</tr> 
					<tr>
						  <td style="text-align: right;"><h4>住址：</h4></td>
						  <td><input type="text" name="address" class="form-control" value="${sessionScope.currentUser.address}" id="t_address" placeholder="请输入地址" required autofocus></td>
							<td> <span class="help-inline" id="s_address"></span></td>
					</tr> 
					<tr>
						  <td style="text-align: right;"><h4>手机号：</h4></td>
						  <td> <input type="text" name="relationway" value="${sessionScope.currentUser.relationway}" class="form-control" id="t_relationway" placeholder="请输入手机号" required autofocus></td>
						  <td><span class="help-inline" id="s_relationway"></span></td>	
					</tr> 
					<tr>
						<td></td>
						<td >  <button class="btn btn-lg btn-primary btn-block" style="margin-top: 20px" type="submit">确认</button></td>
						<td></td>
					</tr>
		 		</table>
		   </div>
    	
    	</fieldset>
  </form>
</div>
<div id="div2" style="display: none;">
	<form class="form-horizontal" action="${pageContext.request.contextPath}/userInfo/updatePassword.do" method="post" onsubmit="return isverify()">
    <fieldset>
      <div id="legend" class="">
        <legend class=""></legend>
      </div>
    	<div style="width: 50%;margin: 0 auto;">
    	<input type="hidden" name="userId" value="${sessionScope.currentUser.userId}" />
		 <div class="form-group">
		 	<label for="exampleInputEmail2">原密码</label>
	   		 <input type="password" name="ypassWord" class="form-control" id="t_ypassWord" placeholder="以字母开头，5-17位，字母数字下划线" required autofocus>
	   		<span class="help-inline" id="s_ypassWord">${requestScope.message }</span>
		  </div>
		  <div class="form-group">
		    <label for="exampleInputEmail2">密码</label>
		    <input type="password" name="password" class="form-control" id="t_password" placeholder="以字母开头，5-17位，字母数字下划线" required autofocus>
		    <span class="help-inline" id="s_password"></span>
		  </div>
			 <div class="form-group">
		    <label for="exampleInputEmail2">确认密码</label>
		    <input type="password" class="form-control" id="toPassWord" placeholder="再次输入密码" required autofocus>
		    <span class="help-inline" id="s_toPassWord"></span>
		  </div>
			
		  	
		  	   <button class="btn btn-lg btn-primary btn-block" style="margin-top: 20px" type="submit">确认</button>
    	</div>
    	</fieldset>
  </form>
</div>
	
</div>
<script type="text/javascript">     
      function isverify(){
    	  var password=/^[a-zA-Z]\w{5,17}$/;
    	 
    	  if($("#t_password").val()==""){
    		  $("#s_password").append("密码不能为空");
    		  return false;
    	  }else{
    		  if(!password.test($("#t_password").val())){
    			  $("#s_password").append("密码不合法");
    			  return false;
    		  }
    	  }
    	    if($("#t_password").val()!=$("#toPassWord").val()){
    	    $("#s_toPassWord").append("两次密码输入不一致");
    		  return false;
    	  }
      }
</script>
</body>
</html>