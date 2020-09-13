<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>商品评价</title>
    <jsp:include page="style.jsp"/>
</head>
<body>   <!--style="margin: 0 200px 0 200px"-->
<table class="table-border" width="1000px" align="center" cellpadding="4" cellspacing="0">
    <c:forEach var="review" items="${reviews.rows}" varStatus="status">
        <tr>
            <td valign="top" width="50%" style="border-bottom: 1px solid #666666">
                <div class="customer-reviews">
                    <div class="date">
                        <p>${review.user.nick}
                            <small style="float:right">(提交日期 ${review.date})</small>
                        </p>
                    </div>
                    <div class="customer-reviews-two">
                        <p>质量</p>
                        <div class="pro-rating pro-ra-two">
                            <div class="pro_one">
                                <c:forEach var="x" begin="2" end="${review.quality}" step="2">
                                    <a><i class="fa fa-star"></i></a>
                                </c:forEach>
                            </div>
                            <c:if test="${review.price%2==1}">
                                <div class="pro_one">
                                    <a><i class="fa fa-star-half-full"></i></a>
                                </div>
                            </c:if>
                            <div class="pro_one">
                                <c:forEach var="x" begin="2" end="${10-review.quality}" step="2">
                                    <a><i class="fa fa-star-o"></i></a>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="customer-reviews-two">
                        <p>价格</p>
                        <div class="pro-rating pro-ra-two">
                            <div class="pro_one">
                                <c:forEach var="x" begin="2" end="${review.price}" step="2">
                                    <a><i class="fa fa-star"></i></a>
                                </c:forEach>
                            </div>
                            <c:if test="${review.price%2==1}">
                                <div class="pro_one">
                                    <a><i class="fa fa-star-half-full"></i></a>
                                </div>
                            </c:if>
                            <div class="pro_one">
                                <c:forEach var="x" begin="2" end="${10-review.price}" step="2">
                                    <a><i class="fa fa-star-o"></i></a>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div class="customer-reviews-two">
                        <p>性价比</p>
                        <div class="pro-rating pro-ra-two">
                            <div class="pro_one">
                                <c:forEach var="x" begin="2" end="${review.value}" step="2">
                                    <a><i class="fa fa-star"></i></a>
                                </c:forEach>
                            </div>
                            <c:if test="${review.value%2==1}">
                                <div class="pro_one">
                                    <a><i class="fa fa-star-half-full"></i></a>
                                </div>
                            </c:if>
                            <div class="pro_one">
                                <c:forEach var="x" begin="2" end="${10-review.value}" step="2">
                                    <a><i class="fa fa-star-o"></i></a>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    <div><p>
                        评价内容：<br>
                            ${review.content}
                    </p>
                    </div>
                </div>
            </td>
            <td valign="top" width="50%" style="border-bottom: 1px solid #666666">
                <div class="tm-m-photos">
                    <ul class="tm-m-photos-thumb">
                        <c:forEach var="reviewPic" items="${review.fname}">
                            <li data-src="../../image/goods/${goods_id}/${review.user.id}/${reviewPic}"><img src="../../image/goods/${goods_id}/${review.user.id}/${reviewPic}"> <b
                                    class="tm-photos-arrow"></b></li>
                        </c:forEach>
                    </ul>
                    <div class="tm-m-photo-viewer">
                        <img src="">
                        <a class="tm-m-photo-viewer-navleft"><i></i></a>
                        <a class="tm-m-photo-viewer-navright"><i></i></a>
                    </div>
                </div>
            </td>
        </tr>
    </c:forEach>
</table>
<br>
<div id="pagination" class="pagination">
    <c:set value="${(pnR-2)<1?1:(pnR-2)}" var="beginpg"/>
    <c:set value="${(reviews.totalpg)<(pnR+2)?(reviews.totalpg):(pnR+2)}" var="endpg"/>
    <ul>
        <li><a href="${pageContext.request.contextPath}/page/review?pnR=1&goods_id=${goods_id}">首页</a></li>
        <li <c:if test="${pnR-1<1}">class="disabled"</c:if>><a
                href="${pageContext.request.contextPath}/page/review?pnR=${pnR-1}&goods_id=${goods_id}">&lt;</a></li>
        <c:forEach var="x" begin="${beginpg}" end="${endpg}" step="1">
            <li <c:if test="${pnR==x}">class="active"</c:if>><a
                    href="${pageContext.request.contextPath}/page/review?pnR=${x}&goods_id=${goods_id}">${x}</a></li>
        </c:forEach>
        <li <c:if test="${pnR+1>reviews.totalpg}">class="disabled"</c:if>><a
                href="${pageContext.request.contextPath}/page/review?pnR=${pnR+1}&goods_id=${goods_id}">&gt;</a></li>
        <li><a href="${pageContext.request.contextPath}/page/review?pnR=${endpg}&goods_id=${goods_id}">尾页</a></li>
        <li class="totalPage"><span>跳转到</span>
            <input maxlength="${endpg}" minlength="${beginpg}" type="number"
                   onblur="window.location.href='/page/review?goods_id=${goods_id}&pnR='+$(this).val()"><span>页</span></li>
        <li class="totalPage">共&nbsp;${reviews.totalpg}&nbsp;页</li>
        <li class="totalPage">每页&nbsp;5&nbsp;条</li>
        <li class="totalPage">合计&nbsp;${reviews.total}&nbsp;条数据</li>
    </ul>
</div>
</body>
<jsp:include page="script.jsp"/>
</html>
