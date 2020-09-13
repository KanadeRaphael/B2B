<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="header order-header">
    <div class="layout">
        <div class="left">
            <div class="logo logo-word">
                <a href="${pageContext.request.contextPath}/jsps/index.jsp" title="B2C电商平台"><img src="${pageContext.request.contextPath}/image/mylogo.jpg" alt="B2C电商平台"></a>
                <span>确认订单</span>
            </div>
        </div>
        <div class="right">
        <!--头部 -->
        <!-- <div class="order-header">
            <div class="fr"> -->
        <!--步骤-两步骤 -->
        <div class="progress-area progress-area-2">
            <!--核对订单 -->
            <div class="progress-co-area" style="display: block;">填写核对订单信息</div>
            <!--成功提交订单 -->
            <div class="progress-sso-area hide">成功提交订单</div>
        </div>
    </div>
    </div>
</div>
<div class="order-detail-area order-address" >
    <div class="h">收货地址 <a href="javascript:;" onclick="" class="address-add-btn" style="display: none;">新增收货地址</a>

    </div>
    <div class="order-address-list" >
        <ul class="clearfix">
            <li index="59356018" class="current">
                <div class="address-supplement hide"><a href="javascript:;" onclick="" class="address-add-btn">请完善街道信息</a>
                </div><span class="address-status">默认地址</span>
                <div class="address-main" onclick="">
                    <p class="clearfix"><b >陈成愿</b><span >13758233011</span>
                    </p>
                    <div class="address-detail" >浙江 杭州 西湖区 留下镇 留下街道38</div>
                </div>
                <div class="address-sub"><a class="address-edit" href="javascript:;" onclick="">编辑</a><a class="address-del" href="javascript:;" onclick="">删除</a><a class="address-default hide" href="javascript:;" onclick="">设为默认</a>
                </div>
            </li>
            <li >
                <div class="address-empty"><a href="javascript:;" class="address-add-btn" onclick="">新增收货地址</a>
                </div>
            </li>
        </ul>
    </div>
</div>
<div class="hr-10"></div>
<div class="order-detail-area">
    <div class="order-detail clearfix" >
        <div class="order-list">
            <div class="order-list-detail">
                <div class="order-main clearfix ">
                    <a style="cursor:default" class="p-img" target="_blank">
                        <img alt="荣耀V10 全网通高配版 6GB+64GB（魅丽红）" src="../../image/shop/product/1_1.jpg">
                    </a>
                    <ul style="width: 550px;">
                        <li>
                            <a style="cursor:default" class="p-name" title="精品手机1" target="_blank" seed="item-name">精品手机1</a>
                        </li>
                        <li style="width: 50px;">x1</li>
                        <li class="p-price">
                            ¥&nbsp;1699.00
                        </li>
                    </ul>
                </div>
            </div>
            <!--自营订单-赠品-start-->
            <!--自营订单-赠品-end-->
            <div class="order-list-info">
                <!--20170717-订单表单-发票信息-start -->
                <div class="order-invoice">
                    <div class="h"><span>发票信息</span><em>注：如果商品由第三方卖家销售，发票内容由其卖家决定，发票由卖家开具并寄出</em></div>
                    <div class="b">
                        <em >电子普通发票</em>
                        <span >个人</span>
                        <a  class="invoiceEdit" href="javascript:;" onclick="">修改</a>
                    </div>
                </div>
                <!-- 20170718-订单优惠-start -->
                <div class="order-discount"></div>
                <!-- 20170718-订单优惠-end -->                </div>
        </div>

        <div class="order-total"><!-- 20170718-订单结算-start -->
            <!--TCS商品不展示快递方式-->
            <div class="order-total-info">
                <p>商品由<span>B2C电商平台</span>选择合作快递</p>
                <p>
                    <strong  style="display: none;"></strong>
                    <em  class="hide" style="display: none;"><b>“预计送达时间”功能处于试运营，可能会略有偏差，最终以实际到货时间为准，如有疑问请您联系商城客服。感谢您对B2C电商平台的支持和理解！</b></em>
                </p>
            </div>
            <div class="order-total-price">
                <div class="clearfix">
                    <div class="order-price-detail">
                        <ul>
                            <li><strong>商品总金额：</strong>
                                <span>
		                                ¥<em  data-oldval=" 2799.00">2799.00</em>
	                       </span>
                            </li>
                            <li><strong>运费：</strong>
                                <span>
	                               ¥<em >0.00</em>
	                        </span>
                            </li>

                            <li><strong>优惠金额：</strong>
                                <span>
		                                <em class="order-total-activity">
		                                    <i><span class="icon-sales">限时下单立减300元，欲购从速~</span></i>
		                                </em>
		                            -¥<em>1100.00</em>
		                        </span>
                            </li>
                            <li>
                                <strong>结算金额：</strong>
                                <span><b></b>
		              					<span><b>¥</b><b  data-oldval="1699.00">1699.00</b></span>

		                        </span>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div><!--20170718-订单结算-end-->
    </div>
</div>
<div class="hr-10"></div>
<div class="order-detail-area">
    <div class="order-submit clearfix" >
        <a href="javascript:;" id="checkoutSubmit" onclick="" class="order-submit-btn"><span>提交订单</span></a>
    </div>
</div>