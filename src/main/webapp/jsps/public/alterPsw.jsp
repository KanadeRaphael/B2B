<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set value="${(!(sessionScope.user eq null))&&(!(sessionScope.user.id==0))}" var="islogin"/>
<div class="modal fade" id="alterPsw">
    <div class="modal-dialog" style="width: 400px;">
        <div class="modal-content">
            <div class="modal-header text-center">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">修改密码</h4>
            </div>
            <div class="modal-body">
                <form id="alterPswForm" name="loginForm" method="post" role="form">
                    <c:if test="${!islogin}">
                        <div class="form-group">
                            <input class="form-control" id="email2" type="email" name="email" placeholder="邮箱">
                        </div>
                    </c:if>
                    <div class="form-group">
                        <%--<div class="row">--%>
                        <input class="form-control col-sm-6" style="width: 40%;" type="text" id="valid1" name="valid"
                               placeholder="请输入邮箱验证码"/>
                        <span class="col-sm-3"></span>
                        <input class="btn btn-sm btn-primary col-sm-3 pull-right mailbtn" type="button" value="获取验证码"
                               onclick="getValidate()"/>
                        <%--</div>--%>
                    </div>
                    <div class="form-group" style="clear:both;padding-top: 15px;">
                        <input class="form-control" id="password" type="password" name="password" placeholder="新密码"
                               autocomplete="off"/>
                    </div>
                    <div class="form-group">
                        <input class="form-control" id="password2" type="password" name="password2" placeholder="再次输入"
                               autocomplete="off"/>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <input class="btn btn-primary" type="submit" value="修改" onclick="alterPsw()">
                <c:if test="${!islogin}"> <input class="btn btn-default" id="returnLogin" type="button" value="返回登录"
                                                 data-toggle="modal"
                                                 data-dismiss="modal" data-target="#login"/></c:if>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
