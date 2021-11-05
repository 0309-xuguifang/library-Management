<%@ page import="Bean.Users" %>
<%@ page import="Dao.UserDao" %>
<%@ page import="Bean.salary" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Dao.SalaryDao" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2021/7/21
  Time: 10:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link type="text/css" rel="stylesheet" href="Salary.css" />
<html>
<head>
    <title>salary.jsp</title>
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
<%
    salary sa = new salary();
    String id2 = (String)session.getAttribute("user_id");
    SalaryDao sa_dao = new SalaryDao();
    sa= sa_dao.get_PeSalary(id2);
%>
<div calss="container">
    <jsp:include page="top_banner.jsp" flush="true"></jsp:include>
    <div calss="content">
            <div class="peInfoSalary2">
                <div class="info">
                    个人工资
                </div>
                <div class="box1">
                    <label>序&nbsp;&nbsp;&nbsp;&nbsp;    号：</label>
                    <input type="text" name="salary_id" value='<% out.print(sa.getSalary_id());%>'/>
                </div>
                <div class="box1">
                    <label>职工姓名： </label>
                    <input type="text" name="name" value='<% out.print(sa.getName());%>'/>
                </div>
                <div class="box1">
                    <label>职工号： </label>
                    <input type="text" name="user_id" value='<% out.print(sa.getUser_id());%>'/>
                </div>

                <div class="box1">
                    <label>基本薪资/元： </label>
                    <input type="text" name="basicwage" value='<% out.print(sa.getBasicwage());%>'/>
                </div>
                <div class="box1">
                    <label>加班时间/小时： </label>
                    <input type="text" name="overtime" value='<% out.print(sa.getOvertime());%>'/>
                </div>
                <div class="box1">
                    <label>提成/元： </label>
                    <input type="text" name="pushmoney" value='<% out.print(sa.getPushmoney());%>'/>
                </div>
                <div class="box1">
                    <label>奖金/元： </label>
                    <input type="text" name="bonus" value='<% out.print(sa.getBonus());%>'/>
                </div>
                <div class="box1">
                    <label>请假/小时： </label>
                    <input type="text" name="leave" value='<% out.print(sa.getLeave());%>'/>
                </div>
                <div class="box1">
                    <label>迟到/小时： </label>
                    <input type="text" name="lateness" value='<% out.print(sa.getLateness());%>'/>
                </div>
                <div class="box1">
                    <label>旷工/小时： </label>
                    <input type="text" name="absenteeism" value='<% out.print(sa.getAbsenteeism());%>'/>
                </div>
                <div class="box1">
                    <label>实发工资/元： </label>
                    <input type="text" name="total" value='<% out.print(sa.getTotal());%>'/>
                </div>
                <div class="box1">
                    <input class="RecOver_submit" onclick="backAndFresh()" type="button" value="返回" />
                </div>
            </div>
    </div>
</div>
</body>
</html>


