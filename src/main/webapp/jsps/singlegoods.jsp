<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!Doctype html>
<html>
<head>
    <jsp:include page="${pageContext.request.contextPath}/jsps/shop/style.jsp"/>
    <jsp:include page="${pageContext.request.contextPath}/jsps/public/inc.jsp"/>
    <%--<jsp:include page="jsps/index/inc.jsp" />--%>
    <title>商品详情</title>
</head>
<body>
<jsp:include page="public/header.jsp"/>
<c:set value="${(!(sessionScope.user eq null))&&(!(sessionScope.user.id==0))}" var="islogin"/>

<section class="shop-details-area"><br><br>
    <div class="shop-details">
        <div class="container">
            <div class="row">
                <div class="col-md-4 col-sm-6 hidden-xs">
                    <div class="s_big">
                        <div>
                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div id="image1" class="tab-pane fade in active">
                                    <div class="simpleLens-big-image-container">
                                        <a class="simpleLens-lens-image"
                                           data-lens-image="${pageContext.request.contextPath}/image/goods/${detail.id}/img1.jpg">
                                            <img alt=""
                                                 src="${pageContext.request.contextPath}/image/goods/${detail.id}/img1.jpg"
                                                 class="simpleLens-big-image">
                                        </a>
                                    </div>
                                </div>
                                <div id="image2" class="tab-pane fade">
                                    <div class="simpleLens-big-image-container">
                                        <a class="simpleLens-lens-image"
                                           data-lens-image="${pageContext.request.contextPath}/image/goods/${detail.id}/img2.jpg">
                                            <img alt=""
                                                 src="${pageContext.request.contextPath}/image/goods/${detail.id}/img2.jpg"
                                                 class="simpleLens-big-image">
                                        </a>
                                    </div>
                                </div>
                                <div id="image3" class="tab-pane fade">
                                    <div class="simpleLens-big-image-container">
                                        <a class="simpleLens-lens-image"
                                           data-lens-image="${pageContext.request.contextPath}/image/goods/${detail.id}/img3.jpg">
                                            <img alt=""
                                                 src="${pageContext.request.contextPath}/image/goods/${detail.id}/img3.jpg"
                                                 class="simpleLens-big-image">
                                        </a>
                                    </div>
                                </div>
                                <div id="image4" class="tab-pane fade">
                                    <div class="simpleLens-big-image-container">
                                        <a class="simpleLens-lens-image"
                                           data-lens-image="${pageContext.request.contextPath}/image/goods/${detail.id}/img4.jpg">
                                            <img alt=""
                                                 src="${pageContext.request.contextPath}/image/goods/${detail.id}/img4.jpg"
                                                 class="simpleLens-big-image">
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="thumnail-image fix">
                                <ul class="tab-menu">
                                    <li class="active"><a data-toggle="tab" href="#image1"><img alt=""
                                                                                                src="${pageContext.request.contextPath}/image/goods/${detail.id}/img1.jpg"></a>
                                    </li>
                                    <li><a data-toggle="tab" href="#image2"><img alt=""
                                                                                 src="${pageContext.request.contextPath}/image/goods/${detail.id}/img2.jpg"></a>
                                    </li>
                                    <li><a data-toggle="tab" href="#image3"><img alt=""
                                                                                 src="${pageContext.request.contextPath}/image/goods/${detail.id}/img3.jpg"></a>
                                    </li>
                                    <li><a data-toggle="tab" href="#image4"><img alt=""
                                                                                 src="${pageContext.request.contextPath}/image/goods/${detail.id}/img4.jpg"></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-5 col-sm-6 col-xs-12">
                    <div class="cras">
                        <div class="product-name">
                            <h1>${detail.name}</h1>
                        </div>
                        <div class="pro-rating">
                            <div class="pro_one">
                                <c:forEach var="x" begin="2" end="${detail.star}" step="2">
                                    <a><i class="fa fa-star"></i></a>
                                </c:forEach>
                            </div>
                            <c:if test="${detail.star%2==1}">
                                <div class="pro_one">
                                    <a><i class="fa fa-star-half-full"></i></a>
                                </div>
                            </c:if>
                            <div class="pro_one">
                                <c:forEach var="x" begin="2" end="${10-detail.star}" step="2">
                                    <a><i class="fa fa-star-o"></i></a>
                                </c:forEach>
                            </div>
                            <p class="rating-links">
                                <a href="#profile" aria-controls="profile" role="tab" data-toggle="tab"
                                   onclick="goToReview()">${detail.reviewsNo} 评价</a>
                            </p>
                        </div>
                        <p class="availability in-stock">
                            库存:
                            <span><c:out value="${detail.number}" escapeXml="false">0</c:out></span>
                        </p>
                        <div class="short-description">
                            <p>${detail.intro}</p>
                        </div>
                        <div class="pre-box">
                            <div class="pricepack">
                                <span class="special-price">¥${detail.price}</span>
                                <c:if test="${(detail.reduction > 0 or detail.reduction < 0)}"><span
                                        class="old-price">¥${detail.price+detail.reduction}</span></c:if>
                            </div>
                        </div>
                        <div class="add-to-box1">
                            <div class="add-to-box add-to-box2">
                                <div class="add-to-cart">
                                    <form id="detailForm" action="${pageContext.request.contextPath}/to/checkout1"
                                          method="get">
                                        <input id="goods_id" form="detailForm" type="hidden" name="goods_id" value="${detail.id}">
                                        <div class="input-content" style="margin-bottom: 25px">
                                            <label>选择颜色:</label>
                                            <div class="btn-group" data-toggle="buttons" id="Select">
                                                <c:forEach var="color" items="${detail.color}" varStatus="s">
                                                    <label class="btn btn-default"
                                                           style="background-color: ${color};opacity: 0.6;padding: 5px 10px 5px 10px">
                                                            <%--<span class="glyphicon glyphicon-unchecked"></span>--%>
                                                        <input type="radio" name="color" value="${color}"
                                                               <c:if test="${s.count==1}">checked</c:if>>${color}
                                                    </label>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <div class="input-content" style="clear: both">
                                            <label for="qty">购买数量:</label>
                                            <input id="qty" class="input-text qty" type="number" title="Qty" value="1"
                                                   minlength="0" maxlength="${detail.number}" name="number">
                                        </div>
                                        <input id="add2Cart" class="button2 btn-cart"
                                               type="button" onclick="${islogin?'Add2Cart()':'login()'}" value="添加到购物车" >
                                        <input class="button3 btn-cart" onclick="${islogin?'document.forms[\'detailForm\'].submit();':'login()'}"
                                               title="" type="button" value="立即购买">
                                    </form>
                                </div>
                                <div class="product-icon">
                                    <a href="javascript:changeFollow(vget(${detail.id}),vget(${islogin}));">
                                        <i class="fa fa-heart<c:if test="${!detail.islike}">-o</c:if>"> </i>
                                    </a>
                                    <a href="http://connect.qq.com/widget/shareqq/index.html?url=http://localhost:8080/to/singlegoods?id=${detail.id}&sharesource=qzone&title=${detail.name}&pics=${detail.name}&summary=http://localhost:8080/image/goods/${detail.id}/img3.jpg&desc=快来买啊"
                                       target="_blank">
                                        <i class="fa fa-share"> </i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-12 col-xs-12">
                    <div class="ma-title">
                        <h2> 相关商品 </h2>
                    </div>
                    <div class="all">
                        <br>
                        <div class=" content_top content_all indicator-style">
                            <c:forEach items="${related}" var="goods" varStatus="status">
                                <c:if test="${status.count%4==1}"><div class="ma-box-content-all"></c:if>
                                <div class="ma-box-content">
                                    <div class="product-img-right">
                                        <a href="/to/singlegoods?id=${goods.id}">
                                            <img class="primary-image" alt=""
                                                 src="${pageContext.request.contextPath}/image/goods/${goods.id}/img1.jpg">
                                        </a>
                                    </div>
                                    <div class="product-content">
                                        <div>
                                            <div class="product-icon" style="float: right;">
                                                <a href="javascript:changeFollow(vget(${goods.id}), vget(${islogin}));"><i
                                                        class="fa fa-heart<c:if test="${!goods.islike}">-o</c:if>"></i></a>
                                            </div>
                                            <h2 class="product-name">
                                                <a href=/to/singlegoods?id=${goods.id}>${goods.name}</a>
                                            </h2>
                                        </div>
                                        <div class="pro-rating">
                                            <div class="pro_one">
                                                <c:forEach var="x" begin="2" end="${goods.star}" step="2">
                                                    <a><i class="fa fa-star"></i></a>
                                                </c:forEach>
                                            </div>
                                            <c:if test="${goods.star%2==1}">
                                                <div class="pro_one">
                                                    <a><i class="fa fa-star-half-full"></i></a>
                                                </div>
                                            </c:if>
                                            <div class="pro_one">
                                                <c:forEach var="x" begin="2" end="${10-goods.star}" step="2">
                                                    <a><i class="fa fa-star-o"></i></a>
                                                </c:forEach>
                                            </div>
                                        </div>
                                        <div class="price-box">
                                            <span class="special">¥${goods.price}</span>
                                            <c:if test="${(goods.reduction > 0 or goods.reduction < 0)}"><span
                                                    class="old">¥${goods.price+goods.reduction}</span></c:if>
                                        </div>
                                    </div>
                                </div>
                                <c:if test="${status.last||status.count%4==0}"></div></c:if>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- end main_slider_area
