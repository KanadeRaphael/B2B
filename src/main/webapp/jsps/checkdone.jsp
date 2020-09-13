<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <jsp:include page="public/inc.jsp" />
    <%--<jsp:include page="jsps/index/inc.jsp" />--%>
    <jsp:include page="checkout/style.jsp" />
    <title>结算页面</title>
</head>
<body class="wide order" style="padding-left: 3%;padding-right: 3%">
<jsp:include page="public/header.jsp" />
<div class="header order-header">
    <div class="layout">
        <div class="left">
            <div class="logo logo-word">
                <a href="${pageContext.request.contextPath}/jsps/index.jsp" title="B2C电商平台"><img src="${pageContext.request.contextPath}/image/mylogo.jpg" alt="B2C电商平台"></a>
                <span>交易完成</span>
            </div>
        </div>
        <div class="right">
            <div class="progress-area progress-area-2">
                <!--核对订单 -->
                <div class="progress-cco-area">填写核对订单</div>
                <!--成功提交订单 -->
                <div class="progress-sso-area hide">成功提交订单</div>
            </div>
        </div>
    </div>
</div>
<div class="hr-10"></div>
<div class="order-detail-area">
    <div class="welcome">你的订单信息:</div> <br>
    <div class="order-result clearfix" >
        <c:set value="0" var="sumPrice"/>
        <c:set value="0" var="sumReduction"/>
        <c:forEach items="${sessionScope.cart}" var="ct">
        <c:set value="${sumPrice+ct.price}" var="sumPrice"/>
        <c:set value="${sumReduction+ct.reduction}" var="sumReduction"/>
            商品名： ${ct.name}×${ct.number}(${ct.color})<br>
        </c:forEach>
        收件人： ${address.consignee}<br>
        收件地址： ${address.province} ${address.city} ${address.detail}<br><br>
        共付款： ¥${sumPrice}<br>
    </div>
</div>
<div class="hr-10"></div>
<div class="order-detail-area">
    <div class="order-submit clearfix" >
        <meta http-equiv="refresh" content="6;URL=/to/index">
        <a href="${pageContext.request.contextPath}/to/index" class="order-submit-btn"><span>返回主页（<span id="cntdn2home">5</span>s）</span></a>
    </div>
</div>

<jsp:include page="checkout/script.jsp" />
</body>
</html>