<%--
  Created by IntelliJ IDEA.
  User: xif19
  Date: 2018/12/16
  Time: 22:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <head>
        <title>个人信息</title>
        <!-- Bootstrap Styles-->
        <link href="${pageContext.request.contextPath}/assets/css/bootstrap.css" rel="stylesheet" />
        <!-- FontAwesome Styles-->
        <link href="${pageContext.request.contextPath}/assets/css/font-awesome.css" rel="stylesheet" />
        <!-- Custom Styles-->
        <link href="${pageContext.request.contextPath}/assets/css/custom-styles.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/css/home/info.css" rel="stylesheet" type="text/css" />
        <jsp:include page="${pageContext.request.contextPath}/jsps/public/inc.jsp" />
    </head>
</head>
<body>
<%@include file="../public/header.jsp"%>
<div class="container">
    <!--/. NAV TOP  -->
    <div class="row">
        <div class="col-lg-3">
            <jsp:include page="include/navSide.jsp"/>
        </div>
        <div id="wrapper" class="col-lg-9">
            <div id="page-wrapper" >
                <div id="page-inner">
                    <div class="row">
                        <div class="col-sm-6 col-md-offset-0 col-md-12">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <ul class="nav nav-tabs">
                                        <li class="active" ><a href="#" data-toggle="tab">网站页面商品管理</a>
                                        </li>
                                    </ul>
                                    <div class="tab-content">
                                        <div class="tab-pane fade active in">

                                            <!-- 折叠 -->
                                            <div class="panel-group" id="accordion">
                                                <div class="panel panel-default">
                                                    <div class="panel-heading">
                                                        <h4 class="panel-title">
                                                            <a data-toggle="collapse" data-parent="#accordion"
                                                               href="#collapseOne">
                                                                <div class="row" style="margin-bottom: 30px">
                                                                    <div class="col-md-12">
                                                                        <span><h3>已经在网页上显示的商品 <span class="badge">点击展开</span></h3></span>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                        </h4>
                                                    </div>
                                                    <div id="collapseOne" class="panel-collapse collapse in">
                                                        <div class="panel-body">
                                                            <div class="col-md-12">
                                                                <!-- Advanced Tables -->
                                                                <div class="panel panel-default">
                                                                    <div class="panel-body">
                                                                        <div class="table-responsive">

                                                                            <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                                                                <thead>
                                                                                <tr>
                                                                                    <th>图片</th>
                                                                                    <th>商品名称</th>
                                                                                    <th>商品价格</th>
                                                                                    <th>销量</th>
                                                                                    <th>上传时间</th>
                                                                                    <th>操作</th>
                                                                                </tr>
                                                                                </thead>
                                                                                <tbody>
                                                                                <c:if test="${empty homepages}">
                                                                                    <tr>
                                                                                        <td colspan="8">
                                                                                         <span style="font-family: 华文新魏;font-size: 50px;text-align: center">
                                                                                             在网站页面上没有任何东西！
                                                                                         </span>
                                                                                        </td>
                                                                                    </tr>
                                                                                </c:if>
                                                                                <c:if test="${not empty homepages}">
                                                                                    <c:forEach var="homepages" items="${homepages}">
                                                                                        <tr class="odd gradeX">
                                                                                            <td style="width: 80px;">
                                                                                                <img src="${pageContext.request.contextPath}/image/goods/${homepages.goodsId}/img1.jpg" alt="" style="height: 50px;">
                                                                                            </td>
                                                                                            <td><c:out value="${homepages.name}"></c:out></td>
                                                                                            <td><c:out value="${homepages.price}"></c:out></td>
                                                                                            <td><c:out value="${homepages.buynum}"></c:out></td>
                                                                                            <td><c:out value="${homepages.uptime}"></c:out></td>
                                                                                            <td class="center" style="width: 80px">
                                                                                                <ul class="nav navbar-nav navbar-right">
                                                                                                    <li>
                                                                                                        <a data-toggle="modal" data-target="" href="${pageContext.request.contextPath}/adPageManageDelete?id=${homepages.id}">
                                                                                                            <span class="glyphicon glyphicon-log-in">下架</span>
                                                                                                        </a>
                                                                                                    </li>
                                                                                                </ul>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </c:forEach>
                                                                                </c:if>
                                                                                </tbody>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!--End Advanced Tables -->
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="panel panel-default">
                                                    <div class="panel-heading">
                                                        <h4 class="panel-title">
                                                            <a data-toggle="collapse" data-parent="#accordion"
                                                               href="#collapseTwo">
                                                                <div class="row" style="margin-bottom: 30px">
                                                                    <div class="col-md-12">
                                                                        <span><h3>未在网站页面上显示的商品<span class="badge">点击展开</span></h3></span>
                                                                    </div>
                                                                </div>
                                                            </a>
                                                        </h4>
                                                    </div>
                                                    <div id="collapseTwo" class="panel-collapse collapse">
                                                        <div class="panel-body">
                                                            <div class="col-md-12">
                                                                <!-- Advanced Tables -->
                                                                <div class="panel panel-default">
                                                                    <div class="panel-body">
                                                                        <div class="table-responsive">
                                                                            <table class="table table-striped table-bordered table-hover" id="dataTables-example1">
                                                                                <thead>
                                                                                <tr>
                                                                                    <th>图片</th>
                                                                                    <th>商品名称</th>
                                                                                    <th>商品价格</th>
                                                                                    <th>销量</th>
                                                                                    <th>操作</th>
                                                                                </tr>
                                                                                </thead>
                                                                                <tbody>
                                                                                <c:if test="${empty goods}">
                                                                                    <tr>
                                                                                        <td colspan="8">
                                                                        <span style="font-family: 华文新魏;font-size: 50px;text-align: center">
                                                                            在网站页面上没有任何东西！
                                                                        </span>
                                                                                        </td>
                                                                                    </tr>
                                                                                </c:if>
                                                                                <c:if test="${not empty goods}">
                                                                                    <c:forEach var="goods" items="${goods}">
                                                                                        <tr class="odd gradeX">
                                                                                            <td style="width: 80px;">
                                                                                                <a href="#">
                                                                                                    <img src="${pageContext.request.contextPath}/image/goods/${goods.id}/img1.jpg" alt="" style="height: 50px;">
                                                                                                </a>
                                                                                            </td>
                                                                                            <td><c:out value="${goods.name}"></c:out></td>
                                                                                            <td><c:out value="${goods.price}"></c:out></td>
                                                                                            <td><c:out value="${goods.buynum}"></c:out></td>
                                                                                            <td class="center">
                                                                                                <ul class="nav navbar-nav navbar-right">
                                                                                                    <li><a data-toggle="modal" data-target="" href="${pageContext.request.contextPath}/adPageManageAdd?id=${goods.id}"><span class="glyphicon glyphicon-log-in"></span>上架</a></li>
                                                                                                </ul>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </c:forEach>
                                                                                </c:if>
                                                                                </tbody>
                                                                            </table>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                                <!--End Advanced Tables -->
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- /. ROW  -->
                        <footer></footer>
                    </div>
                    <!-- /. ROW  -->
                    <footer></footer>
                </div>
                <!-- /. PAGE INNER  -->
            </div>
        </div>
    </div>
</div>
<!-- /. WRAPPER  -->
<!-- JS Scripts-->
<!-- jQuery Js -->
<script src="../../assets/js/jquery-1.10.2.js"></script>
<!-- Bootstrap Js -->
<script src="../../assets/js/bootstrap.min.js"></script>
<!-- Metis Menu Js -->
<script src="../../assets/js/jquery.metisMenu.js"></script>
<!-- DATA TABLE SCRIPTS -->
<script src="../../assets/js/dataTables/jquery.dataTables.js"></script>
<script src="../../assets/js/dataTables/dataTables.bootstrap.js"></script>
<script>
    $(document).ready(function () {
        $('#dataTables-example').dataTable();
    });
    $(document).ready(function () {
        $('#dataTables-example1').dataTable();
    });
</script>
<!-- Custom Js -->
<script src="../../assets/js/custom-scripts.js"></script>
</body>
</html>