============================================ -->
<section id="section" class="tab_area">
    <div class="container">
        <div class="row">
            <div class="col-md-12 col-xs-12">
                <div class="text">
                    <!-- Nav tabs -->
                    <ul class="nav nav-tabs" role="tablist">
                        <li id="para" role="presentation" class="active">
                            <a href="#home" aria-controls="home" role="tab" data-toggle="tab">商品参数</a>
                        </li>
                        <li id="rev" role="presentation">
                            <a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">商品评价</a>
                        </li>
                        <c:if test="${detail.isbuy}">
                            <li id="tags" role="presentation">
                                <a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">评价商品</a>
                            </li>
                        </c:if>
                    </ul>
                    <!-- Tab panes -->
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" id="home">
                            <jsp:include page="../image/goods/${detail.id}/attribute.jsp" />
                        </div>

                        <div role="tabpanel" class="tab-pane" id="profile">
                            <div class="row">
                                <div class="col-md-6 col-xs-12">
                                    <iframe id="reviewframe" frameborder=0 height=1200 width=1100
                                            marginheight=0
                                            marginwidth=0 scrolling=auto
                                            src="${pageContext.request.contextPath}/to/review?goods_id=${detail.id}">
                                    </iframe>
                                </div>
                            </div>
                        </div>
                        <div role="tabpanel" class="tab-pane" id="messages">
                            <div class="row">
                                <div class="col-md-6 col-xs-12">
                                    <div class="form-add table-responsive">
                                        <form id="form1" action="${pageContext.request.contextPath}/fun/review" method="post" enctype="multipart/form-data">
                                            <input form="form1" name="goods_id" type="hidden" value="${detail.id}"/>
                                            <input form="form1" id="quality" name="quality" type="hidden" value="10"/>
                                            <input form="form1" id="price" name="price" type="hidden" value="10"/>
                                            <input form="form1" id="value" name="value" type="hidden" value="10"/>
                                            <div class="form-border">
                                                <div class="add-text">
                                                    <h3>
                                                        您正在评价:
                                                        <span>${detail.name}</span>
                                                    </h3>
                                                    <h4>
                                                        您觉得此商品如何？<em>*</em>
                                                    </h4>
                                                </div>
                                                <!-- -->
                                                <span class="clearfix">质量：</span>
                                                <div class="starA fl">
                                                    <div class="starB s10" id="startq"></div>
                                                    <div class="starC">
                                                        <c:forEach var="x" begin="1" end="10" step="1">
                                                            <a href="javascript:;" onclick="OnStar(0,${x})"
                                                               onmouseout="kaifach(0,${x})"
                                                               onmousemove="start(0,${x})"></a>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                                <span class="score" id="scoreq">5.0</span>
                                                <br><br><span class="clearfix">价格：</span>
                                                <div class="starA fl">
                                                    <div class="starB s10" id="startp"></div>
                                                    <div class="starC">
                                                        <c:forEach var="x" begin="1" end="10" step="1">
                                                            <a href="javascript:;" onclick="OnStar(1,${x})"
                                                               onmouseout="kaifach(1,${x})"
                                                               onmousemove="start(1,${x})"></a>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                                <span class="score" id="scorep">5.0</span>
                                                <br><br><span class="clearfix">性价比：</span>
                                                <div class="starA fl">
                                                    <div class="starB s10" id="startv"></div>
                                                    <div class="starC">
                                                        <c:forEach var="x" begin="1" end="10" step="1">
                                                            <a href="javascript:;" onclick="OnStar(2,${x})"
                                                               onmouseout="kaifach(2,${x})"
                                                               onmousemove="start(2,${x})"></a>
                                                        </c:forEach>
                                                    </div>
                                                </div>
                                                <span class="score" id="scorev">5.0</span>
                                                <input class="button2 btn-cart btn-a" type="button" title=""
                                                       onclick="resetScore()" value="重置评分"/>
                                                <div class="input-one form-list">
                                                    <br><br><label class="required">评价内容<em>*</em></label>
                                                    <textarea form="form1" name="content" class="email"></textarea>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <div class="box-collateral">
                                    <h3>其他人给了这个商品这些标签:</h3>
                                    <div class="btn-group" data-toggle="buttons" id="SelectTag">
                                        <c:forEach items="${detail.goodsTags}" var="tag">
                                            <label class="btn btn-default"
                                                   style="padding: 5px 10px 5px 10px">
                                                    <%--<span class="glyphicon glyphicon-unchecked"></span>--%>
                                                <input form="form1" type="radio" name="tag"
                                                       value="${tag.tag}">${tag.tag}(<span>${tag.count}</span>)
                                            </label>
                                        </c:forEach>
                                    </div>
                                    <%--<p>--%>
                                    <%--<c:forEach items="${detail.goodsTags}" var="tag">--%>
                                    <%--<c:forEach items="${detail.goodsTags}" var="tag">--%>
                                    <%--<a href="#">${tag.tag}</a>(${tag.count})--%>
                                    <%--</c:forEach>--%>
                                    <%--</p>--%>
                                </div>
                                <div id="tagDiv" class="input-two">
                                    <label class="required">添加你的标签:</label>
                                    <input form="form1" id="tagtxt" name="tag" type="text" class="email tags" required>
                                    <%--<button class="button2 btn-cart btn-a" type="button" title="">--%>
                                    <%--<span>添加</span>--%>
                                    <%--</button>--%>
                                </div>
                                <p class="note">多个标签只取其一</p>
                                <div class="input-two">
                                    <div class="img-box full">
                                        <section class=" img-section">
                                            <p class="up-p">评价图片：<span class="up-span">最多可以上传4张图片</span></p>
                                            <div class="z_photo upimg-div clear">
                                                <section class="z_file fl">
                                                    <img src="../image/shop/a11.png" class="add-img">
                                                    <input form="form1" type="file" name="imgUp" id="file" class="file"
                                                           accept="image/jpg,image/jpeg,image/png,image/bmp" multiple/>
                                                </section>
                                            </div>
                                        </section>
                                    </div>
                                    <aside class="mask works-mask">
                                        <div class="mask-content">
                                            <p class="del-p ">您确定要删除作品图片吗？</p>
                                            <p class="check-p"><span class="del-com wsdel-ok">确定</span><span
                                                    class="wsdel-no">取消</span></p>
                                        </div>
                                    </aside>
                                </div>
                                <input class="button2 btn-cart btn-in" type="submit" title="" form="form1" value="提交评价"
                                       style="float: right"/>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="product_area">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="ma-title">
                    <h2>
                        降价热销商品
                    </h2>
                </div>
                <div class="row">
                    <div class="UpSell indicator-style">
                        <!-- single-product start -->
                        <c:forEach items="${hot}" var="goods" varStatus="status">
                            <div class=" col-md-3">
                                <div class="single-product">
                                    <span class="sale-text">热销</span>
                                    <div class="product-img">
                                        <a href=/to/singlegoods?id=${goods.id}>
                                            <img class="primary-image"
                                                 src="${pageContext.request.contextPath}/image/goods/${goods.id}/img1.jpg"
                                                 alt=""/>
                                        </a>
                                    </div>
                                    <div class="product-content">
                                        <div class="price-box">
                                            <span class="special">¥${goods.price}</span>
                                            <c:if test="${(goods.reduction > 0 or goods.reduction < 0)}"><span
                                                    class="old">¥${goods.price+goods.reduction}</span></c:if>
                                        </div>
                                        <h2 class="product-name"><a href=/to/singlegoods?id=${goods.id}>${goods.name}</a></h2>
                                        <div class="pro-rating">
                                            <div class="pro_one">
                                                <c:forEach var="x" begin="2" end="${goods.star}" step="2">
                                                    <a><i class="fa fa-star"></i></a>
                                                </c:forEach>
                                            </div>
                                            <c:if test="${goods.star%2==1}">
                                                <div class="pro_one">
                                                    <a><i class="fa fa-star-half-full"></i></a>
                                                </div>
                                            </c:if>
                                                <%--<a href="#"><i class="fa fa-star-half-o"></i></a>--%>
                                            <div class="pro_one">
                                                <c:forEach var="x" begin="2" end="${10-goods.star}" step="2">
                                                    <a><i class="fa fa-star"></i></a>
                                                </c:forEach>
                                            </div>
                                            <div class="product-icon" style="float: right">
                                                <a href="javascript:changeFollow(vget(${goods.id}),vget(${islogin}));"><i
                                                        class="fa fa-heart<c:if test="${!goods.islike}">-o</c:if>"></i></a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <!-- single-product end -->
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- 模态框（Modal） -->
<div class="modal fade" id="cartDialog" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width: 300px">
        <div class="modal-content" style="width: 300px">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">提示信息</h4>
            </div>
            <div class="modal-body">
                添加购物车成功
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <a href="/shoppingController/gotoshoppingcart"><button type="button" class="btn btn-primary">前往购物车-></button></a>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<!-- end footer-address
============================================ -->
<!-- start scrollUp
============================================ -->
<div id="toTop">
    <i class="fa fa-chevron-up"></i>
</div>
<jsp:include page="${pageContext.request.contextPath}/jsps/shop/script.jsp"/>
</body>
</html>