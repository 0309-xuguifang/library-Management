<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2021/7/14
  Time: 16:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
<style>
    .container{
        margin-top: 100px;
        padding: 0px;
    }
    .login-table{
        margin:0 auto;
        width:300px;
        height:200px;
        background:	#2F4F4F;
        color: aliceblue;
        border-radius: 0px 0px 10px 10px;
    }
    .login-center{
        margin: 0 auto;
        width:300px;
        height:3px;
        background:#778899;
    }
    .login-top{
        padding-top: 15px;
        border-radius: 20px 20px 0px 0px;
        margin:0 auto;
        width:300px;
        height:50px;
        line-height: 30px;
        background:	#2F4F4F;
        text-align: center;
        color:white;
        font:25px bolder white;
    }
    .error{
        color:red;
        font-family:"微软雅黑";
    }
    input{
        width:150px;
        height:25px;
        border-radius: 5px;
    }
    table{
        color: white;
        margin: 0 auto;
        padding-top: 30px;
    }
    .body{
        background: url("imgs/登录.jpg");
    }
    .input_login{
        width:100px;
        height:40px;
        background-color: steelblue;
        font:18px bold ;
        color:white;
    }
</style>
</head>
<body class="body">
<div class="container">
    <div class="login-top">欢迎登录职工管理系统</div>
    <div class="login-center"></div>
    <div class="login-table">
        <form action="LoginServlet"  method="post" >
            <%
                String  state= (String)session.getAttribute("state");
                session.removeAttribute("state");
                if(state!=null){
            %>
            <label class="error">账号或密码错误！</label>
            <%}%>
            <table border="0" width="150px" height="150px">
                <tr>
                    <td>账&nbsp;号:</td>
                    <td><input class="text" type="text" name="user_id"  placeholder="职工号"/></td>
                </tr>
                <tr><td></td></tr>
                <tr>
                    <td>密&nbsp;码:</td>
                    <td><input class="text" type="password" name="password"  placeholder="密码"/></td>
                </tr>
                <tr><td><span id="msg" style="font-size: 12px;color: red"></span></td></tr>
                <tr>
                    <td colspan="2" align="center"><input type="submit" class="input_login"  value="登&nbsp;&nbsp;&nbsp;&nbsp;录"/></td>
                </tr>
            </table>
        </form>
    </div>
</div>
</body>
</html>