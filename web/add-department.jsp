<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2021/7/24
  Time: 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link type="text/css" rel="stylesheet" href="Salary.css" />
<html>
<head>
    <title>add-department.jsp</title>
    <style>
        #didShow,#dnameShow{
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
            <form action="AddDepServlet" method="post" onsubmit="return checkFrom()">
                <div class="panel">
                    <div class="add-text">
                        添加部门
                    </div>
                    <div class="add-content">
                        <div class="box1">
                            <label>部门编号：</label>
                            <input type="text" name="did" id="did"/> <br>
                            <label id="didShow"></label>
                        </div>
                        <div class="box1">
                            <label>部门名称：</label>
                            <input type="text" name="dname" id="dname"/> <br>
                            <label id="dnameShow"></label>
                        </div>

                        <div class="box1">
                            <input class="RecOver_submit" type="submit" value="添加"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="department.jsp"><input class="RecOver_submit" type="button" value="返回"/></a>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">
    function checkFrom(){
        document.getElementById("didShow").innerHTML = "";
        document.getElementById("dnameShow").innerHTML = "";
        var did = document.getElementById("did").value;
        var dname = document.getElementById("dname").value;
        var result = true;
        if(did == ""){
            document.getElementById("didShow").innerHTML = "部门编号不能为空！";
            result = false;
        }
        if (dname == ""){
            document.getElementById("dnameShow").innerHTML = "部门名称不能为空！";
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
