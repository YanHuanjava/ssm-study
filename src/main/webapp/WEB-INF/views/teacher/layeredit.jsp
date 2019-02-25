<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/28 0028
  Time: 19:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>修改用户</title>
    <link rel="stylesheet" href="/layui/css/layui.css?t=1545041465480" media="all">
</head>
<body>
<form class="layui-form" action="">
    <input type="hidden" name="tno" value="${t.tno}">
    <div class="layui-form-item">
        <label class="layui-form-label">名字</label>
        <div class="layui-input-block">
            <input type="text" value="${t.tname}" name="tname" lay-verify="title" autocomplete="off" placeholder="请输入标题" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-block">
            <input type="radio" ${t.tsex=='男'?"checked":""} name="tsex" value="男" title="男" checked="">
            <input type="radio" ${t.tsex=='女'?"checked":""} name="tsex" value="女" title="女">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">生日</label>
        <div class="layui-input-block">
            <input type="text" name="tbirthday" id="tbirthday" autocomplete="off"
                   value="<fmt:formatDate value="${t.tbirthday}" pattern="yyyy-MM-dd"/>" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">职称</label>
        <div class="layui-input-block">
            <input type="text" value="${t.tprof}" name="tprof" placeholder="请输入" autocomplete="off" class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">部门</label>
            <div class="layui-input-inline">
                <input type="tel" value="${t.tdepart}" name="tdepart" autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit="" lay-filter="demo1">立即提交</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>
<script src="/layui/layui.js?t=1545041465480"></script>
<script src="/js/jquery-3.2.1.min.js"></script>
<script>
    layui.use(['laydate', 'form','jquery','layer'], function(){
        //当js插件加载完成，回调方法
        var laydate = layui.laydate //日期
            ,form = layui.form //
            ,layer = layui.layer
            ,$ = layui.jquery;

        laydate.render({
            elem: '#tbirthday'
        });

        form.on('submit(demo1)', function(data){
            $.ajax({
                url:"/teacher/edit",
                data:data.field,
                type:"post",
                dataType:'json',
                success:function (result) {
                    layer.msg(result.msg,{
                        icon:1,
                        time:1000
                    },function () {
//                        window.close();
                        window.parent.location.reload();
                    })
                },
                error:function () {
                    layer.msg("修改失败");
                }
            });
            return false;
        });
    });

</script>