<%@ page contentType="text/html;charset=UTF-8" %>
<div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="width:20%;">
        <div class="modal-content">
            <div class="modal-header text-center">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel"><strong>Login</strong></h4>
            </div>
            <div class="modal-body">
                <div class="modal-body">
                    <form role="form" method="post" id="form_login">
                        <div class="form-group">
                            <input type="text" name="uid" class="form-control" placeholder="用户名/邮箱"/>
                        </div>
                        <div class="form-group">
                            <input type="password" name="password" class="form-control" placeholder="密码"/>
                        </div>
                    </form>
                    <div class="form-group">
                        <input class="btn btn-default pull-right" type="button" value="忘了密码" data-dismiss="modal"
                               data-toggle="modal" data-target="#alterPsw"/>
                        <%--</div>--%>
                    </div>
                    <br>
                </div>
            </div>
            <div class="modal-footer">
                <input type="button" class="btn btn-primary" value="登录" onclick="my_submit()"/>
                <input type="button" class="btn btn-default" value="注册" data-dismiss="modal" data-toggle="modal"
                       data-target="#register"/>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
