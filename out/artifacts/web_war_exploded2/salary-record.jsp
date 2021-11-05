<%@ page import="Bean.Users" %>
<%@ page import="Dao.UserDao" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2021/7/21
  Time: 13:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>salary-record.jsp</title>
  <link type="text/css" rel="stylesheet" href="Salary.css" />
</head>
<body>
<%
  Users user = new Users();
  String id = (String)session.getAttribute("user_id");
  UserDao userdao = new UserDao();
  user = userdao.get_AidInfo2(id);
%>
<div calss="container">
  <jsp:include page="top_banner.jsp" flush="true"></jsp:include>
  <div calss="content">
    <div class="left_side">
      <a href="salary.jsp">个人账户</a>
      <a href="adminSalary.jsp">薪资查看</a>
      <a href="user.jsp">账户管理</a>
      <a href="department.jsp">部门管理</a>
      <a href="salary-setting.jsp">薪资设置</a>
      <a href="salary-record.jsp">奖惩录入</a>
    </div>
    <div class="right_side">
    </div>
  </div>
</div>
</body>
</html>
