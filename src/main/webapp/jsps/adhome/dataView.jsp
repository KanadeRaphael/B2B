<%--
  Created by IntelliJ IDEA.
  User: kuro
  Date: 2018/12/28
  Time: 18:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!Doctype html>
<html>
<head>
    <title>Title</title>
    <script src="${pageContext.request.contextPath}/js/echarts.min.js"></script>
    <jsp:include page="${pageContext.request.contextPath}/jsps/public/inc.jsp"/>
</head>
<body>
<div class="row">
    <div class="col-lg-6">
        <div class="container" id="main" style="width: 600px;height:400px;"></div>
    </div>
    <div class="col-lg-6">
        <div class="container" id="main2" style="width: 600px;height:400px;"></div>
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
            text: '网站商品销售额'
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
            type: "POST",
            url:"${pageContext.request.contextPath}/getData",
            async: false,
            dataType:"json",
            success: function(data) {
                myChart.hideLoading();
                myChart2.hideLoading();
                $.each(data,function(idx,item){
                        names.push(item.name);
                        nums.push(item.number);
                    var obj = {};
                    obj.name = item.name;
                    obj.value = item.number;
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
    getData();
</script>
</body>
</html>
