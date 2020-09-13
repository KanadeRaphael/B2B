<%--
  Created by IntelliJ IDEA.
  User: xif19
  Date: 2018/12/18
  Time: 13:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    #main-menu li ul li{
        padding-left: 15%;
    }

    #main-menu li ul li a{
        color: #FFFFFF;
    }
</style>
<nav class="navbar navbar-default top-navbar" role="navigation">
    <div class="navbar-header">
        <a class="navbar-brand" href="/userHome"><i class="fa fa-comments"></i> <strong>用户中心 </strong></a>
    </div>
</nav>
<nav class="navbar-default navbar-side" role="navigation">
    <div class="sidebar-collapse">
        <ul class="nav" id="main-menu">
            <li><a>用户中心</a></li>
            <li class="active">
                <a href="#"><i class="fa fa-desktop"></i> 个人信息<span class="fa arrow"></span></a>
                <ul class="nav nav-second-level">
                    <li>
                        <a href="/userInfo">基本信息</a>
                    </li>
                    <li>
                        <a href="/userAddress">收货地址</a>
                    </li>
                </ul>
            </li>
            <li>
                <a href="/userFollow"><i class="fa fa-fw fa-file"></i> 关注中心</a>
            </li>
            <li>
                <a href="/userOrder?mark=0"><i class="fa fa-table"></i> 订单中心</a>
            </li>
            <%--<li>--%>
                <%--<a href="/userService"><i class="fa fa-edit"></i> 退款管理</a>--%>
            <%--</li>--%>
        </ul>
    </div>
</nav>
