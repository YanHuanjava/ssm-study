<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/1/3 0003
  Time: 0:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="/layui/css/layui.css?t=1545041465480" media="all">
    <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>

<table class="layui-table" lay-data="{url:'/teacher/editData', id:'test3'}" lay-filter="test3">
    <thead>
    <tr>
        <th lay-data="{field:'tno', sort: true}">ID</th>
        <th lay-data="{field:'tname', sort: true, edit: 'text'}">教师姓名</th>
        <th lay-data="{field:'tsex', edit: 'text'}">性别</th>
        <th lay-data="{field:'tbirthday', edit: 'text'}">生日</th>
        <th lay-data="{field:'tprof', sort: true, edit: 'text'}">职称</th>
        <th lay-data="{field:'tdepart', sort: true, edit: 'text'}">院系</th>
    </tr>
    </thead>
</table>


<script src="/layui/layui.js?t=1545041465480"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
    layui.use('table', function(){
        var table = layui.table;

        //监听单元格编辑
        table.on('edit(test3)', function(obj){
            var value = obj.value //得到修改后的值
                ,data = obj.data //得到所在行所有键值
                ,field = obj.field; //得到字段
            layer.msg('[ID: '+ data.id +'] ' + field + ' 字段更改为：'+ value);
        });
    });
</script>

</body>
</html>
