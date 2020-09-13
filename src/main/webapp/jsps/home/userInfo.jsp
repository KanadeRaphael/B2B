<%--
  Created by IntelliJ IDEA.
  User: xif19
  Date: 2018/12/16
  Time: 22:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!Doctype html>
<html>
<head>
    <title>个人信息</title>
    <!-- Bootstrap Styles-->
    <link href="${pageContext.request.contextPath}/assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <link href="${pageContext.request.contextPath}/assets/css/font-awesome.css" rel="stylesheet" />
    <!-- Custom Styles-->
    <link href="${pageContext.request.contextPath}/assets/css/custom-styles.css" rel="stylesheet" />
    <!-- Google Fonts-->
    <link href="http://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet" type="text/css" />

    <link href="${pageContext.request.contextPath}/css/home/info.css" rel="stylesheet" type="text/css" />
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
                                    <li class="active"><a href="#" data-toggle="tab">基本信息</a>
                                    </li>
                                </ul>
                                <div class="tab-content">
                                    <div class="tab-pane fade active in">
                                        <br/>
                                        <div class="showPic" >
                                            <img src="<c:if test="${sessionScope.user.profile!=null}" var="profile">${pageContext.request.contextPath}/image/profile/${sessionScope.user.profile}</c:if>
                                                                      <c:if test="${not profile}" >${pageContext.request.contextPath}/image/profile/default-head-img.png</c:if>">
                                        </div>
                                        <form id="upload-profile" action="/updateProfile" method="post" enctype="multipart/form-data" >
                                            <input id="profile" name="image" class="hidden" type="file" autocomplete="off" />
                                        </form>
                                        <button class="btn btn-primary btn-sm" onclick="$('#profile').click()"><i class="fa fa-edit "></i> 编辑头像</button> ${message}
                                        <br /><br />
                                        <form action="/updateBaseInfo" method="post" role="form">
                                            <div class="form-group">
                                                <label>昵称：
                                                    <input type="text" name="nick" value="${sessionScope.user.nick}" placeholder="请输入新的昵称">
                                                </label>
                                            </div>
                                            <div class="form-group">
                                                <label>真实姓名：
                                                    <input type="text" name="trueName" value="${sessionScope.user.trueName}" placeholder="请输入真实姓名">
                                                </label>
                                            </div>
                                            <div class="form-group">
                                                <label>性别：</label>
                                                <label class="radio-inline">
                                                    <input type="radio" name="gender" value="男" <c:if test="${sessionScope.user.gender=='男'}">checked</c:if>>男
                                                </label>
                                                <label class="radio-inline">
                                                    <input type="radio" name="gender" value="女" <c:if test="${sessionScope.user.gender=='女'}">checked</c:if>>女
                                                </label>
                                                <label class="radio-inline">
                                                    <input type="radio" name="gender" value="" <c:if test="${sessionScope.user.gender==null}">checked</c:if>>保密
                                                </label>
                                            </div>
                                            <div class="form-group">
                                                <label>生日：</label>
                                                <label>
                                                    <select id="birthdayYear">
                                                        <option value="">请选择</option>
                                                    </select> 年
                                                </label>
                                                <label>
                                                    <select id="birthdayMonth">
                                                        <option value="">请选择</option>
                                                    </select> 月
                                                </label>
                                                <label>
                                                    <select id="birthdayDay">
                                                        <option value="">请选择</option>
                                                    </select> 日
                                                </label>
                                                <input type="hidden" id="birthday" name="birthday" value="${sessionScope.user.birthday}">
                                            </div>
                                            <div class="form-group">
                                                <label>手机：
                                                    <input type="text" name="mobile" value="${sessionScope.user.mobile}">
                                                </label>
                                            </div>
                                            <div class="form-group">
                                                <label>电子邮箱：
                                                    <input type="text" value="${sessionScope.user.email}" disabled>
                                                </label>
                                            </div>
                                            <div class="form-group">
                                                <label>默认收货地址：</label>
                                                <input class="form-control" id="disabledInput" type="text" value="${defaultOrder}" placeholder="未设定默认收货地址" disabled>
                                            </div>
                                            <button type="submit" class="btn btn-default"><i class=" fa fa-refresh "></i> Update</button>
                                            <a data-toggle="modal" data-target="#alterPsw"><button class="btn btn-primary"><i class="fa fa-edit "></i> 修改密码</button></a>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /. ROW  -->
                    <footer></footer>
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

<script src="${pageContext.request.contextPath}/js/home/info.js"></script>
<script src="${pageContext.request.contextPath}/js/logReg.js" type="text/javascript"></script>
<!-- Custom Js -->
<script src="${pageContext.request.contextPath}/assets/js/custom-scripts.js"></script>
</body>
</html>