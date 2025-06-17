<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>会员列表</title>
</head>
<body>
<h1>会员列表</h1>
<table>
    <tr>
        <th>会员编号</th>
        <th>会员姓名</th>
        <th>联系电话</th>
        <th>会员积分</th>
        <th>入会日期</th>
        <th>会员状态</th>
        <th>操作</th>
    </tr>
    <c:forEach items="${members}" var="member">
        <tr>
            <td>${member.mId}</td>
            <td>${member.mName}</td>
            <td>${member.mPhone}</td>
            <td>${member.mPoints}</td>
            <td>${member.mJoinDate}</td>
            <td>${member.mState == 0 ? '正常' : '冻结'}</td>
            <td>
                <a href="#">编辑</a>
                <a href="#" onclick="deleteMember('${member.mId}')">删除</a>
            </td>
        </tr>
    </c:forEach>
</table>
<a href="${pageContext.request.contextPath}/member/add">添加会员</a>
<script>
    function deleteMember(mId) {
        if (confirm("确定要删除该会员吗？")) {
            window.location.href = "${pageContext.request.contextPath}/member/delete?mIds=" + mId;
        }
    }
</script>
</body>
</html>