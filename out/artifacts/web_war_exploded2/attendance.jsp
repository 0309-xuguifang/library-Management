<%@ page import="Bean.Users" %>
<%@ page import="Dao.UserDao" %>
<%@ page import="Bean.attendance" %>
<%@ page import="Dao.SalaryDao" %>
<%@ page import="java.util.ArrayList" %>
<%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2021/7/25
  Time: 9:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>salary-setting.jsp</title>
    <link type="text/css" rel="stylesheet" href="Salary.css" />
</head>
<body>
<%
    Users user = new Users();
    String id = (String)session.getAttribute("user_id");
    UserDao userdao = new UserDao();
    user = userdao.get_AidInfo2(id);
    attendance attend=new attendance();
    SalaryDao att=new SalaryDao();
    attend=att.get_ListAtt();
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
            <form action="SalarySetServlet" method="post">
                    <div class="panel">
                        <div class="add-text">
                            考勤设置
                        </div>
                        <div class="add-content">
                            <div class="box1">
                                <label>迟到/小时扣：</label>
                                <input type="text" name="lateness" value="<% out.print(attend.getLateness());%>"/>
                            </div>
                            <div class="box1">
                                <label>旷工/小时扣：</label>
                                <input type="text" name="absent" value="<% out.print(attend.getAbsent());%>"/>
                            </div>
                            <div class="box1">
                                <label>请假/小时扣：</label>
                                <input type="text" name="leave" value="<% out.print(attend.getLeave());%>"/>
                            </div>
                            <div class="box1">
                                <label>工作日加班/小时：</label>
                                <input type="text" name="workday" value="<% out.print(attend.getWorkday());%>"/>
                            </div>
                            <div class="box1">
                                <label>周末加班/小时：</label>
                                <input type="text" name="weekend" value="<% out.print(attend.getWorkday()*2);%>"/>
                            </div>
                            <div class="box1">
                                <label>节日加班/小时：</label>
                                <input type="text" name="festival" value="<% out.print(attend.getWorkday()*3);%>"/>
                            </div>
                            <div class="box1">
                                <input class="RecOver_submit" type="submit" value="设置"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <a href="salary-setting.jsp"><input class="RecOver_submit" type="button" value="返回"/></a>
                            </div>
                        </div>
                    </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
