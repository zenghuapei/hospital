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
<title>预约挂号</title>
</head>
<body>
<div class="container">
<jsp:include page="../../head.jsp"></jsp:include>
	<form class="form-horizontal" action="${pageContext.request.contextPath}/booking/addBooking.do" method="post">
    <fieldset>
      <div id="legend" class="">
        <legend class="">预约挂号</legend>
      </div>
    	<div style="width: 50%;margin: 0 auto;">
    	<input type="hidden" name="userId" value="${sessionScope.currentUser.userId }">
    	<input type="hidden" name="doctorId" value="${requestScope.doctorId }">
			 <div class="form-group">
		    <label for="exampleInputEmail2">姓名</label>
		    <input type="text" name="bookName" class="form-control" id="t_bookName" placeholder="姓名" required autofocus>
		  	</div>
		 <div class="form-group">
		 	<label for="exampleInputEmail2">身份证</label>
	   		 <input type="text" name="bookIdCard" class="form-control" id="t_bookIdCard" placeholder="请输入身份证号码" required autofocus>
		  </div>
		  <div class="form-group">
		    <label for="exampleInputEmail2">手机号</label>
		    <input type="text" name="bookNum" class="form-control" id="t_bookNum" placeholder="请输入手机号" required autofocus>
		  </div>
			 <div class="form-group">
		    <label for="exampleInputEmail2">通讯地址</label>
		    <input type="text" name="bookAddress" class="form-control" id="t_bookAddress" placeholder="请输入地址" required autofocus>
		  </div>
		  	
		  	   <button class="btn btn-lg btn-primary btn-block" style="margin-top: 20px" type="submit">确认</button>
    	</div>
    	</fieldset>
  </form>
</div>
<script type="text/javascript">     
     /*   function SaveData() {
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
        */
   
</script>
</body>
</html>