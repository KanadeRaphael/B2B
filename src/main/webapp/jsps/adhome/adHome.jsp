<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!Doctype html>
<html>
<head>
    <title>用户中心</title>

    <!-- FontAwesome Styles-->
    <link href="../../assets/css/font-awesome.css" rel="stylesheet" />
    <!-- Custom Styles-->
    <link href="../../assets/css/custom-styles.css" rel="stylesheet" />
    <script src="${pageContext.request.contextPath}/js/echarts.min.js"></script>
    <jsp:include page="${pageContext.request.contextPath}/jsps/public/inc.jsp" />
    <link href="../../css/home/index.css" rel="stylesheet" type="text/css" />
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/jsps/public/header.jsp" />
<div class="container">
    <!--/. NAV TOP  -->
    <div class="row">
        <div class="col-lg-3">
            <jsp:include page="include/navSide.jsp"/>
        </div>
        <div class="col-lg-9">
            <div class="row">
                <div class="well" id="main" style="height:600px;"></div>
            </div>
            <div class="row">
                <div class="well" id="main2" style="height:600px;"></div>
            </div>
        </div>
    </div>
</div>
<script>
    var myChart = echarts.init(document.getElementById('main'));
    var myChart2 = echarts.init(document.getElementById('main2'));
    var names=[];    //类别数组（实际用来盛放X轴坐标值）
    var nums=[];    //销量数组（实际用来盛放Y坐标值）
    var pie=[];
    option = {
        title: {
            text: '网站商品销售数'
        },
        tooltip: {},
        legend: {
            data:['销量']
        },
        xAxis: {
            data: []
        },
        yAxis: {},
        series: [{
            name: '销量',
            type: 'bar',
            data: []
        }]
    };
    myChart.setOption(option);
    myChart.showLoading();
    myChart2.showLoading();
    function getData() {
        $.ajax({
            type: "GET",
            url:"${pageContext.request.contextPath}/getData",
            async: false,
            dataType:"json",
            success: function(data) {
                myChart.hideLoading();
                myChart2.hideLoading();
                $.each(data,function(idx,item){
                    names.push(item.name);
                    nums.push(item.buynum);
                    var obj = {};
                    obj.name = item.name;
                    obj.value = item.buynum;
                    pie.push(obj);
                    myChart.setOption({
                        xAxis: {
                            data: names
                        },
                        series: [{
                            // 根据名字对应到相应的系列
                            name: '销量',
                            data: nums
                        }]
                    });
                    myChart2.setOption({
                        legend: {
                            data:names
                        },
                        series: [{
                            name: '访问来源',
                            type: 'pie',
                            radius: '55%',
                            // 根据名字对应到相应的系列
                            data:pie
                        }]
                    });
                });
            }
        });
    }
    setTimeout(function () {
        getData();
    },1000);
</script>
</body>
</html>