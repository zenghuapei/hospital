<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ page isELIgnored="false" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>员工面板</title>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
    
    <script src="${pageContext.request.contextPath}/scripts/boot.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/scripts/jquery.json-2.3.min.js" type="text/javascript"></script>

    <style type="text/css">
    html, body
    {
        font-size:12px;
        padding:0;
        margin:0;
        border:0;
        height:100%;
        overflow:hidden;
    }
    </style>
</head>
<body>    
    <input id="tag" class="mini-hidden" value=""/>
    <form id="dutyInfo" method="post">
        <input name="dutyId" class="mini-hidden" />      
        <fieldset style="border:solid 1px #aaa;padding:3px;">
            <legend >基本信息</legend>
            <div style="padding:5px;">
        <table>
            <tr>
                <td style="width:70px;">值班时间:</td>
                <td style="width:150px;">    
                	<select name="dutyTime" id="t_dutyTime" class="mini-combobox">
                		<option value="8:00-12:00">8:00-12:00</option>
                		<option value="13:00-17:00">13:00-17:00</option>
                	</select>
                </td>
            </tr>
            <tr>
                <td >科室类型:</td>
                <td >    
                   <input name="subjectPrentId" id="s_subjectPrentId" onvaluechanged="onDeptChanged" class="mini-combobox" url="${pageContext.request.contextPath}/subject/querySubjectSelect.do" textField="subjectName" valueField="subjectId" required="true" showNullItem="true"/>
                </td>
               
            </tr>
            <tr>
             <td >科室：</td>
                <td >    
                    <input name="subjectId" id="t_subjectId" class="mini-combobox" onvaluechanged="onDoctorChanged" textField="subjectName" valueField="subjectId" textField="text" valueField="id" required="true"/>
                </td>
            </tr>
            <tr>
             <td >医生姓名：</td>
                <td >    
                    <input name="doctorId" id="t_doctorId" class="mini-combobox"  textField="doctorName" valueField="doctorId" textField="text" valueField="id" required="true"/>
                </td>
            </tr>
            <tr>
             <td >预约总数：</td>
                <td >    
                    <input name="maxBookNum" id="t_maxBookNum" class="mini-textbox"   required="true"/>
                </td>
            </tr>
            <tr>
             <td >日期：</td>
                <td >    
                    <input name="dutyDate" id="t_dutyDate" class="mini-datepicker"   required="true"/>
                </td>
            </tr>
        </table>            
            </div>
        </fieldset>
        <div style="text-align:center;padding:10px;">               
            <a class="mini-button" onclick="onOk" style="width:60px;margin-right:20px;">确定</a>       
            <a class="mini-button" onclick="onCancel" style="width:60px;">取消</a>       
        </div>        
    </form>
    <script type="text/javascript">
        mini.parse();
 

        var form = new mini.Form("dutyInfo");
		var subjectPrentId = mini.get("s_subjectPrentId");
        var subjectId = mini.get("t_subjectId");
        var doctorId = mini.get("t_doctorId");
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
        function SaveData() {
            var o = form.getData();            

            form.validate();
            if (form.isValid() == false) return;

           // var params = getSubmitParams("[id^='t_']");
			//var params1 = {data:$.toJSON(params)}; 
            var json = mini.encode(o);
            $.ajax({
                url: "${pageContext.request.contextPath}/dutyInfo/addDutyInfo.do",
				type: 'post',
                data: {data:json},
                cache: false,
                success: function (text) {
                    CloseWindow("add");
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                    CloseWindow();
                }
            });
        }
 		function EditData() {
            var o = form.getData();            

            form.validate();
            if (form.isValid() == false) return;

           // var params = getSubmitParams("[id^='t_']");
			//var params1 = {data:$.toJSON(params)}; 
            var json = mini.encode(o);
            $.ajax({
                url: "${pageContext.request.contextPath}/dutyInfo/updateDutyInfo.do",
				type: 'post',
                data: {data:json},
                cache: false,
                success: function (text) {
                    CloseWindow("edit");
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                    CloseWindow();
                }
            });
        }
        ////////////////////
        //标准方法接口定义
        function SetData(data) {
        $("#tag").val(data.action);
            if (data.action == "edit") {
                //跨页面传递的数据对象，克隆后才可以安全使用
                data = mini.clone(data);
                $.ajax({
                    url: "${pageContext.request.contextPath}/dutyInfo/queryDutyInfoUpdate.do?dutyId=" + data.dutyId,
                    cache: false,
                    success: function (text) {
                        var o = mini.decode(text);
                        form.setData(o);
                        form.setChanged(false);
                        onDeptChanged();
                         mini.getbyName("subjectId").setValue(o.subjectId);
                        onDoctorChanged();
                         mini.getbyName("doctorId").setValue(o.doctorId);
                    }
                });
            }
        }

        function GetData() {
            var o = form.getData();
            return o;
        }
        function CloseWindow(action) {            
            if (action == "close" && form.isChanged()) {
                if (confirm("数据被修改了，是否先保存？")) {
                    return false;
                }
            }
            if (window.CloseOwnerWindow) return window.CloseOwnerWindow(action);
            else window.close();            
        }
        function onOk(e) {
        	if($("#tag").val()=="add"){
	            SaveData();
        	}else if($("#tag").val()=="edit"){
				EditData();
			}
        }
        function onCancel(e) {
            CloseWindow("cancel");
        }
    </script>
</body>
</html>
