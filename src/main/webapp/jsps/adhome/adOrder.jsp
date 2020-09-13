<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: xif19
  Date: 2018/12/16
  Time: 22:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订单中心</title>
    <!-- FontAwesome Styles-->
    <link href="../../assets/css/font-awesome.css" rel="stylesheet" />
    <!-- Custom Styles-->
    <link href="../../assets/css/custom-styles.css" rel="stylesheet" />
    <jsp:include page="${pageContext.request.contextPath}/jsps/public/inc.jsp" />
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/jsps/public/header.jsp" />
<div class="container">
    <!--/. NAV TOP  -->
    <div class="row">
        <div class="col-lg-3">
            <jsp:include page="include/navSide.jsp"/>
        </div>
        <div id="wrapper" class="col-lg-9">
            <div id="page-wrapper" >
                <div id="page-inner">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <ul id="orderSearch" class="nav nav-tabs">
                                        <li class="active"><a href="#" data-toggle="tab">全部订单</a></li>
                                        <li class=""><a href="#" data-toggle="tab">待付款</a></li>
                                        <li class=""><a href="#" data-toggle="tab">待收货</a></li>
                                        <li class=""><a href="#" data-toggle="tab">待评价</a></li>
                                        <li class=""><a href="#" data-toggle="tab">已退款</a></li>
                                    </ul>
                                    <div class="tab-content">
                                        <div class="tab-pane fade active in">
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <!-- Advanced Tables -->
                                                    <div class="panel panel-default">
                                                        <div class="panel-body">
                                                            <div class="table-responsive">
                                                                <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                                                                    <thead id="theader">
                                                                    <%--<tr>
                                                                        <th>订单号</th>
                                                                        <th>收货人</th>
                                                                        <th>收货地址</th>
                                                                        <th>总金额（含运费）</th>
                                                                        <th>订单创建时间</th>
                                                                        <th>订单状态</th>
                                                                        <th>查看</th>
                                                                    </tr>--%>
                                                                    </thead>
                                                                    <tbody id="tbody">
                                                                    <%--<c:if test="${orders!=null}">
                                                                        <c:forEach items="${orders}" var="o">
                                                                            <tr class="odd gradeA">
                                                                                <td class="text-center">${o.id}</td>
                                                                                <td>${o.reciver}</td>
                                                                                <td>${o.address}</td>
                                                                                <td class="center">${o.totalGoodsPrice+o.transportCost}</td>
                                                                                <td class="center">${o.date}</td>
                                                                                <td class="center">${o.status}</td>
                                                                                <td class="center"><a href='#'>${o.id}</a></td>
                                                                            </tr>
                                                                        </c:forEach>
                                                                    </c:if>
                                                                    <c:if test="${orders==null}">
                                                                        <tr class="text-info">您暂时没有订单!</tr>
                                                                    </c:if>--%>
                                                                    </tbody>
                                                                </table>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <!--End Advanced Tables -->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                    <footer></footer>
                </div>
                <!-- /. PAGE INNER  -->
            </div>
            <!-- /. PAGE WRAPPER  -->
        </div>
    </div>
</div>
<!-- Metis Menu Js -->
<script src="../../assets/js/jquery.metisMenu.js"></script>
<!-- DATA TABLE SCRIPTS -->
<script src="../../assets/js/dataTables/jquery.dataTables.js"></script>
<script src="../../assets/js/dataTables/dataTables.bootstrap.js"></script>
<script>
    $(document).ready(function () {
        $('#dataTables-example').dataTable();
    });
</script>
<!-- Custom Js -->
<script src="../../assets/js/custom-scripts.js"></script>
<script>
    function gettime(t){
        var _time=new Date(t);
        var   year=_time.getFullYear();
        var   month=_time.getMonth()+1;
        var   date=_time.getDate();
        var   hour=_time.getHours();
        var   minute=_time.getMinutes();
        var   second=_time.getSeconds();
        return   year+"年"+month+"月"+date+"日 "+hour+":"+minute+":"+second;//这里自己按自己需要的格式拼接
    }
    $("#orderSearch li").click(function () {
        var index=$(this).index();
        var str="";
        var body=$("#tbody");
        var header=$("#theader");
        $.getJSON("${pageContext.request.contextPath}/adminOrder2",{"status":index},function(data){
            body.empty();
            header.empty();
            header.append("<tr><th>订单号</th><th>收货人</th><th>收货地址</th><th>总金额（含运费）</th><th>订单创建时间</th><th>订单状态</th><th>查看</th></tr>");
            $.each(data,function(idx,item){
                str="<tr class='odd gradeA'><td class='text-center'>"+item.id
                    +"</td><td>"+item.reciver+"</td><td>"
                    +item.address+"</td><td class='center'>"
                    +(item.totalGoodsPrice+item.transportCost)
                    +"</td><td class='center'>" +gettime(item.date)
                    +"</td><td class='center'>"+item.status
                    +"</td><td class='center'><a href='javascript:void(0);'>"+item.id+"</a></td></tr>";
                body.append(str);
            });
            $("tr").delegate("a","click",function () {
                var id=$(this).text();
                header.empty();
                body.empty();
                header.append("<tr><th>详单号</th><th>商品编号</th><th>商品数目</th><th>商品名称</th><th>商品购入单价</th><th>总金额</th></tr>");
                $.getJSON("${pageContext.request.contextPath}/detail/"+id,function(data){
                    $.each(data,function(idx,item){
                        str="<tr class='odd gradeA'><td class='text-center'>"+item.id
                            +"</td><td>"+item.goodsId+"</td><td>"
                            +item.goodsNum+"</td><td class='center'>"
                            +item.goodsName
                            +"</td><td class='center'>" +item.price
                            +"</td><td class='center'>"+(item.price*item.goodsNum)
                            +"</td></tr>";
                        body.append(str);
                    });
                });
            });
        });
        $("[class='active']").removeClass("active");
        $(this).addClass("active");
    });
    $("#orderSearch li:first").click();
</script>
</body>
</html>
