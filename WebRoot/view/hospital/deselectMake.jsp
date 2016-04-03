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
	   		 <label for="exampleInputName2">用户名</label>
	   		 <input type="text" name="account" class="form-control" id="t_account" placeholder="请输入用户名" required autofocus>
	   		 <label style="color: red;text-align: left;"></label>
		  </div>
		  <div class="form-group">
		    <label for="exampleInputEmail2">密码</label>
		    <input type="password" name="password" class="form-control" id="t_password" placeholder="请输入密码" required autofocus>
		  </div>
			 <div class="form-group">
		    <label for="exampleInputEmail2">确认密码</label>
		    <input type="password" class="form-control" id="toPassWord" placeholder="再次输入密码" required autofocus>
		  </div>
			 <div class="form-group">
		    <label for="exampleInputEmail2">手机号</label>
		    <input type="text" name="relationway" class="form-control" id="t_relationway" placeholder="手机号" required autofocus>
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
	                url: "./userInfo/addUserInfo.do",
					type: 'post',
	                data: params1,
	                cache: false,
	                success: function (text) {
	                	alter(text);
	                    window.location = "./index.jsp";
	                }
	            });
	        }
        }
       
      function isverify(){
    	  var username=/^[a-zA-Z][a-zA-Z0-9_]{4,15}$/;
    	  var password=/^[a-zA-Z]w[5,17]$/;
    	  var relationway=/^(13[0-9] |14[5|7]|15[0|1|2|3|5|6|7|8|9]|18[0|1|2|3|5|6|7|8|9])d{8}$/;
    	  if($("#t_account").val()==""){
    		  alert("用户名不能为空");
    		  return false;
    	  }else{
    		  if(!username.test($("#t_account").val())){
    			  alert("用户名不合法");
    		  }
    	  }
    	  
      }
</script>
</body>
</html>