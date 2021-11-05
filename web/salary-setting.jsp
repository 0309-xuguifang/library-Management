<%@ page import="Bean.Users" %>
<%@ page import="Dao.UserDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Bean.salary" %>
<%@ page import="Dao.SalaryDao" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2021/7/21
  Time: 12:52
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
                <div class="right-side-text">
                    <div class="panel1">
                        <div class="title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;员工薪资设置</div>
                        <div class="check-select">
                            <a href="attendance.jsp"><input class="RecOver_submit" type="button" value="考勤设置"/></a>
                        </div>
                    </div>
                    <div class="select-peInfo">
                        <table>
                            <tr class="top">
                                <th>职工号</th>
                                <th>职工姓名</th>
                                <th>基本薪资</th>
                                <th>操作</th>
                            </tr>
                            <%
                                ArrayList<salary> salarydata = new ArrayList<salary>();
                                salarydata = (ArrayList<salary>)request.getAttribute("data");
                                if(salarydata==null){
                                    SalaryDao salarydao = new SalaryDao();
                                    salarydata = (ArrayList<salary>)salarydao.get_ListInfo();
                                }
                                for (salary bean : salarydata){
                            %>
                            <tr>
                                <td><%= bean.getUser_id() %></td>
                                <td><%= bean.getName() %></td>
                                <td><%= bean.getBasicwage() %></td>
                                <td>  <button type="button"  class="update" onclick="showsalary('<%= bean.getUser_id() %>','<%= bean.getName() %>','<%= bean.getBasicwage()%>')">修改</button></td>
                            </tr>
                            <%}%>
                        </table>
                    </div>
                    <script type="text/javascript">
                        function showsalary(user_id,name,basicwage) {
                            document.getElementById("update-user_id").value = user_id;
                            document.getElementById("update-ename").value = name;
                            document.getElementById("update-basicwage").value = basicwage;
                        }
                    </script>
                    <form action="UpdateSalaryServlet" method="post">
                    <div class="update-salary">
                        <br>
                        <label>职&nbsp;工&nbsp;号：</label><input type="text" id="update-user_id" name="user_id">&nbsp;&nbsp;&nbsp;&nbsp;
                        <label for="update-user_id" style="display: none;"></label>
                        <label>姓&nbsp;&nbsp;&nbsp;&nbsp;名：</label><input type="text" id="update-ename" name="name">&nbsp;&nbsp;&nbsp;&nbsp;
                        <label for="update-ename" style="display: none;"></label>
                        <label>基本薪资：</label><input type="text" id="update-basicwage" name="basicwage"><br><br>
                        <label for="update-basicwage" style="display: none;"></label>
                        <input class="RecOver_submit" type="submit" value="修改"/>
                    </div>
                    </form>
                </div>
        </div>
    </div>
</div>
</body>
</html>
