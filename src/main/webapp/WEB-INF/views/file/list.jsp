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
        <c:forEach items="${p.list}" var="item" varStatus="S">
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
    <script>
        function go(page) {
            if (page > 0) {
                $("input[name=currentPage]").val(page);
                $("form").submit();
            }
        }
    </script>
    <br><br>
    <div align="center">
        <input type="hidden" name="currentPage">
        <c:if test="${p.currentPage==1}">
            <a style="color: black;text-decoration: none;cursor: pointer;">首页</a>
            <a style="color: black;text-decoration: none;cursor: pointer;">上一页</a>
        </c:if>
        <c:if test="${p.currentPage>1}">
            <a href="javascript:go(1);">首页</a>
            <a href="javascript:go(${p.currentPage-1});">上一页</a>
        </c:if>

        当前页数:[${p.currentPage}/${p.totalPage}]&nbsp;

        <c:if test="${p.currentPage==p.totalPage}">
            <a style="color: black;text-decoration: none;cursor: pointer;">下一页</a>
            <a style="color: black;text-decoration: none;cursor: pointer;">末页</a>
        </c:if>
        <c:if test="${p.currentPage<p.totalPage}">
            <a href="javascript:go(${p.currentPage+1});">下一页</a>
            <a href="javascript:go(${p.totalPage});">末页</a>
        </c:if>
    </div>
</form>
</body>
</html>
