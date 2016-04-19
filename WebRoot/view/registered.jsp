<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
      <%@ page isELIgnored="false" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
 <style type="text/css">
    body{
        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
    }    
    </style>  
		<script src="${pageContext.request.contextPath}/scripts/boot.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/scripts/jquery.json-2.3.min.js" type="text/javascript"></script>
</head>
<style type="text/css">
    fieldset
    {
        border:solid 1px #aaa;
    }        
    .hideFieldset
    {
        border-left:0;
        border-right:0;
        border-bottom:0;
    }
    .hideFieldset .fieldset-body
    {
        display:none;
    }
    
    </style>
	<body>
	 <form id="registered" method="post">
  <fieldset id="fd1" style="width:98%;height: 98%">
        <legend><span>用户注册</span></legend>
        <div class="fieldset-body" style="text-align: center;">
           <table border="0" cellpadding="1" cellspacing="2">
             <tr>
                <td >科室类型:</td>
                <td >    
                   <input name="subjectPrentId" id="s_subjectPrentId" onvaluechanged="onDeptChanged" class="mini-combobox" url="${pageContext.request.contextPath}/subject/querySubjectSelect.do" textField="subjectName" valueField="subjectId" required="true" showNullItem="true"/>
                </td>
               
            </tr>
            <tr>
             <td >科室：</td>
                <td >    
                    <input name="subjectId" id="s_subjectId" class="mini-combobox" onvaluechanged="onDoctorChanged" textField="subjectName" valueField="subjectId" textField="text" valueField="id" required="true"/>
                </td>
            </tr>
            <tr>
             <td >医生姓名：</td>
                <td >    
                    <input name="doctorId" id="t_doctorId" class="mini-combobox"  onvaluechanged="onDutyChanged" textField="doctorName" valueField="doctorId" textField="text" valueField="id" required="true"/>
                </td>
            </tr>
             <tr>
             <td >值班信息：</td>
                <td >    
                    <input name="dutyDate" id="t_dutyDate" class="mini-combobox" ondrawcell="onDrawCell" textField="dutyDateStr"  valueField="dutyDateStr" textField="text" valueField="id" required="true" dateFormat="yyyy-MM-dd"/>
                </td>
            </tr>
			    <tr>
			        <td style="width:60px;">姓名：</td>
			        <td style="width:100px">
			            <input name="bookName" id="t_bookName" class="mini-textbox" required="true"/>
			        </td>
			    </tr>
			    <tr>
			        <td >身份证号：</td>
			        <td >
			            <input name="bookIdCard" id="t_bookIdCard" class="mini-textbox" required="true"/>
			        </td>
			    </tr>
			    <tr>
			        <td >电话：</td>
			        <td >
			            <input name="bookNum" id="t_bookNum" class="mini-textbox" required="true"/>
			        </td>
			    </tr>
			     <tr>
			        <td >地址：</td>
			        <td >
			            <input name="bookAddress" id="t_bookAddress" class="mini-textbox" required="true"/>
			        </td>
			    </tr>
			</table>
			 <div style="text-align:left;padding:10px;">               
		            <a class="mini-button" onclick="SaveData()" style="width:60px;margin-right:20px;">确定</a>       
       		 </div>   
        </div>
    </fieldset>
    </form>
</body>
	   <script type="text/javascript">
	   		mini.parse();
 

        var form = new mini.Form("registered");
 		var subjectPrentId = mini.get("s_subjectPrentId");
        var subjectId = mini.get("s_subjectId");
        var doctorId = mini.get("t_doctorId");
        var dutyDate = mini.get("t_dutyDate");
	    function onDrawCell(e) {
            var item = e.record, field = e.field, value = e.value;
            //组织HTML设置给cellHtml
            e.cellHtml = '<span style="">'+item.dutyDateStr+'</span>';   
            
        }
	   function onDeptChanged(e) {
            var id = subjectPrentId.getValue();

            subjectId.setValue("");
            
            var url = "${pageContext.request.contextPath}/subject/querySubjectSubset.do?parentId=" + id
            subjectId.load(url);
            
            subjectId.setValue("");
        }
         function onDoctorChanged(e) {
            var id = subjectId.getValue();

            doctorId.setValue("");
            
            var url = "${pageContext.request.contextPath}/doctorInfo/queryDoctorInfoAjax.do?subjectId=" + id
            doctorId.load(url);
            
            doctorId.setValue("");
        }
         function onDutyChanged(e) {
            var id = doctorId.getValue();

            dutyDate.setValue("");
            
            var url = "${pageContext.request.contextPath}/dutyInfo/queryDutyInfoAjax.do?doctorId=" + id
            dutyDate.load(url);
            
            dutyDate.setValue("");
        }
        function SaveData() {
            var o = form.getData();            

            form.validate();
            if (form.isValid() == false) return;

            var params = getSubmitParams("[id^='t_']");
			var params1 = {data:$.toJSON(params)}; 
            var json = mini.encode(o);
            $.ajax({
                url: "${pageContext.request.contextPath}/booking/addBookingAjax.do",
				type: 'post',
                data: params1,
                cache: false,
                success: function (text) {
                   mini.alert(text);
            		form.clear();
                },
               
            });
        }
	   </script>
</html>