<%--
  Created by IntelliJ IDEA.
  User: xif19
  Date: 2018/12/16
  Time: 22:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!Doctype html>
<html>
<head>
    <title>关注中心</title>
    <!-- Bootstrap Styles-->
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <link href="${pageContext.request.contextPath}/assets/css/font-awesome.css" rel="stylesheet" />
    <!-- Custom Styles-->
    <link href="${pageContext.request.contextPath}/assets/css/custom-styles.css" rel="stylesheet" />
</head>
<body>
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
                                    <li class="active"><a href="#" data-toggle="tab">关注的商品</a>
                                    </li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane fade active in">
                                        <table class="table-border" width="600px" cellpadding="4" cellspacing="0">
                                            <c:forEach var="follow" items="${follows}" varStatus="status">
                                                <c:if test="${status.index%3==0}"><tr></c:if>
                                                <td align="center">
                                                    <a href="/deleteFollow?id=${follow.id}" onclick="return confirm('是否取消关注该商品');">
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                    </a>
                                                    <a href="/to/singlegoods?id=${follow.goodsId}"><img class="picture" width="200px" height="200px" src="${pageContext.request.contextPath}/image/goods/${follow.goodsId}/img1.jpg" alt="" /></a><br>
                                                    <c:out value="${follow.goodsName}"/>
                                                </td>
                                                <c:if test="${status.index%3==2}"></tr></c:if>
                                            </c:forEach>
                                        </table>
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
<script src="${pageContext.request.contextPath}/js/logReg.js" type="text/javascript"></script>
<!-- DATA TABLE SCRIPTS -->
<script src="${pageContext.request.contextPath}/assets/js/dataTables/jquery.dataTables.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/dataTables/dataTables.bootstrap.js"></script>
<script>
    $(document).ready(function () {
        $('#dataTables-example').dataTable();
        $("#main-menu li:eq(4) a").addClass("active-menu");
    });
</script>
<!-- Custom Js -->
<script src="${pageContext.request.contextPath}/assets/js/custom-scripts.js"></script>
</body>
</html>
