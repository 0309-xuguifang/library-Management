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
    <title>fin-salary.jsp</title>
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
            <a href="RecOvertime.jsp">薪资查看</a>
        </div>
        <div class="right_side">
            <div class="right-side-text">
                <div class="panel1">
                    <div class="title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;薪资查看</div>
                    <div class="check-select">
                    </div>
                </div>
                <div class="select-peInfo">
                    <table>
                        <tr class="top">
                            <th>序号</th>
                            <th>职工姓名</th>
                            <th>职工号</th>
                            <th>基本薪资/元</th>
                            <th>加班时间/小时</th>
                            <th>提成/元</th>
                            <th>奖金/元</th>
                            <th>请假/小时</th>
                            <th>迟到/小时</th>
                            <th>旷工/小时</th>
                            <th>实发工资/元</th>
                        </tr>
                        <%
                            ArrayList<salary> salarydata = new ArrayList<salary>();
                            SalaryDao salarydao = new SalaryDao();
                            salarydata = (ArrayList<salary>)salarydao.get_ListInfo();
                            for (salary bean : salarydata){
                        %>
                        <tr>
                            <td><%= bean.getSalary_id() %></td>
                            <td><%= bean.getName() %></td>
                            <td><%= bean.getUser_id() %></td>
                            <td><%= bean.getBasicwage() %></td>
                            <td><%= bean.getOvertime() %></td>
                            <td><%= bean.getPushmoney() %></td>
                            <td><%= bean.getBonus() %></td>
                            <td><%= bean.getLeave() %></td>
                            <td><%= bean.getLateness()%></td>
                            <td><%= bean.getAbsenteeism()%></td>
                            <td><%= bean.getTotal()%></td>
                        </tr>
                        <%}%>
                    </table>
                </div>
            </div>

        </div>
    </div>
</div>
</body>
</html>


