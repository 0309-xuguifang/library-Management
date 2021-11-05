<%@ page import="Bean.Users" %>
<%@ page import="Dao.UserDao" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2021/7/19
  Time: 15:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>top_banner</title>
    <link type="text/css" rel="stylesheet" href="Salary.css" />
</head>
<body>
<%
    Users user = new Users();
    String id = (String)session.getAttribute("user_id");
    UserDao userdao = new UserDao();
    user = userdao.get_AidInfo2(id);
%>
<div class="banner">
    <div class="banner_left">&nbsp;&nbsp;&nbsp;&nbsp;员工工资管理系统</div>
    <div class="banner_right">
        <a href="login.jsp">退出</a>
        <a href="peInfo.jsp">个人资料</a>
        <a href="peInfo.jsp">欢迎，<% out.print(user.getUser_name());%></a>
    </div>
</div>
</body>
</html>
