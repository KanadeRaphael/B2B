<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="modal fade" id="register">
    <div class="modal-dialog" style="width: 400px;">
        <div class="modal-content">
            <div class="modal-header text-center">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">账号注册</h4>
            </div>
            <div class="modal-body">
                <form id="form_reg" role="form">
                    <div class="form-group">
                        <input class="form-control" id="email1" type="email" name="email" placeholder="邮箱">
                    </div>
                    <div class="form-group">
                        <%--<div class="row">--%>
                        <input class="form-control col-sm-6" style="width: 50%;" type="text" id="valid" name="valid" placeholder="请输入验证码"/>
                        <span class="col-sm-3"></span>
                        <input class="btn btn-sm btn-primary col-sm-3 pull-right mailbtn" type="button" value="获取验证码" onclick="getValidate()"/>
                        <%--</div>--%>
                    </div>
                    <div class="form-group" style="clear:both;padding-top: 15px;">
                        <input class="form-control" type="password" name="password" placeholder="新密码" autocomplete="off"/>
                    </div>
                    <div class="form-group">
                        <input class="form-control" type="password" name="password2" placeholder="再次输入" autocomplete="off"/>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <input type="button" class="btn btn-primary" value="提交" onclick="register()"/>
                <input type="button" class="btn btn-default" value="返回登录" data-dismiss="modal" data-toggle="modal" data-target="#login"/>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>