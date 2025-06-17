<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>添加会员</title>
</head>
<body>
<h1>添加会员</h1>
<form action="${pageContext.request.contextPath}/member/add/action" method="post">
    <label for="mId">会员编号：</label>
    <input type="text" id="mId" name="mId"><br>
    <label for="mName">会员姓名：</label>
    <input type="text" id="mName" name="mName"><br>
    <label for="mPhone">联系电话：</label>
    <input type="text" id="mPhone" name="mPhone"><br>
    <label for="mPoints">会员积分：</label>
    <input type="text" id="mPoints" name="mPoints"><br>
    <label for="mState">会员状态：</label>
    <select id="mState" name="mState">
        <option value="0">正常</option>
        <option value="1">冻结</option>
    </select><br>
    <input type="submit" value="添加">
</form>
</body>
</html>