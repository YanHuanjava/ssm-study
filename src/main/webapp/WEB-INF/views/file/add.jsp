<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/1/7 0007
  Time: 19:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加笔记</title>
</head>
<body>
<br><br>
<h1 style="text-align: center">添加笔记</h1>
<form action="/file/add" method="post"style="text-align:center;margin: 0px auto;width: 50%;margin-top: 50px;">
    <input type="submit"><br><br>
    <div>文件名：<input type="text" name="fileName"></div><br>
    <textarea name="note" id="" cols="30" rows="10"></textarea>
</form>
</body>
</html>
