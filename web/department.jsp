<%@ page import="Bean.Users" %>
<%@ page import="Dao.UserDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Dao.DepDao" %>
<%@ page import="Bean.department" %><%--
  Created by IntelliJ IDEA.
  User: DELL
  Date: 2021/7/21
  Time: 12:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>department.jsp</title>
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
            <form action="/SelectDepServlet" method="post">
                <div class="right-side-text">
                    <div class="panel1">
                        <div class="title">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;部门管理</div>
                        <div class="check-select">
                            部门名称：
                            <input  type="text" name="dname">
                            <input class="RecOver_submit" type="submit" value="查询">
                            <a href="add-department.jsp"><input class="RecOver_submit" type="button" value="添加部门" ></a>
                        </div>
                    </div>
                    <div class="select-peInfo">
                        <table>
                            <tr class="top">
                                <th>部门编号</th>
                                <th>部门名称</th>
                                <th>操作</th>
                            </tr>
                            <%
                                ArrayList<department> depdata = new ArrayList<department>();
                                depdata = (ArrayList<department>)request.getAttribute("data");
                                if(depdata == null){
                                    DepDao depdao = new DepDao();
                                    depdata = (ArrayList<department>)depdao.get_ListDep();
                                }
                                for (department bean : depdata){

                            %>
                            <tr>
                                <td><%= bean.getDid() %></td>
                                <td><%= bean.getDname() %></td>
                                <td><button class="deleteBtn" type="button"  onclick="deleteDep(<%= bean.getDid() %>)">删除</button></td>
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
    }
    function deleteDep(did){
        //创建XMLHttpRequest对象
        var xhr = createXHR();
        //删除之前弹出一个提示框
        var flag = confirm("确认删除吗？");
        //设定请求地址
        if (flag){
            var url = "DeleteDepServlet?did=" +did;
            //建立对服务器的调用
            xhr.open("POST", url, true);
        }
        //向服务器发出请求
        xhr.send();
        parent.document.location.reload();//页面刷新
    }
</script>
</body>
</html>
