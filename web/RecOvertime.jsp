<%@ page import="Bean.Users" %>
<%@ page import="Dao.UserDao" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2021/7/19
  Time: 17:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>加班录入</title>
    <link type="text/css" rel="stylesheet" href="Salary.css" />
</head>
<body>
<form action="OvertimeServlet" method="post">
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
            <a href="salary.jsp">薪资查看</a>
            <a href="RecOvertime.jsp">加班录入</a>
        </div>
        <div class="right_side">
            <div class="peInfo">
                <div class="info">
                    请录入加班时间
                </div>
                </br>
                <div class="box1">
                    <input type="hidden" name="user_id" value="<%=user.getUser_id()%>" />
                    <label>工作日加班时间（/小时）：</label>
                    <input type="text" name="workday"/></br></br>
                    <label>周末加班时间（/小时）：</label>
                    <input type="text" name="weekend"/></br></br>
                    <label>节日加班时间（/小时）：</label>
                    <input type="text" name="festival"/>
                </div>
                <div class="box1">
                    <input class="RecOver_submit" type="submit" value="提交"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <a href="index.jsp"><input class="RecOver_submit" type="button" value="清除"/></a>
                </div>
            </div>
        </div>
    </div>
</div>
</form>
</body>
</html>
