<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                <div class="progress-cco-area hide" style="display: block;">填写核对订单</div>
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
        商品名： <br>
        数量： <br>
        收件人： <br>
        收件地址： <br>
        共付款： ¥<br>
    </div>
</div>
<div class="hr-10"></div>
<div class="order-detail-area">
    <div class="order-submit clearfix" >
        <meta http-equiv="refresh" content="6;URL=index.jsp">
        <a href="${pageContext.request.contextPath}/jsps/index.jsp" class="order-submit-btn"><span>返回主页（<span id="cntdn2home">5</span>s）</span></a>
    </div>
</div>