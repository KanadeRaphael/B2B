
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <head>
        <title>商品信息管理</title>
        <!-- Bootstrap Styles-->
        <link href="${pageContext.request.contextPath}/assets/css/bootstrap.css" rel="stylesheet" />
        <!-- FontAwesome Styles-->
        <link href="${pageContext.request.contextPath}/assets/css/font-awesome.css" rel="stylesheet" />
        <!-- Custom Styles-->
        <link href="${pageContext.request.contextPath}/assets/css/custom-styles.css" rel="stylesheet" />
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
                        <div class="col-sm-6 col-md-12">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <ul class="nav nav-tabs">
                                        <li class=""><a href="${pageContext.request.contextPath}/adGoodsInfo" >商品信息</a>
                                        </li>
                                        <li class=""><a href="${pageContext.request.contextPath}/goodsInfoSeach?type=1">手机</a>
                                        </li>
                                        <li class="active"><a href="#" data-toggle="tab">电脑</a>
                                        </li><%--${pageContext.request.contextPath}/goodsInfoSeach?type=3--%>
                                        <li class=""><a href="${pageContext.request.contextPath}/goodsInfoSeach?type=3">家具</a>
                                        </li>
                                    </ul>
                                    <div class="tab-content">
                                        <div class="tab-pane fade active in">
                                            <div class="row">
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
                                                                        <th>商品详情</th>
                                                                        <th>商品价格</th>
                                                                        <th>库存数量</th>
                                                                        <th>销量</th>
                                                                        <th>降价幅度</th>
                                                                        <th>操作</th>
                                                                    </tr>
                                                                    </thead>
                                                                    <tbody>
                                                                    <c:if test="${empty goods}">
                                                                        <tr>
                                                                            <td colspan="8">
                                                                             <span style="font-family: 华文新魏;font-size: 50px;text-align: center">
                                                                                 在仓库中没有任何东西！
                                                                             </span>
                                                                            </td>
                                                                        </tr>
                                                                    </c:if>
                                                                    <c:if test="${not empty goods}">
                                                                        <c:forEach var="goods" items="${goods}">
                                                                            <tr class="odd gradeX">
                                                                                <td ><img src="${pageContext.request.contextPath}/image/goods/${goods.id}/img1.jpg" alt="" style="width: 100px"></td>
                                                                                <td><c:out value="${goods.name}"></c:out></td>
                                                                                <td style="width: 35%"><c:out value="${goods.intro}"></c:out></td>
                                                                                <td><c:out value="${goods.price}"></c:out></td>
                                                                                <td><c:out value="${goods.number}"></c:out></td>
                                                                                <td><c:out value="${goods.buynum}"></c:out></td>
                                                                                <td><c:out value="${goods.reduction}"></c:out></td>
                                                                                <td class="center">
                                                                                    <ul class="nav navbar-nav navbar-right">
                                                                                        <li><a data-toggle="modal" data-target="#xiugai${goods.id}" href=""><span class="glyphicon glyphicon-user"></span>修改</a></li>
                                                                                        <li><a data-toggle="modal" data-target="" href="${pageContext.request.contextPath}/goodsInfoDelete?id=${goods.id}"><span class="glyphicon glyphicon-log-in"></span>删除</a></li>
                                                                                    </ul>
                                                                                    <!-- 修改窗口 -->
                                                                                    <div id="xiugai${goods.id}" class="modal fade">
                                                                                        <div class="modal-dialog">
                                                                                            <div class="modal-content">
                                                                                                <div class="modal-body">
                                                                                                    <button class="close" data-dismiss="modal">
                                                                                                        <span>&times;</span>
                                                                                                    </button>
                                                                                                </div>
                                                                                                <div class="modal-title">
                                                                                                    <h1 class="text-center">修改</h1>
                                                                                                </div>
                                                                                                <div class="modal-body" align="center">
                                                                                                    <form class="form-group" action="${pageContext.request.contextPath}/goodsInfoXiugai?">
                                                                                                        <table style="width: 100%" align="center">
                                                                                                            <tr>
                                                                                                                <div class="form-group">
                                                                                                                    <td>
                                                                                                                        <label>价格</label>
                                                                                                                    </td>
                                                                                                                    <td>
                                                                                                                        <input class="form-control" type="text" name="price" value="">
                                                                                                                        <input name="id" value="${goods.id}" hidden="hidden">
                                                                                                                    </td>
                                                                                                                </div>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <div class="form-group">
                                                                                                                    <td>
                                                                                                                        <label for="">商品库存</label>
                                                                                                                    </td>
                                                                                                                    <td>
                                                                                                                        <input class="form-control" type="text" placeholder="" name="number">
                                                                                                                    </td>
                                                                                                                </div>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <div class="form-group">
                                                                                                                    <td>
                                                                                                                        <label >降价幅度</label>
                                                                                                                    </td>
                                                                                                                    <td>
                                                                                                                        <input class="form-control" type="text" placeholder="" name="reduction">
                                                                                                                    </td>
                                                                                                                </div>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <div class="form-group">
                                                                                                                    <td>
                                                                                                                        <label for="">商品介绍</label>
                                                                                                                    </td>
                                                                                                                    <td>
                                                                                                                        <input class="form-control" type="text" placeholder="" name="intro">
                                                                                                                    </td>
                                                                                                                </div>
                                                                                                            </tr>
                                                                                                        </table>
                                                                                                        <div class="text-right">
                                                                                                            <button class="btn btn-primary" type="submit">确认</button>
                                                                                                            <button class="btn btn-danger" data-dismiss="modal">取消</button>
                                                                                                        </div>
                                                                                                    </form>
                                                                                                </div>
                                                                                            </div>
                                                                                        </div>
                                                                                    </div>
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
                    <!-- /. ROW  -->
                    <footer></footer>
                </div>
                <!-- /. PAGE INNER  -->
                <!-- /. PAGE WRAPPER  -->
            </div>
        </div>
    </div>

</div>


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
</script>
<!-- Custom Js -->
<script src="../../assets/js/custom-scripts.js"></script>
</body>
</html>
