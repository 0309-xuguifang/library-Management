<%@ page import="Bean.Users" %>
<%@ page import="Dao.UserDao" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2021/7/13
  Time: 8:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link type="text/css" rel="stylesheet" href="Salary.css" />
<html>
<head>
    <title>add-employee.jsp</title>
    <style>
        #accountNumShow,#pwdShow,#nameShow,#agShow,#phoShow{
            color: red;
        }
    </style>
</head>
<body>
<div calss="container">
    <jsp:include page="top_banner.jsp" flush="true"></jsp:include>
    <div calss="content">
        <div class="left_side">
            <a href="salary.jsp">薪资查看</a>
            <a href="user.jsp">账户管理</a>
            <a href="department.jsp">部门管理</a>
            <a href="salary-setting.jsp">薪资设置</a>
        </div>
        <div class="right_side">
            <form action="AddUserServlet" method="post" onsubmit="return checkFrom()">
            <div class="panel">
                <div class="add-text">
                    添加账户
                </div>
                <div class="add-content">
                    <div class="box1">
                        <label>账&nbsp;&nbsp;&nbsp;&nbsp;号：</label>
                        <input type="text" name="user_id" id="accountNum"/> <br>
                        <label id="accountNumShow"></label>
                    </div>
                    <div class="box1">
                        <label>密&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
                        <input type="text" name="password" id="pwd"/> <br>
                        <label id="pwdShow"></label>
                    </div>
                    <div class="box1">
                        <label>姓&nbsp;&nbsp;&nbsp;&nbsp;名：</label>
                        <input type="text" name="user_name" id="name"/> <br>
                        <label id="nameShow"></label>
                    </div>
                    <div class="box1">
                        <label>性&nbsp;&nbsp;&nbsp;&nbsp;别：</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" name="sex" id="sexMan" value="男" />男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="radio" name="sex" id="sexFeMale" value="女" checked="checked"/>女 <br>
                        <label id="sexShow"></label>
                    </div>
                    <div class="box1">
                        <label>年&nbsp;&nbsp;&nbsp;&nbsp;龄：</label>
                        <input type="text" name="age" id="ag"/> <br>
                        <label id="agShow"></label>
                    </div>
                    <div class="box1">
                        <label>电&nbsp;&nbsp;&nbsp;&nbsp;话：</label>
                        <input type="text" name="phone" id="pho"/> <br>
                        <label id="phoShow"></label>
                    </div>
                    <div class="box1">
                        <label>所属部门：</label>
                        <select name="department">
                            <option value="财务部">财务部</option>
                            <option value="人力资源部">人力资源部</option>
                            <option value="市场部">市场部</option>
                            <option value="研发部">研发部</option>
                            <option value="总裁办公室">总裁办公室</option>
                        </select>
                        <br>
                    </div>
                    <div class="box1">
                        <input id="add" class="RecOver_submit" type="submit" value="添加"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="user.jsp"><input class="RecOver_submit" type="button" value="返回"/></a>
                    </div>
                </div>
            </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">

    function checkFrom(){
        //每一次检验都要把错误提示初始化为空
        document.getElementById("accountNumShow").innerHTML="";
        document.getElementById("pwdShow").innerHTML="";
        document.getElementById("nameShow").innerHTML="";
        document.getElementById("agShow").innerHTML="";
        document.getElementById("phoShow").innerHTML="";
        document.getElementById("sexShow").innerHTML="";
        //通过id选择器获取到账户、姓名、密码、性别、年龄和电话的值
        var accountNum = document.getElementById("accountNum").value;
        var pwd = document.getElementById("pwd").value;
        var name = document.getElementById("name").value;
        var ag = document.getElementById("ag").value;
        var pho = document.getElementById("pho").value;
        var result = true;
        if (accountNum == ""){
            document.getElementById("accountNumShow").innerHTML = "账号不能为空！";
            result = false;
        }
        if (pwd == ""){
            document.getElementById("pwdShow").innerHTML = "密码不能为空！";
            result = false;
        }

        if (name == ""){
            document.getElementById("nameShow").innerHTML = "姓名不能为空！";
            result = false;
        }
        if (ag == ""){
            document.getElementById("agShow").innerHTML = "年龄不能为空！";
            result = false;
        }
        if (pho == ""){
            document.getElementById("phoShow").innerHTML = "电话不能为空！";
            result = false;
        }
        if (result == true){
            alert("添加成功！");
        }
        else{
            return result;
        }
    };
</script>
</body>
</html>
