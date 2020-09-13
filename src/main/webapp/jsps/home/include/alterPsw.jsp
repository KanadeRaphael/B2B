<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div class="modal fade" id="alterPsw">
    <div class="modal-dialog" style="width: 400px;">
        <div class="modal-content">
            <div class="modal-header text-center">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">修改密码</h4>
            </div>
            <div class="modal-body">
                <form name="loginForm" method="post" role="form">
                    <div class="form-group">
                        <%--<div class="row">--%>
                        <input class="form-control col-sm-6" style="width: 40%;" type="text" name="valid" id="valid1"
                               placeholder="请输入验证码"/>
                        <span class="col-sm-3"></span>
                        <input class="btn btn-sm btn-primary col-sm-3 pull-right mailbtn" type="button" value="获取验证码"
                               onclick="getValidate()"/>
                        <%--</div>--%>
                    </div>
                    <div class="form-group" style="clear:both;padding-top: 15px;">
                        <input class="form-control" type="password" id="password" name="password" placeholder="新密码"
                               autocomplete="off"/>
                    </div>
                    <div class="form-group">
                        <input class="form-control" type="password" id="password2" name="password2" placeholder="再次输入"
                               autocomplete="off"/>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <input class="btn btn-primary" type="submit" value="修改">
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
