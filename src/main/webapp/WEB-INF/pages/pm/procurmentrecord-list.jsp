<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>liLei小型超市收银系统</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport"
          content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi"/>
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon"/>
    <link rel="stylesheet" href="/static/css/font.css">
    <link rel="stylesheet" href="/static/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/static/js/xadmin.js"></script>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="layui-anim layui-anim-up">
<div class="x-nav">
      <span class="layui-breadcrumb">
        <a href="">首页</a>
        <a>
          <cite>订单列表</cite></a>
      </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right"
       href="javascript:location.replace(location.href);" title="刷新">
        <i class="layui-icon" style="line-height:30px">ဂ</i></a>
</div>
<div class="x-body">
    <div class="layui-row">
        <form class="layui-form layui-col-md12 x-so">
            <input class="layui-input" placeholder="开始日" name="start" id="start">
            <input class="layui-input" placeholder="截止日" name="end" id="end">
            <input type="text" name="username" placeholder="请输入订单编号" autocomplete="off" class="layui-input">
            <button class="layui-btn" lay-submit="" lay-filter="sreach"><i class="layui-icon">&#xe615;</i></button>
        </form>
    </div>
    <xblock>
        <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>删除</button>
        <button class="layui-btn"
                onclick="x_admin_show('添加员工','${pageContext.request.contextPath}/empl/add',1000,550)"><i
                class="layui-icon"></i>添加
        </button>
        <span class="x-right" style="line-height:40px">共有数据：${pageInfo.total} 条</span>
    </xblock>
    <table class="layui-table layui-form">
        <thead>
        <tr>
            <th>
                <div class="layui-unselect header layui-form-checkbox" lay-skin="primary"><i
                        class="layui-icon">&#xe605;</i></div>
            </th>
            <th>上货编号</th>
            <th>商品编号</th>
            <th>员工编号</th>
            <th>上货数量</th>
            <th>上货时间</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>

        <c:forEach items="${pageInfo.list}" var="pm">
            <tr>
                <td>
                    <div class="layui-unselect layui-form-checkbox" lay-skin="primary"><i
                            class="layui-icon">&#xe605;</i></div>
                </td>
                <th>${pm.egNo}</th>
                <th>${pm.GNo}</th>
                <th>${pm.EId}</th>
                <th>${pm.exhibitNo}</th>
                <th>${pm.exhibitTime}</th>
                <td class="td-manage">
                    <button class="layui-btn layui-btn layui-btn-xs"
                            onclick="x_admin_show('修改','${pageContext.request.contextPath}/empl/edit',600,400)"><i
                            class="layui-icon">&#xe642;</i>修改
                    </button>
                    <button class="layui-btn layui-btn-normal layui-btn-xs"
                            onclick="x_admin_show('查看','employee-detail.html',600,400)"><i
                            class="layui-icon">&#xe642;</i>查看
                    </button>
                    <button class="layui-btn-danger layui-btn layui-btn-xs" onclick="member_del(this,'要删除的id')"
                            href="javascript:;"><i class="layui-icon">&#xe640;</i>删除
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div class="page">
        <div>
            <c:if test="${pageInfo.hasPreviousPage}">
                <a class="prev" href="${pageContext.request.contextPath}/pm/list?page=${pageInfo.prePage}">&lt;&lt;</a>
            </c:if>
            <c:forEach items="${pageInfo.navigatepageNums}" var="pageNum">
                <c:if test="${pageNum == pageInfo.pageNum}">
                    <span class="current">${pageNum}</span>
                </c:if>
                <c:if test="${pageNum != pageInfo.pageNum}">
                    <a class="num" href="${pageContext.request.contextPath}/pm/list?page=${pageNum}">${pageNum}</a>
                </c:if>
            </c:forEach>
            <c:if test="${pageInfo.hasNextPage}">
                <a class="next" href="${pageContext.request.contextPath}/pm/list?page=${pageInfo.nextPage}">&gt;&gt;</a>
            </c:if>
        </div>
    </div>

</div>
<script>

    layui.use('laydate', function () {
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#end' //指定元素
        });
    });

    // 主要是监听复选框
    layui.use('form', function () {
        // 拿到form对象
        var form = layui.form;
        form.on("switch(state)", function (data) {
            console.log(data.elem.checked);
            // 获取状态值
            var state = data.elem.checked ? 1 : 0;
            // 获取员工编号
            var checkbox = data.elem;
            var gtNo = $(checkbox).attr("gtNo");
            // 通过ajax 去访问后台更新状态
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/gdt/update/state",
                data: {gtNo: gtNo, status: state},
                dataType: "json",
                success: function (data) {
                    console.log(data)
                    var prev = $(checkbox).parent().prev().prev()
                    prev.text(state == 1 ? "热销" : "促销");

                }
            });
        })
    });


    /*用户-停用*/
    function member_stop(obj, id) {
        layer.confirm('确认要停用吗？', function (index) {

            if ($(obj).attr('title') == '启用') {

                //发异步把用户状态进行更改
                $(obj).attr('title', '停用')
                $(obj).find('i').html('&#xe62f;');

                $(obj).parents("tr").find(".td-status").find('span').addClass('layui-btn-disabled').html('已停用');
                layer.msg('已停用!', {icon: 5, time: 1000});

            } else {
                $(obj).attr('title', '启用')
                $(obj).find('i').html('&#xe601;');

                $(obj).parents("tr").find(".td-status").find('span').removeClass('layui-btn-disabled').html('已启用');
                layer.msg('已启用!', {icon: 5, time: 1000});
            }

        });
    }

    /*用户-删除*/
    function member_del(obj, id) {
        layer.confirm('确认要删除吗？', function (index) {
            //发异步删除数据
            $(obj).parents("tr").remove();
            layer.msg('已删除!', {icon: 1, time: 1000});
        });
    }

    //批量删除
    function delAll(argument) {

        var data = tableCheck.getData();
        data = data.join(",");
        layer.confirm('确认要删除吗？' + data, function (index) {
            //捉到所有被选中的，发异步进行删除
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/empl/delete",
                data: {eIds: data},
                dataType: "json",
                success: function (data) {
                    layer.msg('删除成功', {icon: 1});
                    $(".layui-form-checked").not('.header').parents('tr').remove();
                }
            });
        });
    }


</script>

</body>
</html>
