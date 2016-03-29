<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ page isELIgnored="false" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>字典管理</title>
 <style type="text/css">
    body{
        margin:0;padding:0;border:0;width:100%;height:100%;overflow:hidden;
    }    
    </style>  
		<script src="${pageContext.request.contextPath}/scripts/boot.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/scripts/jquery.json-2.3.min.js" type="text/javascript"></script>
</head>
	<body>
   
    
<div class="mini-splitter" style="width:100%;height:100%;">
    <div size="240" showCollapseButton="true">
        <div class="mini-toolbar" style="padding:2px;border-top:0;border-left:0;border-right:0;">                
            <span style="padding-left:5px;">名称：</span>
            <input class="mini-textbox" />
            <a class="mini-button" iconCls="icon-search" plain="true">查找</a>                  
        </div>
        <div class="mini-fit">
            <ul id="dictTree" class="mini-tree" url="${pageContext.request.contextPath}/dict/getAllDictList.do" style="width:100%;"
                showTreeIcon="true" textField="dictName" idField="dictId" parentField="parentId" resultAsTree="false"
            >        
            </ul>
        </div>
        
    </div>
    <div showCollapseButton="true">
        <div class="mini-toolbar" style="padding:2px;border-top:0;border-left:0;border-right:0;">                            
          <table style="width:100%;">
                <tr>
                    <td style="width:100%;">
                        <a class="mini-button" iconCls="icon-add" onclick="add()">增加</a>
                        <a class="mini-button" iconCls="icon-add" onclick="edit()">编辑</a>
                        <a class="mini-button" iconCls="icon-remove" onclick="remove()">删除</a>       
                    </td>
                    <td style="white-space:nowrap;">
                        <input id="key" class="mini-textbox" emptyText="请输入部门名称" style="width:150px;" onenter="onKeyEnter"/>   
                        <a class="mini-button" onclick="search()">查询</a>
                    </td>
                </tr>
            </table>                     
        </div>
        <div class="mini-fit" >
            <div id="dictgrid" class="mini-datagrid" style="width:100%;height:100%;"
                borderStyle="border:0;"
                url="${pageContext.request.contextPath}/menu/querymenuLastList.do" multiSelect="true" allowResize="true"
                showFilterRow="true" allowCellSelect="true" allowCellEdit="true"                
            >
                <div property="columns">    
                	<div type="checkcolumn" ></div>         
                    <div field="menuName" width="120"  align="center" headerAlign="center" allowSort="true">菜单名称
                    </div>      
                    <div field="menuUrl" width="120"  align="center" headerAlign="center" allowSort="true">菜单连接                        
                        <input id="nameFilter" property="filter" class="mini-textbox" onvaluechanged="onNameFilterChanged" style="width:100%;" />
                    </div>                
                    <div field="parentId" width="100" allowSort="true" renderer="onGenderRenderer" align="center" headerAlign="center">菜单父级ID
                    </div>            
                    <div field="menuType"  align="center" width="100" allowSort="true">菜单类型
                    </div>
                    <div field="menuDesc"  align="center" width="100" allowSort="true">排序号
                    </div>                                    
                </div>
            </div>
        </div>
    </div>

</div>
    <input  type="hidden" id="dictId"/>
    <script type="text/javascript">
        mini.parse();

        var tree = mini.get("dictTree");
        var grid = mini.get("dictgrid");

        tree.on("nodeselect", function (e) {
            if (e.isLeaf) {
                grid.load({ dictId: e.node.dictId });
                $("#dictId").val(e.node.dictId);
            } else {
               grid.load({ dictId: e.node.dictId });
               $("#dictId").val(e.node.dictId);
            }
        });
        //////////////////////////////////////////////
        
        function onNameFilterChanged(e) {
            var textbox = e.sender;
            var key = textbox.getValue();
            
            var node = tree.getSelectedNode();
            if (node) {
                grid.load({ dept_id: node.id, key: key });
            }
        }
        function add() {
                mini.open({
                    url: "${pageContext.request.contextPath}/view/dicteditadd.jsp",
                    title: "新增字典项", width: 500, height: 210,
                    onload: function () {
                        var iframe = this.getIFrameEl();
                        var dictId = $("#dictId").val();
                        var data = { action: "add",dictId:menuId};
                        iframe.contentWindow.SetData(data);
                    },
                    ondestroy: function (action) {
                        grid.reload();
                        tree.reload();

                    }
                });
        }
       
        function saveData() {
            var data = grid.getChanges();
            var json = mini.encode(data);
            grid.loading("保存中，请稍后......");
            $.ajax({
                url: "../data/AjaxService.aspx?method=SaveEmployees",
                data: { data: json },
                type: "post",
                success: function (text) {
                    grid.reload();
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert(jqXHR.responseText);
                }
            });
        }
    </script>

</body>
</html>