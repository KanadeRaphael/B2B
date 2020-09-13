<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!Doctype html>
<html>
<head>
    <title>商品搜索结果</title>
    <jsp:include page="${pageContext.request.contextPath}/jsps/public/inc.jsp"/>
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/jsps/public/header.jsp"/>
<div class="container">
    <div class="header well">
        搜索关键词:${searchMsg}
    </div>
    <div>
        <ul class="nav nav-tabs">
            <li id="Ttotal"><a href="/search?mode=0">综合</a></li>
            <li id="Torder"><a href="/search?mode=1">销量<span class="glyphicon glyphicon-arrow-down"></span></a></li>
<%--            <li><a href="#">SVN</a></li>
            <li><a href="#">iOS</a></li>
            <li><a href="#">VB.Net</a></li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    Java <span class="caret"></span>
                </a>
                <ul class="dropdown-menu">
                    <li><a href="#">Swing</a></li>
                    <li><a href="#">jMeter</a></li>
                    <li><a href="#">EJB</a></li>
                    <li class="divider"></li>
                    <li><a href="#">分离的链接</a></li>
                </ul>
            </li>--%>
        </ul>
    </div>
    <div>
        <c:if test="${empty searchResult}">
            <div class="well">empty</div>
        </c:if>
        <c:if test="${not empty searchResult}">
            <c:forEach items="${searchResult}" var="s">
                <div class="row">
                    <div class="col-sm-2">
                        <img height="120" width="120" src="${pageContext.request.contextPath}/image/goods/${s.id}/img1.jpg">
                    </div>
                    <div class="col-sm-5">
                        <p class="text-center">
                            <a href="/to/singlegoods?id=${s.id}"><c:out value="${s.intro}"/></a>
                        </p>
                    </div>
                    <div class="col-sm-3">
                        <p class="text-danger">
                            <c:out value="￥${s.price}"/>
                        </p>
                    </div>
                    <div class="col-sm-2">
                        <p class="">
                            <c:out value="${s.buynum}"/>
                        </p>
                    </div>
                </div>
            </c:forEach>
        </c:if>
    </div>
</div>
<script>
    if(get(${mode})==1)$("#Torder").addClass("active");
    else $("#Ttotal").addClass("active");
    $("ul li").click(function () {
        $("ul.nav").find("li").removeClass("active");
        $(this).addClass("active");
    });
    function get(obj) {return obj;}
</script>
</body>
</html>
