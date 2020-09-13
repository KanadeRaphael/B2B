<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--登陆的模拟框-->
<jsp:include page="${pageContext.request.contextPath}/jsps/public/login.jsp"/>
<!--修改密码的模拟框-->
<jsp:include page="${pageContext.request.contextPath}/jsps/public/alterPsw.jsp"/>
<!--注册-->
<jsp:include page="${pageContext.request.contextPath}/jsps/public/register.jsp"/>
<c:if test="${sessionScope.user.profile eq null}"></c:if>
<c:set var="userprofile" value="default-head-img.png"/>
<c:if test="${!(sessionScope.user.profile eq null)}"></c:if>
<c:set var="userprofile" value="${sessionScope.user.profile}"/>
<div class="navbar navbar-default navbar-static-top">
    <div class="container">
        <div class="navbar-header"><a href="#mytoggle" class="navbar-toggle" data-toggle="collapse"> <span
                class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </a> <a href="#"
                                                                                                               class="navbar-brand my-logo"></a>
        </div>
        <div class="collapse navbar-collapse" id="mytoggle">
            <ul class="nav navbar-nav navbar-left">
                <li><a href="${pageContext.request.contextPath}/">首页</a></li>
                <span class="navbar-text">|</span>

                <li><a href="#">产品</a></li>
                <span class="navbar-text">|</span>

                <li><a href="${pageContext.request.contextPath}/userHelp">帮助中心</a></li>
                <span class="navbar-text"></span>

                <%-- <li class="dropdown"> <a href="#" data-toggle="dropdown">菜单</a>
                     <ul class="dropdown-menu">
                         <li><a href="#">a</a></li>
                         <li><a href="#">b</a></li>
                         <li><a href="#">c</a></li>
                     </ul>
                 </li>--%>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="${pageContext.request.contextPath}/shoppingController/gotoshoppingcart">购物车</a></li>
                <%--<li><a href="${pageContext.request.contextPath}/userHome">用户中心</a></li>--%>
                <c:if test="${empty sessionScope.user}">
                    <li><a data-toggle="modal" data-target="#login" style="cursor: pointer"><img height="20"
                                                                                                 src="${pageContext.request.contextPath}/image/profile/default-head-img.png"></a>
                    </li>
                </c:if>
                <c:if test="${not empty sessionScope.user}">
                    <li><a href="${pageContext.request.contextPath}/userHome"><img height="20" class="img-circle"
                                                                                   src="${pageContext.request.contextPath}/image/profile/${userprofile}"></a>
                    </li>
                    <li><a href="${pageContext.request.contextPath}/loginOut" class="btn">退出</a></li>
                </c:if>
            </ul>
            <form class="navbar-form navbar-right" role="search" action="${pageContext.request.contextPath}/search"
                  method="post">

                <%--<div class="form-group">
                    <input type="text" class="form-control" placeholder="Search">
                </div>
                <button type="submit" class="btn btn-default"><span class="glyphicon glyphicon-search"></span></button>--%>
                <div class="input-group">
                    <input name="keyword" type="text" class="form-control" id="searchMsg" value="">
                    <span class="input-group-btn">
                            <button id="search_button" class="btn btn-default" type="button"><span
                                    class="glyphicon glyphicon-search"></span></button>
                        </span>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    $("#search_button").click(function () {
        var keyword = $("#searchMsg").val();
        window.location.href = "${pageContext.request.contextPath}/search/" + keyword;
    });
</script>