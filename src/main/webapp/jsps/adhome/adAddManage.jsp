
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <head>
        <title>商品添加管理</title>
        <!-- Bootstrap Styles-->
        <link href="${pageContext.request.contextPath}/assets/css/bootstrap.css" rel="stylesheet" />
        <!-- FontAwesome Styles-->
        <link href="${pageContext.request.contextPath}/assets/css/font-awesome.css" rel="stylesheet" />
        <!-- Custom Styles-->
        <link href="${pageContext.request.contextPath}/assets/css/custom-styles.css" rel="stylesheet" />
        <link href="${pageContext.request.contextPath}/css/myselfcss.css" rel="stylesheet" />
        <jsp:include page="${pageContext.request.contextPath}/jsps/public/inc.jsp" />
    </head>
</head>
<body>
<%@include file="../public/header.jsp"%>
<div class="container">
    <!--/. NAV TOP  -->
    <div class="row">
        <div class="col-lg-3">
            <jsp:include page="include/navSide.jsp"/>
        </div>
        <div id="wrapper" class="col-lg-9">
            <div id="page-wrapper" >
                <div id="page-inner">
                    <div class="row">
                        <div class="col-sm-6 col-md-12">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <ul class="nav nav-tabs">
                                        <li class="active"><a href="#" data-toggle="tab">商品添加信息管理</a>
                                        </li>
                                    </ul>
                                    <div class="tab-content">
                                        <div class="tab-pane fade active in">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <span><h3>请添加商品详细信息</h3></span>
                                                </div>
                                            </div>
                                            <div class="row" style="margin-top: 20px">
                                                <form action="${pageContext.request.contextPath}/addGoodsManage" method="post" enctype="multipart/form-data" class="form-horizontal" role="form">
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <label for="name" class="col-sm-2 control-label">商品名称</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control" id="name" placeholder="请输入商品名称" name="name" onblur="k();"><span style="background-color: rgba(234,17,55,0.97)" id="strname"></span>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="type" class="col-sm-2 control-label">商品类型</label>
                                                            <div class="col-sm-10">
                                                                <select class="form-control" name="type" id="type">
                                                                    <option value="1">手机</option>
                                                                    <option value="2">电脑</option>
                                                                    <option value="3">家具</option>
                                                                </select>
                                                            </div>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="color" class="col-sm-2 control-label">商品颜色</label>
                                                            <select class="form-control" name="color" id="color">
                                                                <option value="red">红色</option>
                                                                <option value="yellow">黄色</option>
                                                                <option value="green">绿色</option>
                                                            </select>
                                                        </div>
                                                        <div class="form-group">
                                                            <label for="intro" class="col-sm-2 control-label">商品介绍</label>
                                                            <div class="col-sm-10">
                                                            <textarea style="height: 80px; width: 100%;resize: none;" class="form-control" id="intro" placeholder="请输入商品名称" name="intro">
                                                            </textarea>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12">
                                                        <span><h3>上传图片</h3></span>
                                                    </div>
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <div class="col-sm-10" style="margin-top: 20px">
                                                                <input type="file" class="mycss_file" name="file" id="fname">
                                                                <input type="file" class="mycss_file" name="file" id="fname1">
                                                                <input type="file" class="mycss_file" name="file" id="fname2">
                                                                <input type="file" class="mycss_file" name="file" id="fname3">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <label for="price" class="col-sm-2 control-label">商品价格</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control" id="price" placeholder="请输入商品价格" name="price">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <label for="number" class="col-sm-2 control-label">库存数量</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control" id="number" placeholder="请输入商品库存" name="number">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <label for="reduction" class="col-sm-2 control-label">降价幅度</label>
                                                            <div class="col-sm-10">
                                                                <input type="text" class="form-control" id="reduction" placeholder="请输入商品将要降价的幅度" name="reduction">
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <div class="col-sm-10">
                                                                <input type="submit" value="提交" class="mycss_bt" onclick="k()">
                                                                <input type="reset" class="mycss_bt" value="重置">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </form>

                                            </div>
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
        </div>
    </div>
</div>

<!-- /. WRAPPER  -->
<!-- JS Scripts-->
<!-- jQuery Js -->
<script src="../../assets/js/jquery-1.10.2.js"></script>
<!-- Bootstrap Js -->
<script src="../../assets/js/bootstrap.min.js"></script>
<!-- Metis Menu Js -->
<script src="../../assets/js/jquery.metisMenu.js"></script>
<!-- DATA TABLE SCRIPTS -->
<script src="../../assets/js/dataTables/jquery.dataTables.js"></script>
<script src="../../assets/js/dataTables/dataTables.bootstrap.js"></script>
<script>
    $(document).ready(function () {
        $('#dataTables-example').dataTable();
    });
    function k() {
        var str = document.getElementById("name");
        if (str.value==null|| str.value==="") {
            document.getElementById("strname").innerHTML="商品名称不能为空";
            str.focus();
        }else{
            document.getElementById("strname").innerHTML="√";
        }
    }

</script>
<!-- Custom Js -->
<script src="../../assets/js/custom-scripts.js"></script>
</body>
</html>
