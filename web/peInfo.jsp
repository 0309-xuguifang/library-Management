<%@ page import="Bean.Users" %>
<%@ page import="Dao.UserDao" %>
<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2021/7/18
  Time: 11:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>个人资料信息</title>
    <link type="text/css" rel="stylesheet" href="Salary.css" />
</head>
<body>
<%
    Users user = new Users();
    String id = (String)session.getAttribute("user_id");
    UserDao userdao = new UserDao();
    user = userdao.get_AidInfo2(id);
%>
<script>
    function backAndFresh(){
        var url =document.referrer;
        window.location=url;
    }
</script>
<div calss="container">
    <jsp:include page="top_banner.jsp" flush="true"></jsp:include>
    <div calss="content">
        <div class="right_side">
            <div class="peInfo">
                <div class="info">
                    个人资料
                </div>
                <div class="box1">
                    <label>姓&nbsp;&nbsp;&nbsp;&nbsp;名：</label>
                    <input type="text" name="name" value='<% out.print(user.getUser_name());%>'/>
                </div>
                <div class="box1">
                    <label>性&nbsp;&nbsp;&nbsp;&nbsp;别： </label>
                    <input type="text" name="email" value='<% out.print(user.getSex());%>'/>
                </div>
                <div class="box1">
                    <label>年&nbsp;&nbsp;&nbsp;&nbsp;龄： </label>
                    <input type="text" name="phone" value='<% out.print(user.getAge());%>'/>
                </div>
                <div class="box1">
                    <label>电&nbsp;&nbsp;&nbsp;&nbsp;话： </label>
                    <input type="text" name="phone" value='<% out.print(user.getPhone());%>'/>
                </div>
                <div class="box1">
                    <input class="RecOver_submit" onclick="backAndFresh()" type="button" value="返回" />
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
