<%--
  Created by IntelliJ IDEA.
  User: xif19
  Date: 2018/12/14
  Time: 21:14
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<!Doctype html>
<html>
<head>
    <title>用户中心</title>
    <!-- Bootstrap Styles-->
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <link href="${pageContext.request.contextPath}/assets/css/font-awesome.css" rel="stylesheet" />
    <!-- Custom Styles-->
    <link href="${pageContext.request.contextPath}/assets/css/custom-styles.css" rel="stylesheet" />
    <!-- Google Fonts-->
    <%--<link href="http://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" type="text/css" />--%>

    <link href="${pageContext.request.contextPath}/css/home/index.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/assets/js/jquery-1.10.2.js"></script>
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/jsps/public/header.jsp" />
<div id="wrapper">
    <!--/. NAV TOP  -->
    <div class="col-md-offset-1 col-md-10">
        <%@include file="include/navSide.jsp"%>
        <!-- /. NAV SIDE  -->
        <div id="page-wrapper" >
            <div id="page-inner">
                <div class="row">
                    <div class="col-sm-4 col-md-3 col-md-offset-1">
                        <div class="panel panel-default">
                            <div id="userShow" class="panel-body">
                                <div class="showPic"><img alt="RaphaelKanade" title="" src="<c:if test="${sessionScope.user.profile!=null}" var="profile">${pageContext.request.contextPath}/image/profile/${sessionScope.user.profile}</c:if>
                                                                                            <c:if test="${not profile}" >${pageContext.request.contextPath}/image/profile/default-head-img.png</c:if>"></div>
                                <br />
                                <div>
                                    <a href="/userInfo">
                                        <c:if test="${sessionScope.user.nick!=null}" var="Nick" >${sessionScope.user.nick}</c:if>
                                        <c:if test="${not Nick}" >${sessionScope.user.uid}</c:if>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4 col-md-3">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                我的钱包
                            </div>
                            <div class="panel-body">
                                <ul class="home-list">
                                    <li class="col-md-12">
                                        <div id="money" class="number col-md-8 col-md-offset-0">
                                            <h3 class="show">
                                                <b>
                                                    <c:if test="${sessionScope.user.balance!=null}" var="Balance" >${sessionScope.user.balance}</c:if>
                                                    <c:if test="${not Balance}" >0.00</c:if>
                                                </b>
                                            </h3>
                                        </div>
                                        <div class="text col-md-8 col-md-offset-0">余额</div>
                                        <br><br><br>
                                        <div class="col-md-8 col-md-offset-0"><a href="/recharge">充值</a></div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-sm-4 col-md-3">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                我的关注
                            </div>
                            <div class="panel-body">
                                <ul class="home-list">
                                    <li>
                                        <a href="/userFollow">
                                            <div id="followNum" class="number col-md-8"><h3 class="show"><b>${followCount}</b></h3></div>
                                            <div class="text col-md-8">商品关注</div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-4 col-md-offset-1 col-md-9">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                我的订单
                            </div>
                            <div class="panel-body" align="center">
                                <ul class="home-list">
                                    <li>
                                        <a class="order-pos to-pay" href="/userOrder?mark=1">
                                            <div class="order-img"></div>
                                            <span class="order-name">待付款</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="order-pos to-take" href="/userOrder?mark=2">
                                            <div class="order-img"></div>
                                            <span class="order-name">待收货</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="order-pos to-assess" href="/userOrder?mark=3">
                                            <div class="order-img"></div>
                                            <span class="order-name">退款中</span>
                                        </a>
                                    </li>
                                    <li>
                                        <a class="order-pos to-order" href="/userOrder?mark=0">
                                            <div class="order-img"></div>
                                            <span class="order-name">全部订单</span>
                                        </a>
                                    </li>
                                </ul>
                                <c:if test="${empty recentOrders}" var="recent">
                                    <div class="order-content">您买的东西太少了，这里都空空的，快去挑选合适的商品吧！</div>
                                </c:if>
                                <c:if test="${not recent}" >
                                    <div class="row">
                                        <div class="col-sm-12" style="margin-top:5px; padding:0 2px 5px 2px;">
                                            <table width="100%" border="1" cellpadding="2" cellspacing="0">
                                                <tr bgcolor="#a9a9a9" align="center">
                                                    <td width="55%">订单详情</td>
                                                    <td width="15%">总额</td>
                                                    <td width="15%">订单状态</td>
                                                    <td width="15%">操作</td>
                                                </tr>
                                            </table>
                                        </div>
                                        <c:forEach items="${recentOrders}" var="order">
                                            <div class="col-sm-12" style="margin-top:5px; padding:0 2px 5px 2px;">
                                                <table class="order-detail" width="100%" border="1" cellpadding="2" cellspacing="0">
                                                    <tbody>
                                                    <tr bgcolor="#a9a9a9">
                                                        <td colspan="6">
                                                            <span>${order.date} </span>&nbsp;
                                                            <span>订单号: <span>${order.id}</span></span>
                                                        </td>
                                                    </tr>
                                                    </tbody>
                                                    <tbody>
                                                    <c:forEach items="${order.orderDetailDtos}" var="orderDetail" varStatus="status" >
                                                        <tr>
                                                            <td width="55%" height="100px">
                                                                <div style="width:20%; float: left">
                                                                    <a href="/to/singlegoods?id=${orderDetail.goodsId}">
                                                                        <img width="80px" height="80px" src="${pageContext.request.contextPath}/image/goods/${orderDetail.goodsId}/img1.jpg">
                                                                    </a>
                                                                </div>
                                                                <div style="margin-left: 10%; width: 70%;float: left">
                                                                    <p>
                                                                        <a href="/to/singlegoods?id=${orderDetail.goodsId}">
                                                                            <span style="line-height:16px;">${orderDetail.goodsName}</span>
                                                                        </a>
                                                                    </p>
                                                                </div>
                                                            </td>
                                                            <c:if test="${status.index==0}">
                                                                <td align="center" valign="top" width="15%" rowspan="${order.detailNum}">
                                                                    <div>
                                                                        <p style="padding: 0;margin: 0">
                                                                            <strong>￥<span>${order.totalGoodsPrice+order.transportCost}</span></strong>
                                                                        </p>
                                                                        <p style="color:#6c6c6c;padding: 0;margin: 0">
                                                                            <span>含运费:￥<span>${order.transportCost}</span></span>
                                                                        </p>
                                                                    </div>
                                                                </td>
                                                                <td align="center" valign="top" width="15%" rowspan="${order.detailNum}">
                                                                    <div>
                                                                        <p style="padding:0;margin:0;">
                                                                        <span>
                                                                            <c:if test="${order.status==1}">待付款</c:if>
                                                                            <c:if test="${order.status==2}">待收货</c:if>
                                                                        </span>
                                                                        </p>
                                                                        <p style="padding:0;margin:0;">
                                                                            <a href="#">订单详情</a>
                                                                        </p>
                                                                    </div>
                                                                </td>
                                                                <td align="center" valign="top" width="15%" rowspan="${order.detailNum}">
                                                                    <div>
                                                                        <p style="padding:0;margin:0;">
                                                                            <c:if test="${order.status==1}"><a href="/pay?id=${order.id}&mark=1&from=home" onclick="return confirm('是否付款');">付款</a><br></c:if>
                                                                            <c:if test="${order.status==2}"><a href="/takeOver?id=${order.id}&mark=2&from=home" onclick="return confirm('请确认商品已经到达');">确认收货</a></c:if>
                                                                            <c:if test="${order.status==2 || order.status==1}"><a href="/cancelOrder?id=${order.id}&mark=${mark}&from=home" onclick="return confirm('是否取消订单');">取消订单</a></c:if>
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
                                    </c:if>
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
<!-- Bootstrap Js -->
<script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
<!-- Metis Menu Js -->
<script src="${pageContext.request.contextPath}/assets/js/jquery.metisMenu.js"></script>
<script src="${pageContext.request.contextPath}/js/logReg.js" type="text/javascript"></script>
<!-- Custom Js -->
<script src="${pageContext.request.contextPath}/assets/js/custom-scripts.js"></script>
</body>
</html>

<%--<script type="text/javascript">--%>
<%--function reIndex(url) {--%>
<%--document.getElementById("page-inner").innerHTML ="";--%>
<%--$.ajax({--%>
<%--type: 'post', //可选get--%>
<%--url: url, //这里是接收数据的程序--%>
<%--dataType: 'html', //服务器返回的数据类型 可选XML ,Json jsonp script html text等--%>
<%--success: function(msg) {--%>
<%--//这里是ajax提交成功后，程序返回的数据处理函数。msg是返回的数据，数据类型在dataType参数里定义！--%>
<%--document.getElementById("page-inner").innerHTML = msg;--%>
<%--//$("#duoduo").innerHTML = msg;--%>
<%--},--%>
<%--error: function() {--%>
<%--alert('对不起失败了');--%>
<%--}--%>
<%--});--%>
<%--}--%>
<%--</script>--%>