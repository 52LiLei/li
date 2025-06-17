<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>编辑会员</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link rel="stylesheet" href="/static/css/font.css">
    <link rel="stylesheet" href="/static/css/xadmin.css">
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script type="text/javascript" src="/static/lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="/static/js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<div class="x-body">
    <form class="layui-form" action="/member/update" method="post">
        <input type="hidden" name="id" value="${member.id}">
        <div class="layui-form-item">
            <label class="layui-form-label">会员编号</label>
            <div class="layui-input-block">
                <input type="text" name="id" required  lay-verify="required" value="${member.id}" autocomplete="off" class="layui-input" readonly>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">会员姓名</label>
            <div class="layui-input-block">
                <input type="text" name="name" required  lay-verify="required" value="${member.name}" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">会员电话</label>
            <div class="layui-input-block">
                <input type="text" name="phone" required  lay-verify="required" value="${member.phone}" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">会员积分</label>
            <div class="layui-input-block">
                <input type="text" name="points" required  lay-verify="required" value="${member.points}" autocomplete="off" class="layui-input">
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </form>
</div>
<script>
    layui.use('form', function(){
        var form = layui.form;

        // 监听提交
        form.on('submit(formDemo)', function(data){
            // 提交表单
            return true;
        });
    });
</script>
</body>
</html>