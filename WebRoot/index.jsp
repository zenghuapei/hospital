<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
<body>
<div class="container theme-showcase">
	<jsp:include page="./head.jsp"></jsp:include>
 	 <div id="main" style="width: 100%;margin-top: 20px">
 	 <c:choose>
		   <c:when test="${sessionScope.currentUser== null}">  
		     	<form class="form-horizontal">
			    	<fieldset>
					      <div id="legend" class="">
					        <legend class="">用户注册</legend>
					      </div>
					    	<div style="width: 50%;margin: 0 auto;">
					    	
							 <div class="form-group">
							 	<label for="exampleInputEmail2">用户名</label>
						   		 <input type="text" name="account" class="form-control" id="t_account" placeholder="以字母开头，5-15位，字母数字下划线" required autofocus>
						   		<span class="help-inline" style="color: red" id="s_account"></span>
							  </div>
							  <div class="form-group">
							    <label for="exampleInputEmail2">密码</label>
							    <input type="password" name="password" class="form-control" id="t_password" placeholder="以字母开头，5-17位，字母数字下划线" required autofocus>
							    <span class="help-inline" style="color: red" id="s_password"></span>
							  </div>
								 <div class="form-group">
							    <label for="exampleInputEmail2">确认密码</label>
							    <input type="password" class="form-control" id="toPassWord" placeholder="再次输入密码" required autofocus>
							    <span class="help-inline" style="color: red" id="s_toPassWord"></span>
							  </div>
								 <div class="form-group">
							    <label for="exampleInputEmail2">手机号</label>
							    <input type="text" name="relationway" class="form-control" id="t_relationway" placeholder="手机号" required autofocus>
							    <span class="help-inline" style="color: red" id="s_relationway"></span>
							  	</div>
							  	
							  	   <button class="btn btn-lg btn-primary btn-block" style="margin-top: 20px" type="button"  onclick="SaveData()">注册</button>
					    	</div>
			    	</fieldset>
			  </form>
		   </c:when>
		   <c:otherwise> 
		   <div style="margin-top: 50px">
				<table  class="table table-bordered" style="width: 70%;margin: 0 auto;" >
					<tr >
						  <td style="width: 200px;text-align: right;"><h2>用户昵称：</h2></td>
						  <td><h2>${sessionScope.currentUser.userName}</h2></td>
					</tr> 
					<tr>
						  <td style="text-align: right;"><h2>性别：</h2></td>
						  <td><h2>${sessionScope.currentUser.sex}</h2></td>
					</tr> 
					<tr>
						  <td style="text-align: right;"><h2>地址：</h2></td>
						  <td><h2>${sessionScope.currentUser.address}</h2></td>
					</tr> 
					<tr>
						  <td style="text-align: right;"><h2>联系电话：</h2></td>
						  <td><h2>${sessionScope.currentUser.relationway}</h2></td>
					</tr> 
					<tr>
						  <td style="text-align: right;"><h2>注册时间：</h2></td>
						  <td><h2><fmt:formatDate value="${sessionScope.currentUser.userRegister}" type="date"/></h2></td>
					</tr> 
		 		</table>
		   </div>
		   </c:otherwise>
		</c:choose>
 		
 	 </div>
</div>
</body>
<script type="text/javascript">     
       function SaveData() {
            var params = getSubmitParams("[id^='t_']");
			var params1 = {data:$.toJSON(params)}; 
            //var json = mini.encode(o);
            if(isverify()){
	            $.ajax({
	                url: "./userInfo/addUserInfo.do",
					type: 'post',
	                data: params1,
	                cache: false,
	                success: function (text) {
	                    window.location = "./login1.jsp";
	                }
	            });
	        }
        }
       
      function isverify(){
    	  var username=/^[a-zA-Z][a-zA-Z0-9_]{5,15}$/;
    	  var password=/^[a-zA-Z]\w{5,17}$/;
    	  var relationway=/^1\d{10}$/;
    	  $("#s_account").empty();
    	  $("#s_password").empty();
    	  $("#s_toPassWord").empty();
    	  $("#s_relationway").empty();
    	  if($("#t_account").val()==""){
    		   $("#s_account").append("用户名不能为空");
    		  return false;
    	  }else{
    		  if(!username.test($("#t_account").val())){
    			  $("#s_account").append("用户名不合法");
    			  return false;
    		  }
    	  }
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
    	  if($("#t_relationway").val()==""){
    		  $("#s_relationway").append("手机号不能为空");
    		  return false;
    	  }else{
    		  if(!relationway.test($("#t_relationway").val())){
    			  $("#s_relationway").append("手机号不合法");
    			  return false;
    		  }
    	  }
    	
    	  return true;
      }
</script>
</html>
