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
    <form id="selectBook" method="post">     
        <fieldset style="border:solid 1px #aaa;padding:3px;">
            <legend >查询条件</legend>
            <div style="padding:5px;">
        <table>
             <tr>
                  <td width="70">预约状态：</td>
                  <td width="350">    
                   	<select name="bookingState" id="t_bookingState" class="mini-combobox">
                        <option value="预约成功">预约成功</option>
                        <option value="取号成功">取号成功</option>
                    </select
                  </td>
                  <td width="70">挂号时间：</td>
                  <td width="350">    
                      <input name="booknow" id="t_booknow" class="mini-datepicker" format="yyyy-MM-dd" />
                  </td>
                <td width="70">姓名：</td>
                <td width="350">    
                    <input name="bookName" id="t_bookName" class="mini-textbox" />
                </td>
            </tr>  
            <tr>
                <td >身份证号：</td>
                <td >    
                    <input name="bookIdCard" id="t_bookIdCard" class="mini-textbox" />
                </td>
                <td >电话 ：</td>
                <td >    
                    <input name="bookNum" id="t_bookNum" class="mini-textbox" />
                </td>
                <td >地址：</td>
                <td >    
                    <input name="bookAddress" id="t_bookAddress" class="mini-textbox" />
                </td>
            
            </tr>        
        </table>            
            </div>
        <div style="text-align:right;padding:10px;">               
             <a class="mini-button" onclick="onSearch()">查询</a>      
        </div>        
        </fieldset>
    </form>
    

    <!--撑满页面-->
    <div class="mini-fit" >
        
        <div id="datagrid1" class="mini-datagrid" style="width:100%;height:100%;" 
            url="${pageContext.request.contextPath}/booking/queryPage.do"  idField="bookId"
            sizeList="[5,10,20,50]" pageSize="10"
        >
          <div property="columns">  
                    <div field="bookingState" width="120"  align="center" headerAlign="center" >预约状态
                    </div>      
                    <div field="booknow" width="120"  align="center" headerAlign="center" dateFormat="yyyy-MM-dd hh:mi:ss">挂号时间           
                    </div> 
                    <div field="bookName" width="120"  align="center" headerAlign="center" >姓名                  
                    </div> 
                    <div field="bookIdCard" width="120"  align="center" headerAlign="center" >身份证号               
                    </div> 
                    <div field="bookNum" width="120"  align="center" headerAlign="center" >电话                  
                    </div> 
                     <div field="bookAddress" width="120"  align="center"  headerAlign="center" >地址                    
                    </div> 
                     <div name="action" width="120" headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;">操作</div>     
                </div>
        </div> 

    </div>
    <script type="text/javascript">
        mini.parse();
        var grid = mini.get("datagrid1");
        var form = new mini.Form("selectBook");
        grid.load();

        function onSearch() {
        var params = getSubmitParams("[id^='t_']");
		var params1 = {data:$.toJSON(params)};   
         grid.load(params1);
        }
         function onActionRenderer(e) {
            var grid = e.sender;
            var record = e.record;
            var uid = record.bookingId;
			 var s ="";
			if("取号成功"==record.bookingState){
				s='<a class="Delete_Button" href="javascript:delRow(\'' + uid + '\')">删除</a>';
			}else{
            	s =  '<a class="Delete_Button" href="javascript:edit(\'' + uid + '\')">取号</a>&nbsp;&nbsp;&nbsp;'+
            		'<a class="Delete_Button" href="javascript:delRow(\'' + uid + '\')">删除</a>';
			}
            return s;
        }
        function edit(row_uid) {

                $.ajax({
                    url: "${pageContext.request.contextPath}/booking/updateBookingQ.do?bookingId=" + row_uid,
                    cache: false,
                    success: function (text) {
                      mini.alert(text);
                       grid.reload();
                    }
                });
       
        }
        function delRow(row_uid) {
                if (confirm("确定删除此记录？")) {
                    grid.loading("删除中，请稍后......");
                    $.ajax({
                        url: '${pageContext.request.contextPath}/booking/deleteBooking.do?bookingId=' + row_uid,
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