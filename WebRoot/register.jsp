<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>用户注册</title>
</head>
<body>
<div class="container">
<jsp:include page="./head.jsp"></jsp:include>
	<form class="form-horizontal">
    <fieldset>
      <div id="legend" class="">
        <legend class="">用户注册</legend>
      </div>
    	<div style="width: 50%;margin: 0 auto;">
    	
		 <div class="form-group">
		 	<label for="exampleInputEmail2">用户名</label>
	   		 <input type="text" name="account" class="form-control" id="t_account" placeholder="以字母开头，5-15位，字母数字下划线" required autofocus>
	   		<span class="help-inline" id="s_account"></span>
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
			 <div class="form-group">
		    <label for="exampleInputEmail2">手机号</label>
		    <input type="text" name="relationway" class="form-control" id="t_relationway" placeholder="手机号" required autofocus>
		    <span class="help-inline" id="s_relationway"></span>
		  	</div>
		  	
		  	   <button class="btn btn-lg btn-primary btn-block" style="margin-top: 20px" type="button"  onclick="SaveData()">注册</button>
    	</div>
    	</fieldset>
  </form>
</div>
<script type="text/javascript">     
       function SaveData() {
            var params = getSubmitParams("[id^='t_']");
			var params1 = {data:$.toJSON(params)}; 
            //var json = mini.encode(o);
            if(isverify()){
	            $.ajax({
	                url: '${pageContext.request.contextPath}/userInfo/addUserInfo.do',
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
</body>
</html>