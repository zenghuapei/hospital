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
   
    
 <div class="mini-toolbar" style="padding:2px;border-bottom:0;">
        <table style="width:100%;">
            <tr>
            <td style="white-space:nowrap;"><label style="font-family:Verdana;">昵称: </label>
                 <input id="userName" class="mini-textbox" emptyText="请输入昵称" style="width:150px;" onenter="onKeyEnter"/> 
                <a class="mini-button" iconCls="icon-search" plain="true" onclick="onSearch()">查询</a>
                </td>
            </tr>
        </table>
    </div>
    <!--撑满页面-->
    <div class="mini-fit" >
        
        <div id="datagrid1" class="mini-datagrid" style="width:100%;height:100%;" 
            url="${pageContext.request.contextPath}/userInfo/queryPage.do"  idField="userId"
            sizeList="[5,10,20,50]" pageSize="10"
        >
            <div property="columns">  
                	
                    <div field="userName" width="120"  align="center" headerAlign="center" >昵称
                    </div>      
                    <div field="accout" width="120"  align="center" headerAlign="center" >用户账号                        
                    </div>                
                    <div field="sex" width="100"  renderer="onGenderRenderer" align="center" headerAlign="center">性别
                    </div>            
                    <div field="idCard"  align="center" width="100" >身份证号
                    </div>
                    <div field="address"  align="center" width="100" >现居住地址
                    </div>                                    
                    <div field="relationway" width="100"  align="center" headerAlign="center"  >联系电话</div>  
                    <div field="userRegister"  align="center" width="100"  dateFormat="yyyy-MM-dd">注册时间</div>    
                     <div name="action" width="120" headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;">操作</div>                 
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
         function onActionRenderer(e) {
            var grid = e.sender;
            var record = e.record;
            var uid = record.userId;
            var rowIndex = e.rowIndex;

            var s =  '<a class="Delete_Button" href="javascript:delRow(\'' + uid + '\')">删除</a>';
                       
            return s;
        }
        function delRow(row_uid) {
                if (confirm("确定删除此记录？")) {
                    grid.loading("删除中，请稍后......");
                    $.ajax({
                        url: '${pageContext.request.contextPath}/userInfo/deleteUserInfo.do?userId=' + row_uid,
                        success: function (text) {
                            grid.reload();
                        },
                        error: function () {
                        }
                    });
                }
        }
    </script>

</body>
</html>