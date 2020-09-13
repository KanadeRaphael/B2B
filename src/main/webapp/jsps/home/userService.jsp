<%--
  Created by IntelliJ IDEA.
  User: xif19
  Date: 2018/12/18
  Time: 20:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!Doctype html>
<html>
<head>
    <title>退款管理</title>
    <!-- Bootstrap Styles-->
    <link href="../../assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <link href="../../assets/css/font-awesome.css" rel="stylesheet" />
    <!-- Custom Styles-->
    <link href="../../assets/css/custom-styles.css" rel="stylesheet" />
</head>
<body>
<div id="wrapper">
    <%@include file="../public/header.jsp"%>
    <!--/. NAV TOP  -->
    <div class="col-md-offset-1 col-md-10">
        <%@include file="include/navSide.jsp"%>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-sm-6 col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <ul class="nav nav-tabs">
                                    <li class="active"><a href="#" data-toggle="tab">全部订单</a>
                                    </li>
                                    <li class=""><a href="#" data-toggle="tab">待付款</a>
                                    </li>
                                    <li class=""><a href="#" data-toggle="tab">待收货</a>
                                    </li>
                                    <li class=""><a href="#" data-toggle="tab">待评价</a>
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
                                                                    <th>订单号</th>
                                                                    <th>订单详情</th>
                                                                    <th>收货人</th>
                                                                    <th>金额</th>
                                                                    <th>订单时间</th>
                                                                    <th>操作</th>
                                                                </tr>
                                                                </thead>
                                                                <tbody>
                                                                <tr class="odd gradeX">
                                                                    <td>Trident</td>
                                                                    <td>Internet Explorer 4.0</td>
                                                                    <td>Win 95+</td>
                                                                    <td class="center">4</td>
                                                                    <td class="center">X</td>
                                                                    <td class="center">X</td>
                                                                </tr>
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
        </div>
        <!-- /. PAGE WRAPPER  -->
    </div>
</div>
<!-- /. WRAPPER  -->
<!-- JS Scripts-->
<!-- jQuery Js -->
<script src="${pageContext.request.contextPath}/assets/js/jquery-1.10.2.js"></script>
<!-- Bootstrap Js -->
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
<!-- Metis Menu Js -->
<script src="${pageContext.request.contextPath}/assets/js/jquery.metisMenu.js"></script>
<!-- DATA TABLE SCRIPTS -->
<script src="${pageContext.request.contextPath}/assets/js/dataTables/jquery.dataTables.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/dataTables/dataTables.bootstrap.js"></script>
<script>
    $(document).ready(function () {
        $('#dataTables-example').dataTable();
        $("#main-menu li:eq(6) a").addClass("active-menu");
    });
</script>
<!-- Custom Js -->
<script src="${pageContext.request.contextPath}/assets/js/custom-scripts.js"></script>
<script src="${pageContext.request.contextPath}/js/logReg.js" type="text/javascript"></script>
</body>
</html>
