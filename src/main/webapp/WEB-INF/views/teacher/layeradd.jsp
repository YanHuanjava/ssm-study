<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/29 0029
  Time: 21:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>添加教师</title>
    <link rel="stylesheet" href="/layui/css/layui.css?t=1545041465480" media="all">
    <style>
        body{margin: 10px;}
    </style>
</head>
<body>
<form class="layui-form layui-form-pane" action="">
    <div class="layui-form-item">
        <label class="layui-form-label">姓名</label>
        <div class="layui-input-inline">
            <input type="text" name="tname" lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item" pane="">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-block">
            <input type="radio" name="tsex" value="男" title="男" checked="">
            <input type="radio" name="tsex" value="女" title="女">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">生日</label>
            <div class="layui-input-block">
                <input type="text" name="tbirthday" id="tbirthday" autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">职称</label>
        <div class="layui-input-inline">
            <input type="text" name="tprof" lay-verify="required" placeholder="请输入职称" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">部门</label>
        <div class="layui-input-inline">
            <input type="text" name="tdepart" lay-verify="required" placeholder="请输入部门" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-col-sm3" style="text-align: center">
        <button class="layui-btn grid-demo" lay-submit="" lay-filter="demo1">提交</button>
    </div>
</form>

<script src="/layui/layui.js" charset="utf-8"></script>
<script>
    layui.use(['form', 'layedit', 'laydate'], function(){
        var form = layui.form
            ,layer = layui.layer
            ,layedit = layui.layedit
            ,laydate = layui.laydate
            ,$ = layui.jquery;

        //日期
        laydate.render({
            elem: '#tbirthday'
        });

        //监听提交
        form.on('submit(demo1)', function(data){
            console.log(data.field);
            $.ajax({
                url:"add",
                type:"post",
                data:data.field,
                dataType:"text",
                success:function () {
                    layer.msg("添加成功");
                    window.setTimeout(function () {
                        window.parent.location.reload();
                    },1000)
                },
                error:function () {
                    layer.msg("添加失败");
                }
            });
            return false;
        });
    });
</script>

</body>
</html>
