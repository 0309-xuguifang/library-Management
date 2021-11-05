<%@ page import="Bean.Users" %>
<%@ page import="Dao.UserDao" %>
<%@ page import="Dao.SalaryDao" %>
<%@ page import="Bean.salary" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2021/7/21
  Time: 12:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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
        </div>
        <div class="right_side">
            <form action="/SelectUserServlet" method="post">
            <div class="right-side-text">
            <div class="panel1">
                <div class="title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;账户管理</div>
                <div class="check-select">
                    员工姓名：
                    <input  type="text" name="user_name">
                    <input class="RecOver_submit" type="submit" value="查询">
                    <a href="add-employee.jsp"><input class="RecOver_submit" type="button" value="添加账户" ></a>
                </div>
            </div>
            <div class="select-peInfo">
                <table  frame="hsides">
                    <tr class="top">
                        <th>职工号</th>
                        <th>职工姓名</th>
                        <th>性别</th>
                        <th>年龄</th>
                        <th>电话</th>
                        <th>所属部门</th>
                        <th>操作</th>
                    </tr>
                    <%
                        ArrayList<Users> userdata2 = new ArrayList<Users>();
                        userdata2 = (ArrayList<Users>)request.getAttribute("data");
                        if(userdata2==null){
                            UserDao userdao2 = new UserDao();
                            userdata2 = (ArrayList<Users>)userdao2.get_ListInfo();
                        }
                        for (Users bean : userdata2){

                    %>
                    <tr>
                        <td><%= bean.getUser_id() %></td>
                        <td><%= bean.getUser_name() %></td>
                        <td><%= bean.getSex() %></td>
                        <td><%= bean.getAge() %></td>
                        <td><%= bean.getPhone()%></td>
                        <td><%= bean.getDepartment() %></td>
                        <td><button class="deleteBtn" type="button"  onclick="deleteUser(<%= bean.getUser_id() %>)">删除</button></td>
                    </tr>
                    <%}%>
                </table>
            </div>
            </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript">
    function createXHR(){
        var xmlhttp;
        if (window.XMLHttpRequest){//支持XMLHttpRequest
            xmlhttp = new XMLHttpRequest();
        }else{
            xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
        }
        return xmlhttp;
    };
    function deleteUser(user_id){
        //创建XMLHttpRequest对象
        var xhr = createXHR();

        //删除之前弹出一个提示框
        var flag = confirm("确认删除吗?");
        //建立对服务器的调用
        if (flag){
            //设定请求地址
            var url = "DeleteUserServlet?user_id=" +user_id;
            xhr.open("POST", url, true);
        }

        //向服务器发出请求
        xhr.send();
        parent.document.location.reload();//页面刷新
    };

</script>
</body>
</html>
