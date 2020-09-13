<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!Doctype html>
<html>
<head>
    <jsp:include page="public/inc.jsp"/>
    <%--<jsp:include page="jsps/index/inc.jsp" />--%>
    <jsp:include page="checkout/style.jsp"/>
    <title>结算页面</title>
</head>
<body class="wide order" style="padding-left: 3%;padding-right: 3%">
<jsp:include page="public/header.jsp"/>
<c:set value="${(!(sessionScope.user eq null))&&(!(sessionScope.user.id==0))}" var="islogin"/>
<div class="header order-header">
    <div class="layout">
        <div class="left">
            <div class="logo logo-word">
                <a href="${pageContext.request.contextPath}/jsps/index.jsp" title="B2C电商平台"><img
                        src="${pageContext.request.contextPath}/image/mylogo.jpg" alt="B2C电商平台"></a>
                <span>确认订单</span>
            </div>
        </div>
        <div class="right">
            <div class="progress-area progress-area-2">
                <div class="progress-co-area" style="display: block;">填写核对订单信息</div>
                <div class="progress-sso-area hide">成功提交订单</div>
            </div>
        </div>
    </div>
</div>
<form action="${pageContext.request.contextPath}/to/checkdone" method="post" id="orderForm">
    <input form="orderForm" type="hidden" name="address" id="address" value=""/>
</form>
<div class="order-detail-area order-address">
    <div class="h">收货地址
    </div>
    <div class="order-address-list">
        <ul class="clearfix">
            <c:forEach items="${sessionScope.address}" var="ads">
                <li class="adrli<c:if test="${ads.type==0}"> current</c:if>" onclick="addAddress(${ads.id},this)">
                    <c:if test="${ads.type==0}"><span class="address-status">默认地址</span><script>$("#address").val(${ads.id})</script></c:if>
                    <div class="address-main">
                        <p class="clearfix"><b>${ads.consignee}</b><span>${ads.mobile}</span>
                        </p>
                        <div class="address-detail">${ads.province} ${ads.city} ${ads.detail}</div>
                    </div>
                    <div class="address-sub"><a class="address-edit" href="javascript:;" onclick="">编辑</a><a
                            class="address-del" href="javascript:;" onclick="">删除</a><a class="address-default hide"
                                                                                        href="javascript:;"
                                                                                        onclick="">设为默认</a>
                    </div>
                </li>
            </c:forEach>
            <li>
                <div class="address-empty"><a href="javascript:;" class="address-add-btn" data-toggle="modal"
                                              data-target="#myModal">新增收货地址</a>
                </div>
            </li>
        </ul>
    </div>
