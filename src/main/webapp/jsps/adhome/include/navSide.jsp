<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<nav class="navbar navbar-default top-navbar" role="navigation">
    <div class="navbar-header">
        <a class="navbar-brand" href="/adHome"><i class="fa fa-comments"></i> <strong>管理员中心 </strong></a>
    </div>
</nav>--%>
<nav class="navbar-default navbar-side" role="navigation">
    <div class="navbar-header">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/adHome"><i class="fa fa-comments"></i> <strong>管理员中心 </strong></a>
    </div>
    <div class="clearfix"></div>
    <div class="sidebar-collapse">
        <ul class="nav" id="main-menu">
            <li>
                <a href="/adPageManage"><i class="fa fa-edit"></i>网站页面管理</a>
            </li>
            <li>
                <a href="/adGoodsInfo"><i class="fa fa-desktop"></i>商品信息管理</a>
            </li>
            <li>
                <a href="/adAddManage"><i class="fa fa-fw fa-file"></i>添加商品信息</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/adminOrder"><i class="fa fa-table"></i> 订单信息管理</a>
            </li>
            <li>
                <a href="${pageContext.request.contextPath}/adUserManage"><i class="fa fa-edit"></i>用户信息管理</a>
            </li>
            <%--<li>
                <a href="${pageContext.request.contextPath}/adAdminManage"><i class="fa fa-edit"></i>管理员信息</a>
            </li>--%>
        </ul>
    </div>
</nav>
