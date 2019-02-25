<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/1/7 0007
  Time: 19:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>笔记管理</title>
    <script src="/js/jquery-3.2.1.min.js"></script>
    <script>
        <c:if test="${msg!=null}">
            alert('${msg}');
        <%--<c:remove var="${msg}"></c:remove>--%>
        </c:if>
    </script>
    <style>
        a{
            text-decoration: none;
            margin: 5px;
        }
    </style>
</head>
<body>
<form action="/file/list" style=" margin: 0px auto;width: 50%"><br><br>
    <input type="button"onclick="location.href='add'" value="添加笔记">
    <%--<input type="file" value="上传笔记">--%>
    <br><br><table border="1" style="width: 100%;text-align: center;border-collapse: collapse;padding: 5px">
        <tr>
            <th>序号</th>
            <th>笔记</th>
            <th>操作</th>
        </tr>
        <c:forEach items="${files.list}" var="item" varStatus="S">
            <tr>
                <td>${S.count}</td>
                <td>${item.name}</td>
                <td>
                    <c:if test="${item.name.indexOf('.txt')>0}">
                        <a href="edit?path=${item.name}">修改</a>
                    </c:if>
                    <a href="del?index=${S.index}">删除</a>
                    <a href="download?path=${item.name}">下载</a>
                </td>
            </tr>
        </c:forEach>
    </table>
</form>
</body>
</html>
