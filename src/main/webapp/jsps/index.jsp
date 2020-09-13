<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <jsp:include page="${pageContext.request.contextPath}/jsps/public/inc.jsp" />
    <link href="../css/carousel.css" rel="stylesheet">
    <title>首页</title>
    <style>
        ul.nav-tabs{
            width: 140px;
            margin-top: 20px;
            border-radius: 4px;
            border: 1px solid #ddd;
            box-shadow: 0 1px 4px rgba(0, 0, 0, 0.067);
        }
        ul.nav-tabs li{
            margin: 0;
            border-top: 1px solid #ddd;
        }
        ul.nav-tabs li:first-child{
            border-top: none;
        }
        ul.nav-tabs li a{
            margin: 0;
            padding: 8px 16px;
            border-radius: 0;
        }
        ul.nav-tabs li.active a, ul.nav-tabs li.active a:hover{
            color: #fff;
            background: #0088cc;
            border: 1px solid #0088cc;
        }
        ul.nav-tabs li:first-child a{
            border-radius: 4px 4px 0 0;
        }
        ul.nav-tabs li:last-child a{
            border-radius: 0 0 4px 4px;
        }
        ul.nav-tabs.affix{
            top: 30px; /* Set the top position of pinned element */
        }
        img.img-rounded:hover{
            transition:all 0.5s;
            transform: scale(1.2);
        }
    </style>
</head>
<body data-spy="scroll" data-target="#myScrollspy">
<jsp:include page="public/header.jsp" />
<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>
    <div class="carousel-inner" role="listbox">
        <div class="item active">
            <img class="first-slide" src="${pageContext.request.contextPath}/image/shop/product/banner23.jpg" height="500" alt="First slide">
        </div>
        <div class="item">
            <img class="second-slide" src="${pageContext.request.contextPath}/image/shop/product/banner24.jpg" alt="Second slide">
        </div>
        <div class="item">
            <img class="third-slide" src="${pageContext.request.contextPath}/image/shop/product/banner25.jpg" alt="Third slide">
        </div>
    </div>
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev"> <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span class="sr-only">Previous</span> </a> <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next"> <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> <span class="sr-only">Next</span> </a>
</div>
<!-- /.carousel -->
<div class="container marketing">
    <div class="row">
        <div class="col-xs-3" id="myScrollspy">
            <ul class="nav nav-tabs nav-stacked" data-spy="affix" data-offset-top="150" style="background-color: white;">
                <li><a href="#section-1">手机</a></li>
                <li><a href="#section-2">电脑</a></li>
                <li><a href="#section-3">摄像机</a></li>
            </ul>
        </div>
        <div class="col-xs-9">
            <h2 id="section-1" class="h2">手机</h2>
            <div class="row">
                <c:forEach items="${goods}" var="g">
                    <c:if test="${g.type==1}">
                        <div class="col-xs-4">
                            <div class="text-center"><img class="img-rounded" src="${pageContext.request.contextPath}/image/goods/${g.id}/img1.jpg" width="140" height="140">
                                <h2>${g.name}</h2>
                                <p>${g.intro}</p>
                                <p><a class="btn btn-default" href="${pageContext.request.contextPath}/to/singlegoods?id=${g.id}" role="button">View details &raquo;</a></p>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
            <div class="clearfix"></div>
            <!--手机END-->
            <h2 id="section-2" class="h2">电脑</h2>
            <div class="row">
                <c:forEach items="${goods}" var="g">
                    <c:if test="${g.type==2}">
                        <div class="col-xs-4">
                            <div class="text-center"><img class="img-rounded" src="${pageContext.request.contextPath}/image/goods/${g.id}/img1.jpg" width="140" height="140">
                                <h2>${g.name}</h2>
                                <p>${g.intro}</p>
                                <p><a class="btn btn-default" href="${pageContext.request.contextPath}/to/singlegoods?id=${g.id}" role="button">View details &raquo;</a></p>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
            <!--电脑END-->
            <h2 id="section-3" class="h2">摄像机</h2>
            <div class="row">
                <c:forEach items="${goods}" var="g">
                    <c:if test="${g.type==3}">
                        <div class="col-xs-4">
                            <div class="text-center"><img class="img-rounded" src="${pageContext.request.contextPath}/image/goods/${g.id}/img1.jpg" width="140" height="140">
                                <h2>${g.name}</h2>
                                <p>${g.intro}</p>
                                <p><a class="btn btn-default" href="${pageContext.request.contextPath}/to/singlegoods?id=${g.id}" role="button">View details &raquo;</a></p>
                            </div>
                        </div>
                    </c:if>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
<footer class="text-center" style="margin-top: 30px"><p>&copy; 2018 12#616 Course Design. &middot;</p></footer>

<script src="${pageContext.request.contextPath}/js/holder.min.js"></script>
</body>
</html>
