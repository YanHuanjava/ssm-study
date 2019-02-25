<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/1/8 0008
  Time: 20:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div>
    <form action="/file/save" method="post">
        <div>
            文件名： <input type="text" name="fileName">
        </div>
        <div>
            内容：
            <textarea name="content" id="" cols="30" rows="10"></textarea>
        </div>
        <input type="submit" value="保存">
    </form>
</div>
</body>
</html>
