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
    <form id="doctorInfo" method="post">
        <input name="doctorId" class="mini-hidden" />      
        <fieldset style="border:solid 1px #aaa;padding:3px;">
            <legend >基本信息</legend>
            <div style="padding:5px;">
        <table>
            <tr>
                <td style="width:70px;">姓名:</td>
                <td style="width:150px;">    
                    <input name="doctorName" id="t_doctorName" class="mini-textbox" required="true"/>
                </td>
                <td style="width:70px;">性别：</td>
                <td >                        
                    <select name="doctorSex" id="t_doctorSex" class="mini-radiobuttonlist">
                        <option value="男">男</option>
                        <option value="女">女</option>
                    </select>
                </td>
                
            </tr>
           
             <tr>
                  <td >专业名称：</td>
                  <td >    
                      <input name="doctorSpecialty" id="t_doctorSpecialty" class="mini-textbox" required="true"/>
                  </td>
                  <td >医生类别：</td>
                  <td >    
                      <input name="doctorType" id="t_doctorType" class="mini-textbox" required="true" valueField="id" textField="name"/>
                  </td>
            </tr>
               
            <tr>
                <td >学历：</td>
                <td >    
                    <input name="doctorXl" id="t_doctorXl" class="mini-textbox" valueField="id" textField="name" url="" />
                </td>
                <td >从医年数：</td>
                <td >    
                    <input name="doctorYears" id="t_doctorYears" class="mini-textbox" />
                </td>
            </tr>           
            <tr>
                <td >科室类型:</td>
                <td >    
                   <input name="subjectPrentId" id="t_subjectPrentId" onvaluechanged="onDeptChanged" class="mini-combobox" url="${pageContext.request.contextPath}/subject/querySubjectSelect.do" textField="subjectName" valueField="subjectId" required="true" showNullItem="true"/>
                </td>
                <td >科室：</td>
                <td >    
                    <input name="subjectId" id="t_subjectId" class="mini-combobox"  textField="subjectName" valueField="subjectId" textField="text" valueField="id" required="true"/>
                </td>
            </tr>
             <tr>
                 <td style="width:70px;">职称:</td>
                <td style="width:150px;">    
                    <input name="doctorPost" id="t_doctorPost" class="mini-textbox" required="true"/>
                </td>
                <td >E-mail:</td>
                <td >    
                    <input name="email" id="t_email" class="mini-textbox" required="true"/>
                </td>
            </tr>
             <tr>
               
                 <td style="width:100px;">简介:</td>
                <td style="width:150px;" colspan="3">    
                    <input name="doctorBrief" id="t_doctorBrief" style="width: 400px" class="mini-textarea" required="true"/>
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
 

        var form = new mini.Form("doctorInfo");
 		var subjectPrentId = mini.get("t_subjectPrentId");
        var subjectId = mini.get("t_subjectId");

        function onDeptChanged(e) {
            var id = subjectPrentId.getValue();

            subjectId.setValue("");
            
            var url = "${pageContext.request.contextPath}/subject/querySubjectSubset.do?parentId=" + id
            subjectId.load(url);
            
            subjectId.setValue("");
        }
        function SaveData() {
            var o = form.getData();            

            form.validate();
            if (form.isValid() == false) return;

           // var params = getSubmitParams("[id^='t_']");
			//var params1 = {data:$.toJSON(params)}; 
            var json = mini.encode(o);
            $.ajax({
                url: "${pageContext.request.contextPath}/doctorInfo/addDoctorInfo.do",
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
                url: "${pageContext.request.contextPath}/doctorInfo/updateDoctorInfo.do",
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
                    url: "${pageContext.request.contextPath}/doctorInfo/queryDoctor.do?doctorId=" + data.doctorId,
                    cache: false,
                    success: function (text) {
                        var o = mini.decode(text);
                        form.setData(o);
                        form.setChanged(false);
                        onDeptChanged();
                        // mini.getbyName("subjectPrentId").setValue(o.subjectPrentId);
                        mini.getbyName("subjectId").setValue(o.subjectId);
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
