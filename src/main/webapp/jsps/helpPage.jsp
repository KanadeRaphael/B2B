<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>
    <title>帮助中心</title>
    <jsp:include page="public/inc.jsp"/>
</head>
<body>
<jsp:include page="public/header.jsp"/>
<div class="container" style="margin-top: 100px;">
    <div class="container">
        <h2 class="h2 text-left"><strong>Search:</strong></h2>
        <div class="input-group">
            <input type="text" class="form-control" placeholder="请输入关键字..."/>
            <span class="input-group-btn">
      <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-search"></span></button>
      </span> </div>
        <!-- /input-group -->
        <hr />
    </div>
    <div class="container">
        <p class="text-info">全部(99+)</p>
        <hr />
    </div>
    <div class="container">
        <div class="panel panel-warning">
            <div class="panel-heading">Windows 10</div>
            <div class="panel-body">缺少.NET Framework</div>
            <div class="panel-footer">from:Cooperation</div>
        </div>
    </div>
    <div class="container text-center">
        <ul class="pagination pagination-sm">
            <li><a href="#"><span class="glyphicon glyphicon-chevron-left"></span></a></li>
            <li><a href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#"><span class="glyphicon glyphicon-chevron-right"></span></a></li>
        </ul>
    </div>
</div>
</body>
</html>