</div>
<div class="hr-10"></div>
<div class="order-detail-area">
    <div class="order-detail clearfix">
        <div class="order-list">
            <c:set value="0" var="sumPrice"/>
            <c:set value="0" var="sumReduction"/>
            <c:forEach items="${sessionScope.cart}" var="ct">
                <c:set value="${sumPrice+ct.price*ct.number}" var="sumPrice"/>
                <c:set value="${sumReduction+ct.reduction*ct.number}" var="sumReduction"/>
                <div class="order-list-detail">
                    <div class="order-main clearfix ">
                        <a style="cursor:default" class="p-img" target="_blank">
                            <img alt="${ct.intro}" src="../../image/goods/${ct.goods_id}/img1.jpg">
                        </a>
                        <ul style="width: 550px;">
                            <li>
                                <a style="cursor:default" class="p-name" title="${ct.name}" target="_blank"
                                   seed="item-name">${ct.name}</a>
                            </li>
                            <li style="width: 50px;">x${ct.number} ${ct.color}</li>
                            <li class="p-price">
                                ¥&nbsp;${ct.price*ct.number}
                            </li>
                        </ul>
                    </div>
                </div>
            </c:forEach>
            <div class="order-list-info">
                <div class="order-invoice">
                    <div class="h"><span>发票信息</span><em>注：如果商品由第三方卖家销售，发票内容由其卖家决定，发票由卖家开具并寄出</em></div>
                    <div class="b">
                        <em>电子普通发票</em>
                        <div class="btn-group" data-toggle="buttons">
                            <label class="btn btn-default"
                                   style="padding: 5px 10px 5px 10px">
                                <%--<span class="glyphicon glyphicon-unchecked"></span>--%>
                                <input form="orderForm" type="radio" name="type"
                                       value="0" checked>个人
                            </label>
                            <label class="btn btn-default"
                                   style="padding: 5px 10px 5px 10px">
                                <%--<span class="glyphicon glyphicon-unchecked"></span>--%>
                                <input form="orderForm" type="radio" name="type"
                                       value="1">企业
                            </label>
                        </div>
                    </div>
                </div>
                <div class="order-discount"></div>
            </div>
        </div>

        <div class="order-total">
            <!--TCS商品不展示快递方式-->
            <div class="order-total-info">
                <p>商品由<span>B2C电商平台</span>选择合作快递</p>
                <p>
                    <strong style="display: none;"></strong>
                    <em class="hide" style="display: none;"><b>“预计送达时间”功能处于试运营，可能会略有偏差，最终以实际到货时间为准，如有疑问请您联系商城客服。感谢您对B2C电商平台的支持和理解！</b></em>
                </p>
            </div>
            <div class="order-total-price">
                <div class="clearfix">
                    <div class="order-price-detail">
                        <ul>
                            <li><strong>商品总金额：</strong>
                                <span>
		                                ¥<em data-oldval=" 2799.00">${sumPrice+sumReduction}</em>
	                       </span>
                            </li>
                            <li><strong>运费：</strong>
                                <span>
	                               +¥<em>2.00</em>
	                        </span>
                            </li>

                            <li><strong>优惠金额：</strong>
                                <span>
                                            <c:if test="${sumReduction>0}">
                                            <em class="order-total-activity">
                                                <i><span class="icon-sales">立减${sumReduction}元，欲购从速~</span></i>
                                            </em>
                                            </c:if>
                                        -¥<em>${sumReduction}</em>
                                    </span>
                            </li>
                            <li>
                                <strong>结算金额：</strong>
                                <span><b></b>
		              					<span><b>¥</b><b data-oldval="1699.00">${sumPrice+2}</b></span>

		                        </span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="hr-10"></div>
<div class="order-detail-area">
    <div class="order-submit clearfix">
        <a href="javascript:" id="checkoutSubmit" onclick="${islogin?"$('#orderForm').submit()":"login()"}"
           class="order-submit-btn"><span>提交订单</span></a>
    </div>
</div>
<!-- 模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">编辑收货地址</h4>
                </div>
                <div class="modal-body">
                    <form id="address-form" action="/saveOrUpdateAddress" method="post" role="form">
                        <input type="hidden" id="id" name="id">
                        <input type="hidden" id="type" name="type">
                        <div class="form-group">
                            <label class="txtlbl" for="consignee">收货人:</label>
                            <input class="form-control" type="text" id="consignee" name="consignee" autocomplete="off">
                        </div>
                        <div class="form-group">
                            <label class="txtlbl" for="mobile">手机:</label>
                            <input class="form-control" type="text" id="mobile" name="mobile" autocomplete="off">
                        </div>
                        <div class="form-group">
                            <label class="txtlbl" for="email">电子邮箱:</label>
                            <input class="form-control" type="text" id="email" name="email" autocomplete="off">
                        </div>
                        <div class="form-group">
                            <label class="txtlbl">地区:</label>
                            <ul>
                                <li>
                                    <label for="province" class="label label-info">省份</label>
                                    <select id="province" name="province" class="form-control" data-live-search="true">
                                    </select>
                                </li>
                                <li>
                                    <label for="city" class="label label-info">城市</label>
                                    <select id="city" name="city" class="form-control" data-live-search="true">
                                    </select>
                                </li>
                            </ul>
                        </div>
                        <div class="clearfix"></div>
                        <br/>
                        <div class="form-group">
                            <label class="txtlbl" for="detail">详细地址:</label>
                            <input class="form-control" type="text" id="detail" name="detail" autocomplete="off">
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <input class="btn btn-default" form="address-form" type="submit" value="保存地址"/>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<script src="${pageContext.request.contextPath}/js/checkout/checkout.js" type="text/javascript"></script>
</body>
</html>