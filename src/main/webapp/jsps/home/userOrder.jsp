<%--
  Created by IntelliJ IDEA.
  User: xif19
  Date: 2018/12/16
  Time: 22:57
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!Doctype html>
<html>
<head>
    <title>订单中心</title>
    <!-- Bootstrap Styles-->
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.css" rel="stylesheet"/>
    <!-- FontAwesome Styles-->
    <link href="${pageContext.request.contextPath}/assets/css/font-awesome.css" rel="stylesheet"/>
    <!-- Custom Styles-->
    <link href="${pageContext.request.contextPath}/assets/css/custom-styles.css" rel="stylesheet"/>
    <!-- Google Fonts-->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" type="text/css"/>
</head>
<body>
<div id="wrapper">
    <%@include file="../public/header.jsp" %>
    <!--/. NAV TOP  -->
    <div class="col-md-offset-1 col-md-10">
        <%@include file="include/navSide.jsp" %>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper">
            <div id="page-inner">
                <div class="row">
                    <div class="col-sm-6 col-md-12">
                        <div class="panel panel-default">
                            <div class="panel-body">
                                <ul id="orderNav" class="nav nav-tabs">
                                    <li id="list0"><a href="#" data-toggle="tab">全部订单</a>
                                    </li>
                                    <li id="list1"><a href="#" data-toggle="tab">待付款</a>
                                    </li>
                                    <li id="list2"><a href="#" data-toggle="tab">待收货</a>
                                    </li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane fade active in">
                                        <div class="row">
                                            <div class="col-sm-12" style="margin-top:5px; padding:0 2px 5px 2px;">
                                                <table width="100%" border="1" cellpadding="2" cellspacing="0">
                                                    <tr bgcolor="#a9a9a9" align="center">
                                                        <td width="50%">订单详情</td>
                                                        <td width="10%">单价</td>
                                                        <td width="5%">数量</td>
                                                        <td width="10%">总额</td>
                                                        <td width="10%">订单状态</td>
                                                        <td width="10%">操作</td>
                                                    </tr>
                                                </table>
                                            </div>
                                            <c:forEach items="${orders}" var="order">
                                                <div class="col-sm-12" style="margin-top:5px; padding:0 2px 5px 2px;">
                                                    <table class="order-detail" width="100%" border="1" cellpadding="2" cellspacing="0">
                                                        <tbody>
                                                        <tr bgcolor="#a9a9a9">
                                                            <td colspan="6">
                                                                <span>${order.date} </span>&nbsp;
                                                                <span>订单号: <span>${order.id}</span></span>
                                                                <a href="/deleteOrder?id=${order.id}&mark=${mark}" onclick="return confirm('是否删除订单记录');">
                                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                                </a>
                                                            </td>
                                                        </tr>
                                                        </tbody>
                                                        <tbody>
                                                        <c:forEach items="${order.orderDetailDtos}" var="orderDetail" varStatus="status" >
                                                            <tr>
                                                                <td width="50%" height="100px">
                                                                    <div style="width:20%; float: left">
                                                                        <a href="/to/singlegoods?id=${orderDetail.goodsId}">
                                                                            <img width="80px" height="80px" src="${pageContext.request.contextPath}/image/goods/${orderDetail.goodsId}/img1.jpg">
                                                                        </a>
                                                                    </div>
                                                                    <div style="margin-left: 5%; width: 70%;float: left">
                                                                        <p>
                                                                            <a href="/to/singlegoods?id=${orderDetail.goodsId}">
                                                                                <span style="line-height:16px;">${orderDetail.goodsName}</span>
                                                                            </a>
                                                                        </p>
                                                                    </div>
                                                                </td>
                                                                <td align="center" width="10%">
                                                                    <div>
                                                                        <p>
                                                                            <span>￥<span>${orderDetail.price}</span></span>
                                                                        </p>
                                                                    </div>
                                                                </td>
                                                                <td align="center" width="5%">
                                                                    <div>
                                                                        <p>${orderDetail.goodsNum}</p>
                                                                    </div>
                                                                </td>
                                                                <c:if test="${status.index==0}">
                                                                    <td align="center" valign="top" width="10%" rowspan="${order.detailNum}">
                                                                        <div>
                                                                            <p style="padding: 0;margin: 0">
                                                                                <strong>￥<span>${order.totalGoodsPrice+order.transportCost}</span></strong>
                                                                            </p>
                                                                            <p style="color:#6c6c6c;padding: 0;margin: 0">
                                                                                <span>含运费:￥<span>${order.transportCost}</span></span>
                                                                            </p>
                                                                        </div>
                                                                    </td>
                                                                    <td align="center" valign="top" width="10%" rowspan="${order.detailNum}">
                                                                        <div>
                                                                            <p style="padding:0;margin:0;">
                                                                                <span>
                                                                                    <c:if test="${order.status==0}">已取消</c:if>
                                                                                    <c:if test="${order.status==1}">待付款</c:if>
                                                                                    <c:if test="${order.status==2}">待收货</c:if>
                                                                                    <c:if test="${order.status==3||order.status==4||order.status==5}">交易完成</c:if>
                                                                                </span>
                                                                            </p>
                                                                            <p style="padding:0;margin:0;">
                                                                                <a href="#">订单详情</a>
                                                                            </p>
                                                                        </div>
                                                                    </td>
                                                                    <td align="center" valign="top" width="10%" rowspan="${order.detailNum}">
                                                                        <div>
                                                                            <p style="padding:0;margin:0;">
                                                                                <c:if test="${order.status==1}"><a href="/pay?id=${order.id}&mark=${mark}&from=space" onclick="return confirm('是否付款');">付款</a><br></c:if>
                                                                                <c:if test="${order.status==2}"><a href="/takeOver?id=${order.id}&mark=${mark}&from=space" onclick="return confirm('请确认商品已经到达');">确认收货</a></c:if>
                                                                                <c:if test="${order.status==2 || order.status==1}"><a href="/cancelOrder?id=${order.id}&mark=${mark}&from=space" onclick="return confirm('是否取消订单');">取消订单</a></c:if>
                                                                                <c:if test="${order.status==3}"><a href="#">申请售后</a></c:if>
                                                                            </p>
                                                                        </div>
                                                                    </td>
                                                                </c:if>
                                                            </tr>
                                                        </c:forEach>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </c:forEach>
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

<script>
    $(document).ready(function () {
        $("#main-menu li:eq(5) a").addClass("active-menu");
        var orderNav = $("#orderNav li");
        orderNav.removeClass("active");
        orderNav.eq(${mark}).addClass("active");
    });
    $("#list0").click(function () {
        window.location.href="/userOrder?mark=0";
    });
    $("#list1").click(function () {
        window.location.href="/userOrder?mark=1";
    });
    $("#list2").click(function () {
        window.location.href="/userOrder?mark=2";
    });
    window.onload=function(){
        history.replaceState(null,null,"/userOrder?mark="+${mark});
    };
</script>
<script src="${pageContext.request.contextPath}/js/logReg.js" type="text/javascript"></script>
<!-- Custom Js -->
<script src="${pageContext.request.contextPath}/assets/js/custom-scripts.js"></script>
</body>
</html>
