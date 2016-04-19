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
                        <input id="adminName" class="mini-textbox"  emptyText="请输入管理员姓名" style="width:150px;" onenter="onKeyEnter"/>   
                        <a class="mini-button" onclick="onSearch()">查询</a>
                    </td>
                </tr>
            </table>           
        </div>
    <!--撑满页面-->
    <div class="mini-fit" >
        
        <div id="datagrid1" class="mini-datagrid" style="width:100%;height:100%;" 
            url="${pageContext.request.contextPath}/userAdmin/queryPage.do"  idField="adminId"
            sizeList="[5,10,20,50]" pageSize="10"
        >
            <div property="columns">  
                    <div field="adminName" width="120"  align="center" headerAlign="center" >管理员姓名
                    </div>      
                    <div field="account" width="120"  align="center" headerAlign="center" >账号                        
                    </div> 
                     <div field="adminSex" width="120"  align="center" headerAlign="center" >性别                    
                    </div>     
                     <div field="adminRegister" width="120"  align="center" headerAlign="center" dateFormat="yyyy-MM-dd">注册时间                        
                    </div>                
                </div>
        </div> 

    </div>
    <script type="text/javascript">
        mini.parse();
        var grid = mini.get("datagrid1");
        grid.load();

        function onSearch() {
            var key = mini.get("adminName").getValue();
            grid.load({ adminName: key });
        }
         function add() {
            
            mini.open({
                url: "${pageContext.request.contextPath}/view/userAdmineditadd.jsp",
                title: "新增管理员信息", width: 300, height: 220,
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
                    url: "${pageContext.request.contextPath}/view/userAdminedit.jsp",
                    title: "修改管理员信息", width: 300, height: 220,
                    onload: function () {
                        var iframe = this.getIFrameEl();
                        var data = { action: "edit", adminId: row.adminId };
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
                        url: "${pageContext.request.contextPath}/userAdmin/deleteUserAdmin.do?adminId=" +row.adminId,
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