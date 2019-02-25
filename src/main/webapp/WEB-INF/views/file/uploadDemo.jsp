<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/28 0028
  Time: 10:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>文件上传</title>
</head>
<body>
<form action="/file/upload" method="post" enctype="multipart/form-data">
    <div>用户名：<input type="text" name="userName"></div>
    <div>密码：<input type="text" name="userPsw"></div>
    <input type="file" name="myFile1"><br>
    <input type="file" name="myFile2"><br>
    <input type="file" name="myFile3"><br>
    <input type="submit" value="上传">
    <a href="/file/download/yanhuan">文件下载</a>
</form>
</body>
</html>
