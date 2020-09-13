<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!Doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <title>Mobile Shop</title>
    <jsp:include page="public/inc.jsp" />
    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css"  type="text/css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/static/css/main.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/layui/css/layui.css">
    <!-- Bootstrap core CSS -->
    <link href="dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/carousel.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/navbar.css" rel="stylesheet">
    <jsp:include page="${pageContext.request.contextPath}/jsps/checkout/style.jsp" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/layui/layui.js"></script>

</head>
<body onload="p()">
<jsp:include page="public/header.jsp" />
<!--Top-->
<div class="navbar navbar-default">
    <div class="container">
        <div class="row">
            <div class="mytop2">
                <div class=" nav navbar-nav navbar-left ">
                    <a href="${pageContext.request.contextPath}/jsps/index.jsp">
                        <img src="${pageContext.request.contextPath}/image/mylogo.jpg">
                    </a>
                    <span><strong>我的购物车</strong></span>
                </div>
                <div class="nav navbar-nav navbar-right">
                    <div class="progress-area progress-area-2">
                        <!--核对订单 -->
                        <div class="progress-coo-area" style="display: block;">填写核对订单信息</div>
                        <!--成功提交订单 -->
                        <div class="progress-sso-area hide">成功提交订单</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!--//////////////////////////////////////////////////-->
<!--///////////////////Cart Page//////////////////////-->
<!--//////////////////////////////////////////////////-->
<c:if test="${empty shoppingcart}">
    <c:if test="${fg==0}">
        <div class="navbar navbar-default navbar-static-top">
            <div class="container">
                <div class="row">
                    <div style="background-color: rgba(234,234,234,0.97)">
                        <div style="width: 1200px">
                            <div>
                              <span style="font-family: 华文新魏;font-size: 30px;background-color: rgba(234,17,55,0.97);text-align: left">
                                  您还没登录，快去登录吧！
                              </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </c:if>
    <div style="background-color: rgba(234,234,234,0.97)" align="center">
        <div style="height: 500px;width: 1200px">
            <div style="margin-bottom: 30px;margin-top: 30px;padding-top: 30px;padding-bottom: 40px;">
                <span style="font-family: 华文新魏;font-size: 50px;text-align: center">
                    您的购物车空空如也！
                </span>
            </div>
            <div style="margin-bottom: 30px;margin-top: 30px;padding-top: 30px;padding-bottom: 40px;">
                <a href="/"><button type="button" class="btn btn-primary btn-lg" style="background-color: rgba(181,192,234,0.97);width: 180px;height: 50px">去逛逛</button></a>
            </div>
        </div>

    </div>
