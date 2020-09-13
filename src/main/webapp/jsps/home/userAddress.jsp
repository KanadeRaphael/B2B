<%--
  Created by IntelliJ IDEA.
  User: xif19
  Date: 2018/12/28
  Time: 22:48
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!Doctype html>
<html>
<head>
    <title>未命名</title>
    <!-- Bootstrap Styles-->
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <link href="${pageContext.request.contextPath}/assets/css/font-awesome.css" rel="stylesheet" />
    <!-- Custom Styles-->
    <link href="${pageContext.request.contextPath}/assets/css/custom-styles.css" rel="stylesheet" />
    <!-- Google Fonts-->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" type="text/css" />

    <link href="${pageContext.request.contextPath}/css/home/address.css" rel="stylesheet" />
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/jsps/public/address.jsp" />
<div id="wrapper">
    <%@include file="../public/header.jsp"%>
    <!--/. NAV TOP  -->
    <div class="col-md-offset-1 col-md-10">
        <%@include file="include/navSide.jsp"%>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-sm-6 col-md-offset-0 col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <ul class="nav nav-tabs">
                                    <li class="active"><a href="#" data-toggle="tab">收货地址</a>
                                    </li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane fade active in">
                                        <c:forEach items="${addresses}" var="address">
                                            <br/>
                                            <div class="address-item">
                                                <c:if test="${address.type==0}" var="default"><span class="address-default">默认地址</span></c:if>
                                                <span class="address-edit"><a href="/deleteAddress?id=${address.id}" onclick="return confirm('是否删除地址？');"><button type="button" class="close">&times;</button></a></span>
                                                <div>收货人：<span class="consignee">${address.consignee}</span></div>
                                                <div>手机：<span class="mobile">${address.mobile}</span></div>
                                                <div>所在地区：<span class="province">${address.province}</span><span class="city">${address.city}</span></div>
                                                <span>详细地址：<span class="detail">${address.detail}</span></span>
                                                <span class="address-edit">
                                                    <c:if test="${not default}"><a href="/changeDefault?id=${address.id}&userId=${address.userId}">设置默认</a></c:if>
                                                    <a data-toggle="modal" data-target="#address" style="cursor: pointer" href="javascript:" onclick="editAddress(${address.id},${address.type},this)">编辑</a>
                                                </span>
                                            </div>
                                        </c:forEach>
                                        <div class="order-address" >
                                            <div class="address-empty">
                                                <a data-toggle="modal" data-target="#address" href="javascript:" class="address-add-btn" onclick="emptyAddress()">新增收货地址</a>
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
<script src="${pageContext.request.contextPath}/js/logReg.js" type="text/javascript"></script>

<script src="${pageContext.request.contextPath}/js/home/address.js"></script>

<!-- Custom Js -->
<script src="${pageContext.request.contextPath}/assets/js/custom-scripts.js"></script>
</body>
</html>
