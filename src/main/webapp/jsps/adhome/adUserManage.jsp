<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!Doctype html>
<html>
<head>
    <title>用户管理</title>
    <link href="../../assets/css/font-awesome.css" rel="stylesheet" />
    <link href="../../assets/css/custom-styles.css" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/js/frame/bootstrap-3.3.7/css/bootstrap.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/bootstrap-table.css"/>
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/frame/bootstrap-3.3.7/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap-table.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap-table-zh-CN.js"></script>
</head>
<body>
<jsp:include page="${pageContext.request.contextPath}/jsps/public/header.jsp" />
<div class="container">
    <!--/. NAV TOP  -->
    <div class="row">
        <div class="col-sm-3">
            <jsp:include page="include/navSide.jsp"/>
        </div>
        <div class="col-sm-9">
            <table class="table table-striped table-bordered" id="table"></table>
        </div>
    </div>
</div>
<jsp:include page="editUser.jsp"/>
<jsp:include page="showUser.jsp"/>
<script>
    var table=$("#table");
    var orderTable=$("#orderTable");
    function lookUser(row) {
        initOrderTable(row);
        $("#showUserDetail").modal();
    }
    function dbUser(row) {
        initOrderTable(row.id);
        $("#showUserDetail").modal();
    }
    function editUser(id) {
        $.ajax({
            type: "POST",
            url:"${pageContext.request.contextPath}/getUser",
            data:{"id":id},
            async: false,
            success: function(data) {
                if(data.success){
                    $("#id").val(data.obj.id);
                    $("#uid").val(data.obj.uid);
                    $("#password").val(data.obj.password);
                    $("#nick").val(data.obj.nick);
                    if(data.obj.gender=='男'){
                        $("#sex_male").attr("checked","checked")
                    }else{
                        $("#sex_female").attr("checked","checked")
                    }
                    $("#trueName").val(data.obj.trueName);
                    $("#mobile").val(data.obj.mobile);
                    $("#email").val(data.obj.email);
                    $("#birthday").val(gettime(data.obj.birthday,0));
                    $("#registerTime").val(gettime(data.obj.registerTime,1));
                    $("#showUser").modal();
                }else{
                    alert(data.msg);
                    window.location.reload();
                }
            }
        });
    }
    function deleteUser(id) {
        //alert("d"+id);
        $.ajax({
            type: "POST",
            url:"${pageContext.request.contextPath}/deleteUser",
            data:{"id":id},
            async: false,
            success: function(data) {
                if(data.success){
                    alert(data.msg);
                    window.location.reload();
                }else{
                    alert(data.msg);
                    window.location.reload();
                }
            }
        });
    }
    function gettime(t,i){
        var _time=new Date(t);
        var   year=_time.getFullYear();
        var   month=_time.getMonth()+1;
        var   date=_time.getDate();
        var   hour=_time.getHours();
        var   minute=_time.getMinutes();
        var   second=_time.getSeconds();
        if(i==0){
            //yy-mm-rr
            return   year+"-"+month+"-"+date;
        }else if(i==1){
            //全
            return   year+"年"+month+"月"+date+"日 "+hour+":"+minute+":"+second;
        }
        return "";
    }
    //连接字段格式化
    function linkFormatter(value, row, index) {
        return "<a href='" + value + "' title='单击打开连接' target='_blank'>" + value + "</a>";
    }
    //Email字段格式化
    function emailFormatter(value, row, index) {
        return "<a href='mailto:" + value + "' title='单击打开连接'>" + value + "</a>";
    }
    //性别字段格式化
    function sexFormatter(value) {
        if (value == "女") {
            color = 'Pink';
        } else if (value == "男") {
            color = 'Green';
        } else { color = 'RED'; }
        return '<div  style="color: ' + color + '">' + value + '</div>';
    }
    function dateFormatter(value, row, index) {
        return gettime(value,1);
    }
    function actionFormatter(value, row, index) {
        var result = "";
        result += "<a href='javascript:;' class='btn btn-xs green' onclick=\"lookUser('" +value+"')\" title='查看'><span class='glyphicon glyphicon-search'></span></a>";
        result += "<a href='javascript:;' class='btn btn-xs blue' onclick=\"editUser('" +value+ "')\" title='编辑'><span class='glyphicon glyphicon-pencil'></span></a>";
        result += "<a href='javascript:;' class='btn btn-xs red' onclick=\"deleteUser('" +value+ "')\" title='删除'><span class='glyphicon glyphicon-remove'></span></a>";
        return result;
    }
    function initTable(){
        table.bootstrapTable('destroy');
        table.bootstrapTable({ // 对应table标签的id
            url: "${pageContext.request.contextPath}/adUserData", // 获取表格数据的url
            method: 'POST',
            contentType: "application/x-www-form-urlencoded",//post请求的话就加上这个句话
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //分页
            paginationLoop:false,
            paginationPreText:'上一页',
            paginationNextText:'下一页',
            sortable: false,                     //是否启用排序
            sortOrder: "asc",                   //排序方式
            sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
            pageNumber: 1,                      //初始化加载第一页，默认第一页,并记录
            pageSize: 5,                      //每页的记录行数（*）
            pageList: [1,2,3,4,5,10,50,100],        //可供选择的每页的行数（*）
            search: true,                      //是否显示表格搜索
            strictSearch: true,
            showColumns: true,                  //是否显示所有的列（选择显示的列）
            showRefresh: true,                  //是否显示刷新按钮
            minimumCountColumns: 2,             //最少允许的列数
            clickToSelect: true,                //是否启用点击选中行
            //height: 500,                      //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "id",                     //每一行的唯一标识，一般为主键列
            showToggle: true,                   //是否显示详细视图和列表视图的切换按钮
            cardView: false,                    //是否显示详细视图
            detailView: false,                  //是否显示父子表
            //得到查询的参数
            queryParams : function (params) {
                //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                var temp = {
                    rows: params.limit,                         //页面大小
                    page: (params.offset / params.limit) + 1,   //页码
                    search: params.search
                };
                return temp;
            },
            columns: [
                {
                    checkbox: true,
                    visible: false                  //是否显示复选框
                }, {
                    field: 'id', // 返回json数据中的name
                    title: '用户ID', // 表格表头显示文字
                    align: 'center', // 左右居中
                    valign: 'middle' // 上下居中
                }, {
                    field: 'uid', // 返回json数据中的name
                    title: '用户UID', // 表格表头显示文字
                    align: 'center', // 左右居中
                    valign: 'middle' // 上下居中
                },{
                    field: 'password',
                    title: '密码',
                    align: 'center',
                    valign: 'middle'
                },{
                    field: 'nick',
                    title: '昵称',
                    align: 'center',
                    valign: 'middle'
                },{
                    field: 'gender',
                    title: '性别',
                    align: 'center',
                    valign: 'middle',
                    formatter:sexFormatter
                },{
                    field: 'trueName',
                    title: '姓名',
                    align: 'center',
                    valign: 'middle'
                },{
                    field: 'mobile',
                    title: '电话',
                    align: 'center',
                    valign: 'middle'
                },{
                    field: 'email',
                    title: '邮箱',
                    align: 'center',
                    valign: 'middle',
                    formatter:emailFormatter
                },{
                    field: 'birthday',
                    title: '生日',
                    align: 'center',
                    valign: 'middle',
                    formatter:dateFormatter
                },{
                    field: 'registerTime',
                    title: '注册时间',
                    align: 'center',
                    valign: 'middle',
                    formatter:dateFormatter
                },{
                    field: 'id',
                    title: '操作',
                    width: 120,
                    align: 'center',
                    valign: 'middle',
                    formatter:actionFormatter
                }
            ],
            onLoadSuccess: function(){  //加载成功时执行
                console.info("加载成功");
            },
            onLoadError: function(){  //加载失败时执行
                console.info("加载数据失败");
            },
            onDblClickRow: function (row) {
                dbUser(row);
            }
        });
    }
    function initOrderTable(id){
        orderTable.bootstrapTable('destroy');
        orderTable.bootstrapTable({ // 对应table标签的id
            url: "${pageContext.request.contextPath}/adUserOrder", // 获取表格数据的url
            method: 'POST',
            contentType: "application/x-www-form-urlencoded",//post请求的话就加上这个句话
            striped: true,                      //是否显示行间隔色
            cache: false,                       //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true,                   //分页
            paginationLoop:false,
            paginationPreText:'上一页',
            paginationNextText:'下一页',
            sortable: false,                     //是否启用排序
            sortOrder: "asc",                   //排序方式
            sidePagination: "server",           //分页方式：client客户端分页，server服务端分页（*）
            pageNumber: 1,                      //初始化加载第一页，默认第一页,并记录
            pageSize: 5,                      //每页的记录行数（*）
            pageList: [1,2,3,4,5,10,50,100],        //可供选择的每页的行数（*）
            search: false,                      //是否显示表格搜索
            strictSearch: true,
            showColumns: true,                  //是否显示所有的列（选择显示的列）
            showRefresh: true,                  //是否显示刷新按钮
            minimumCountColumns: 2,             //最少允许的列数
            clickToSelect: true,                //是否启用点击选中行
            //height: 500,                      //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "id",                     //每一行的唯一标识，一般为主键列
            showToggle: true,                   //是否显示详细视图和列表视图的切换按钮
            cardView: false,                    //是否显示详细视图
            detailView: true,                  //是否显示父子表
            //得到查询的参数
            queryParams : function (params) {
                //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                var temp = {
                    rows: params.limit,                         //页面大小
                    page: (params.offset / params.limit) + 1,   //页码
                    id: id
                };
                return temp;
            },
            columns: [
                {
                    checkbox: true,
                    visible: false                  //是否显示复选框
                }, {
                    field: 'id', // 返回json数据中的name
                    title: '订单编号', // 表格表头显示文字
                    align: 'center', // 左右居中
                    valign: 'middle' // 上下居中
                }, {
                    field: 'status', // 返回json数据中的name
                    title: '订单状态', // 表格表头显示文字
                    align: 'center', // 左右居中
                    valign: 'middle' // 上下居中
                },{
                    field: 'totalGoodsPrice',
                    title: '订单商品总金额',
                    align: 'center',
                    valign: 'middle'
                },{
                    field: 'transportCost',
                    title: '订单运输费',
                    align: 'center',
                    valign: 'middle'
                },{
                    field: 'reciver',
                    title: '收货人',
                    align: 'center',
                    valign: 'middle'
                }, {
                    field: 'address',
                    title: '收货地址',
                    align: 'center',
                    valign: 'middle'
                },{
                    field: 'date',
                    title: '订单创建日期',
                    align: 'center',
                    valign: 'middle',
                    formatter:dateFormatter
                },{
                    field: 'reciveDate',
                    title: '验收日期',
                    align: 'center',
                    valign: 'middle',
                    formatter:dateFormatter
                }
            ],
            onLoadSuccess: function(){  //加载成功时执行
                console.info("加载成功");
            },
            onLoadError: function(){  //加载失败时执行
                console.info("加载数据失败");
            },
            onExpandRow: function (index, row, $detail) {
                sonTable(index,row,$detail);
            }
        });
    }
    function sonTable (index, row, $detail) {
        var orderId=row.id;
        var cur_table = $detail.html("<table class='table table-striped table-bordered'></table>").find('table');
        $(cur_table).bootstrapTable('destroy');
        $(cur_table).bootstrapTable({
            url: "${pageContext.request.contextPath}/orderDetail",
            method: 'POST',
            contentType: "application/x-www-form-urlencoded",//post请求的话就加上这个句话
            clickToSelect: true,
            detailView: false,//父子表
            queryParams : function (params) {
                //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                var temp = {
                    id:orderId
                };
                return temp;
            },
            columns: [{
                field: 'id',
                title: '详单编号',
                align: 'center',
                valign: 'middle'
            },{
                field: 'goodsNum',
                title: '商品数量',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'goodsId',
                title: '商品编号',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'goodsName',
                title: '商品名称',
                align: 'center',
                valign: 'middle'
            }, {
                field: 'price',
                title: '商品购入单价',
                align: 'center',
                valign: 'middle'
            }],
            onLoadSuccess: function(){  //加载成功时执行
                console.info("加载成功");
            },
            onLoadError: function(){  //加载失败时执行
                console.info("加载数据失败");
            }
        });
    }
    //initOrderTable();
    initTable();
</script>
</body>
</html>