</c:if>
<div class="content content-nav-base shopcart-content" >
    <div class="cart w1200">
        <c:if test="${not empty shoppingcart}">
            <div class="cart-table-th">
                <div class="th th-chk">
                    <div class="select-all">
                        <div class="cart-checkbox">
                            <input class="check-all check" id="allCheckked" type="checkbox" value="true">
                        </div>
                        <label>&nbsp;&nbsp;全选</label>
                    </div>
                </div>
                <div class="th th-item">
                    <div class="th-inner">
                        商品
                    </div>
                </div>
                <div class="th th-price">
                    <div class="th-inner">
                        单价
                    </div>
                </div>
                <div class="th th-amount">
                    <div class="th-inner">
                        数量
                    </div>
                </div>
                <div class="th th-sum">
                    <div class="th-inner">
                        小计
                    </div>
                </div>
                <div class="th th-op">
                    <div class="th-inner">
                        操作
                    </div>
                </div>
            </div>
            <form action="${pageContext.request.contextPath}/to/checkout2">
            <div class="OrderList">
                <div class="order-content" id="list-cont">
                    <c:forEach var="shopping" items="${shoppingcart}" varStatus="status">
                        <ul class="item-content layui-clear">
                            <li class="th th-chk">
                                <div class="select-all">
                                    <div class="cart-checkbox">
                                        <input class="CheckBoxShop check" type="checkbox" num="all" name="cartid"  value="${shopping.id}">
                                    </div>
                                </div>
                            </li>
                            <li class="th th-item">
                                <div class="item-cont">
                                    <a href="javascript:;"><img src="${pageContext.request.contextPath}/image/goods/${shopping.goodsid}/img1.jpg" alt=""></a>
                                    <div class="text">
                                        <div class="title"><c:out value="${shopping.goodsname}"></c:out></div>
                                        <p><span><c:out value="${shopping.color}"></c:out></span></p>
                                    </div>
                                </div>
                            </li>
                            <li class="th th-price">
                                <span class="th-su"><c:out value="${shopping.goodsprice}"></c:out></span>
                            </li>
                            <li class="th th-amount">
                                <div class="box-btn layui-clear">
                                    <a href="${pageContext.request.contextPath}/shoppingController/jianshao?number=${shopping.number}&id=${shopping.id}"> <div class="less layui-btn">-</div></a>
                                    <input class="Quantity-input" type="" name="goodsprice" value="${shopping.number}" disabled="disabled">
                                    <a href="${pageContext.request.contextPath}/shoppingController/zengjia?number=${shopping.number}&id=${shopping.id}"><div class="add layui-btn">+</div></a>
                                </div>
                            </li>
                            <li class="th th-sum">
                                <span class="sum" id="snumber${status.index}"><c:out value="${shopping.goodsprice*shopping.number}"></c:out></span>
                            </li>
                            <li class="th th-op">
                                <a href="${pageContext.request.contextPath}/shoppingController/deletegoods?id=${shopping.id}"><span class="dele-btn">删除</span></a>

                            </li>
                        </ul>
                    </c:forEach>
                </div>
            </div>
            <div class="FloatBarHolder layui-clear">
                <div class="th th-chk">
                    <div class="select-all">
                        <label>&nbsp;&nbsp;已选<span class="Selected-pieces" >0</span>件</label>
                    </div>
                </div>
                <div class="th batch-deletion">
                    <a href="${pageContext.request.contextPath}/shoppingController/deletegoodsAll"><span class="batch-dele-btn" >批量删除</span></a>
                </div>
                <div class="th Settlement">
                    <input type="submit" class="layui-btn" value="结算" style="width: 120px;height: 80px"/>
                </div>
                <div class="th total">
                    <p>应付：<span class="pieces-total">0</span></p>
                </div>
            </div>
            </form>
        </c:if>
    </div>
</div>

<div class="content content-nav-base shopcart-content">

</div>
<script type="text/javascript">

    function p(){
        var uls = document.getElementById('list-cont').getElementsByTagName('ul');//每一行
        var checkInputs = document.getElementsByClassName('check'); // 所有勾选框
        var checkAll = document.getElementsByClassName('check-all'); //全选框
        var SelectedPieces = document.getElementsByClassName('Selected-pieces')[0];//总件数
        var piecesTotal = document.getElementsByClassName('pieces-total')[0];//总价
        var batchdeletion = document.getElementsByClassName('batch-deletion')[0]//批量删除按钮
        //计算
        function getTotal(){
            var seleted = 0,price = 0;
            for(var i = 0; i < uls.length;i++){
                if(uls[i].getElementsByTagName('input')[0].checked){
                    seleted += parseInt(uls[i].getElementsByClassName('Quantity-input')[0].value);
                    price += parseFloat(uls[i].getElementsByClassName('sum')[0].innerHTML);
                }
            }
            SelectedPieces.innerHTML = seleted;
            piecesTotal.innerHTML = '￥' + price.toFixed(2);
        }

        function fn1(){
            alert(1)
        }
        // 小计
        function getSubTotal(ul){
            var unitprice = parseFloat(ul.getElementsByClassName('th-su')[0].innerHTML);
            var count = parseInt(ul.getElementsByClassName('Quantity-input')[0].value);
            var SubTotal = parseFloat(unitprice*count)
            ul.getElementsByClassName('sum')[0].innerHTML = SubTotal.toFixed(2);
        }

        for(var i = 0;i < checkInputs.length;i++){
            checkInputs[i].onclick = function(){
                if(this.className === 'check-all check'){
                    for(var j = 0;j < checkInputs.length; j++){
                        checkInputs[j].checked = this.checked;
                    }
                }
                if(this.checked == false){
                    for(var k = 0;k < checkAll.length;k++){
                        checkAll[k].checked = false;
                    }
                }
                getTotal()
            }
        }

        checkAll[0].checked = true;
        checkAll[0].onclick();
    }


</script>
</body>
</html>
