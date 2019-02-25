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
    <title>查看教师信息</title>
    <link rel="stylesheet" href="/layui/css/layui.css?t=1545041465480" media="all">
    <style>
        table tr td{
            text-align: center;
        }
    </style>
</head>
<body>
<table class="layui-table" lay-skin="line">
    <thead>
    <tr>
        <th colspan="2" style="text-align: center">教师详细信息</th>
    </tr>
    </thead>
    <tbody>
    <tr>
        <td>姓名：</td>
        <td id="tname"></td>
    </tr>
    <tr>
        <td>性别：</td>
        <td id="tsex"></td>
    </tr>
    <tr>
        <td>生日：</td>
        <td id="tbirthday"></td>
    </tr>
    <tr>
        <td>职称：</td>
        <td id="tprof"></td>
    </tr>
    <tr>
        <td>部门：</td>
        <td id="tdepart"></td>
    </tr>
    </tbody>
</table>
<div style="text-align: center">
    <td colspan="2"><button class="layui-btn" onclick="close1()">关闭</button></td>
</div>
<script src="/layui/layui.js?t=1545041465480"></script>
<script src="/js/jquery-3.2.1.min.js"></script>
<script>
    layui.use('form', function(){
        var form = layui.form
            ,$ = layui.jquery;
        var userId = eval('('+parent.userId+')');

            $("#tname").text("${t.tname}");
            $("#tsex").text("${t.tsex}");
            $("#tbirthday").text("<fmt:formatDate value="${t.tbirthday}" pattern="yyyy-MM-dd"/>");
            $("#tprof").text("${t.tprof}");
            $("#tdepart").text("${t.tdepart}");
    });
    function close1() {
        var index = parent.layer.getFrameIndex(window.name);
        parent.layer.close(index);//关闭当前页
    }
</script>