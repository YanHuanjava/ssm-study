<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/12/28
  Time: 15:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <title>layui 实现 userlist</title>
    <link rel="stylesheet" href="/layui/css/layui.css?t=1545041465480" media="all">
    <style>
        body{margin: 10px;}
    </style>

</head>
<body>

<div class="demoTable">
    <div class="layui-form-item">
        用户名:
        <div class="layui-inline">
            <input class="layui-input" name="tname" id="tname" autocomplete="off">
        </div>
        生日:
        <div class="layui-inline">
            <input type="text" id="tbirthday" name="tbirthday" autocomplete="off" class="layui-input mydate">
        </div>
        职称:
        <div class="layui-inline">
            <input class="layui-input" name="tprof" id="tprof" autocomplete="off">
        </div>
        部门:
        <div class="layui-inline">
            <input class="layui-input" name="tdepart" id="tdepart" autocomplete="off">
        </div>
        <div class="layui-inline">
            <button class="layui-btn" data-type="reload">搜索</button>
        </div>
    </div>
</div>
<table class="layui-hide" id="demo"  lay-data="{id: 'idTest'}" lay-filter="test"></table>

<script type="text/html" id="barDemo">
    <a class="layui-btn layui-btn-primary layui-btn-xs" lay-event="detail">查看</a>
    <a class="layui-btn layui-btn-xs" lay-event="edit">编辑</a>
    <a class="layui-btn layui-btn-danger layui-btn-xs" lay-event="del">删除</a>
</script>

<script src="/layui/layui.js?t=1545041465480"></script>
<script>


    layui.use(['laydate', 'laypage', 'layer', 'table','element','jquery'], function(){
        //当js插件加载完成，回调方法
        var laydate = layui.laydate //日期
            ,laypage = layui.laypage //分页
            ,layer = layui.layer //弹层
            ,table = layui.table //表格
            ,element = layui.element
            ,$ = layui.jquery;

        $(".mydate").each(function () {
            laydate.render({
                elem: this//指定元素
            });
        })

        $('.demoTable .layui-btn').on('click', function(){
            //表格执行重载
            table.reload('mytable', {
                page: {
                    curr: 1 //重新从第 1 页开始
                }
                ,where: {
                    'tname': $("#tname").val(),
                    'tbirthday': $("#tbirthday").val(),
                    'tprof': $("#tprof").val(),
                    'tdepart': $("#tdepart").val()
                }
            });
        });

        //监听Tab切换
        element.on('tab(demo)', function(data){
            layer.tips('切换了 '+ data.index +'：'+ this.innerHTML, this, {
                tips: 1
            });
        });

        //执行一个 table 实例
        table.render({
            elem: '#demo'
            ,height: 420
            ,url: '/teacher/list' //数据接口
            ,title: '教师表'
            ,page: true //开启分页
            ,limits: [3,5,10] //每页条数的选择项
            ,limit: 5 //每页默认显示的数量
            ,toolbar: 'default' //开启工具栏，此处显示默认图标，可以自定义模板，详见文档
            ,totalRow: true //开启合计行
            ,cols: [[ //表头
                {type: 'checkbox', fixed: 'left'}
                ,{field: 'tno', title: 'ID', sort: true, fixed: 'left'}
                ,{field: 'tname', title: '教师姓名'}
                ,{field: 'tsex', title: '性别', sort: true}
                ,{field: 'tbirthday', title: '生日',  sort: true}
                ,{field: 'tprof', title: '职称', sort: true}
                ,{field: 'tdepart', title: '院系', sort: true}
                ,{fixed: 'right', align:'center', toolbar: '#barDemo'}
            ]],
            id:"mytable"
        });

        //监听头工具栏事件
        table.on('toolbar(test)', function(obj){
            var checkStatus = table.checkStatus(obj.config.id)
                ,data = checkStatus.data; //获取选中的数据!!!!!!!

            switch(obj.event){
                case 'add':
                    layer.open({
                        type:2,  //  2 对应iframe的窗口
                        content:"/teacher/add",
                        area:['400px','60%']
                    });
                    break;
                case 'update':
                    if(data.length === 0){
                        layer.msg('请选择一行');
                    }
//                    else if(data.length > 1){
//                        layer.msg('只能同时编辑一个');
//                    }
                    else {
                        layer.open({
                                type:2,  //  2 对应iframe的窗口
                                content:"multiDetail",
                                data:{obj:JSON.stringify(data)},
                                area:['600px','400px']
                            });
                    }
                    break;
                case 'delete':
                    if(data.length === 0){
                        layer.msg('请选择一行');
                    } else {
                        var tnos = [];
                        for (i in data){
                            tnos.push(data[i].tno);
                        }
                        console.log(tnos);
                        $.ajax({
                            url:"multidel",
                            data:{'tnos[]':tnos},
                            dataType:'json',
                            success:function (result) {
                                layer.msg(result.msg);
                                table.reload('mytable', {
                                    url: '/teacher/list'
                                });
                            },
                            error:function () {
                                layer.msg("删除失败");
                            }
                        });

                    }
                    break;
            };
        });

        //监听行工具事件
        table.on('tool(test)', function(obj){ //注：tool 是工具条事件名，test 是 table 原始容器的属性 lay-filter="对应的值"
            var data = obj.data //获得当前行数据
                ,layEvent = obj.event; //获得 lay-event 对应的值
            if(layEvent === 'detail'){
                layer.open({
                    type:2,  //  2 对应iframe的窗口
                    content:"detail/"+data.tno,
//                    btn:'父页面的关闭',
                    area:['300px','400px']
                })
            } else if(layEvent === 'del'){
                layer.confirm('真的删除行么', function(index){
                    $.ajax({
                        url:"del/"+data.tno,
                        data:{userId:data.userId},
                        dataType:'text',
                        success:function (result) {
//                            console.log(result);
                            table.reload('mytable', {
                                url: '/teacher/list'
                            });
                        }
                    });
                    layer.close(index);
                    //向服务端发送删除指令
                });
            } else if(layEvent === 'edit'){
                userId = data.userId;
                layer.open({
                    type:2,  //  2 对应iframe的窗口
                    title: false, //不显示标题栏
                    content:"edit/"+data.tno,
                    area:['400px','70%']
                })
            }
        });
    });
</script>
</body>
</html>