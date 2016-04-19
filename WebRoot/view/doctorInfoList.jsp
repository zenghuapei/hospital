<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<body>
   
    
 <div class="mini-toolbar" style="border-bottom:0;padding:0px;">
            <table style="width:100%;">
                <tr>
                    <td style="width:100%;">
                        <a class="mini-button" iconCls="icon-add" onclick="add()">增加</a>
                        <a class="mini-button" iconCls="icon-add" onclick="edit()">编辑</a>
                        <a class="mini-button" iconCls="icon-remove" onclick="remove()">删除</a>       
                    </td>
                    <td style="white-space:nowrap;">
                        <input id="key" class="mini-textbox" emptyText="请输入医生姓名" style="width:150px;" onenter="onKeyEnter"/>   
                        <a class="mini-button" onclick="search()">查询</a>
                    </td>
                </tr>
            </table>           
        </div>
    <!--撑满页面-->
    <div class="mini-fit" >
        
        <div id="datagrid1" class="mini-datagrid" style="width:100%;height:100%;" 
            url="${pageContext.request.contextPath}/doctorInfo/queryPage.do"  idField="userId"
            sizeList="[5,10,20,50]" pageSize="10"
        >
            <div property="columns">  
                    <div field="doctorName" width="120"  align="center" headerAlign="center" >医生姓名
                    </div>      
                    <div field="doctorPost" width="120"  align="center" headerAlign="center" >职称                        
                    </div>                
                    <div field="doctorSex" width="100"  renderer="onGenderRenderer" align="center" headerAlign="center">性别
                    </div>            
                    <div field="doctorSpecialty"  align="center" width="100" headerAlign="center">专业名称
                    </div>
                    <div field="doctorType"  align="center" width="100" headerAlign="center">医生类别
                    </div>                                    
                    <div field="doctorXl" width="100"  align="center" headerAlign="center"  >学历</div>  
                    <div field="doctorYears"  align="center" width="100" headerAlign="center">从医年数</div>    
                    <div field="email" width="100"  align="center" headerAlign="center"  >e-mail</div>  
                </div>
        </div> 

    </div>
    <script type="text/javascript">
        mini.parse();
        var grid = mini.get("datagrid1");
        grid.load();

        function onSearch() {
            var key = mini.get("userName").getValue();
            grid.load({ userName: key });
        }
         function add() {
            
            mini.open({
                url: "${pageContext.request.contextPath}/view/doctorInfoeditadd.jsp",
                title: "新增医生信息", width: 600, height: 300,
                onload: function () {
                    var iframe = this.getIFrameEl();
                    var data = { action: "add"};
                    iframe.contentWindow.SetData(data);
                },
                ondestroy: function (action) {

                    grid.reload();
                }
            });
        }
        function edit() {
         
            var row = grid.getSelected();
            if (row) {
                mini.open({
                    url: "${pageContext.request.contextPath}/view/doctorInfoeditadd.jsp",
                    title: "医生信息", width: 600, height: 300,
                    onload: function () {
                        var iframe = this.getIFrameEl();
                        var data = { action: "edit", doctorId: row.doctorId };
                        iframe.contentWindow.SetData(data);
                        
                    },
                    ondestroy: function (action) {
                        grid.reload();
                        
                    }
                });
                
            } else {
                alert("请选中一条记录");
            }
            
        }
        function remove() {
            
            var row = grid.getSelected();
            if (row) {
                if (confirm("确定删除选中记录？")) {
                    grid.loading("操作中，请稍后......");
                    $.ajax({
                        url: "${pageContext.request.contextPath}/doctorInfo/deleteDoctorInfo.do?doctorId=" +row.doctorId,
                        success: function (text) {
                            grid.reload();
                        },
                        error: function () {
                        }
                    });
                }
            } else {
                alert("请选中一条记录");
            }
        }
    </script>
</body>
</html>