<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade" id="showUser" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="overflow:scroll">
    <div class="modal-dialog" style="width:40%;">
        <div class="modal-content">
            <div class="modal-header text-center">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel"><strong>修改用户信息</strong></h4>
            </div>
            <div class="modal-body">
                <div class="container">
                    <img width="120" class="img-rounded" height="120" src="${pageContext.request.contextPath}/image/a.png">
                </div>
                <form role="form" id="ad_editUser">
                    <div class="form-group">
                        <label for="id" class="label label-info">ID</label>
                        <input id="id" name="id" type="text" class="form-control" readonly="readonly"/>
                    </div>
                    <div class="form-group">
                        <label for="uid" class="label label-info">UID</label>
                        <input id="uid" name="uid" type="text" class="form-control" readonly="readonly"/>
                    </div>
                    <div class="form-group">
                        <label for="password" class="label label-info">密码</label>
                        <input id="password" name="password" type="text" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label for="nick" class="label label-info">昵称</label>
                        <input id="nick" name="nick" type="text" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label class="label label-info">性别</label>
                        <label for="sex_male" class="radio-inline"><input id="sex_male" name="gender" class="radio" type="radio" value="男"/>男</label>
                        <label for="sex_female" class="radio-inline"><input id="sex_female" name="gender" class="radio" type="radio" value="女"/>女</label>
                    </div>
                    <div class="form-group">
                        <label for="trueName" class="label label-info">姓名</label>
                        <input id="trueName" type="text" class="form-control" readonly="readonly"/>
                    </div>
                    <div class="form-group">
                        <label for="mobile" class="label label-info">手机号</label>
                        <input id="mobile" name="mobile" type="text" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label for="email" class="label label-info">邮箱</label>
                        <input id="email" name="email" type="email" class="form-control"/>
                    </div>
                    <div class="form-group">
                        <label for="birthday" class="label label-info">生日</label>
                        <input id="birthday" type="text" class="form-control" readonly="readonly"/>
                    </div>
                    <div class="form-group">
                        <label for="registerTime" class="label label-info">注册时间</label>
                        <input id="registerTime" type="text" class="form-control" readonly="readonly"/>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <input type="button" class="btn btn-primary" value="修改" onclick="adminEditUser();"/>
                <input type="button" class="btn btn-danger" value="关闭" data-dismiss="modal"/>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<script>
    function adminEditUser(){
        $.ajax({
            type: "POST",
            url:"${pageContext.request.contextPath}/editUser",
            data:$('#ad_editUser').serialize(),
            async: false,
            dataType:"json",
            error: function(XMLHttpRequest, textStatus, errorThrown) {
                alert(XMLHttpRequest.status);
                alert(XMLHttpRequest.readyState);
                alert(textStatus);
            },
            success: function(data) {
                if(data.success){
                    alert(data.msg);
                    window.location.reload();
                }else{
                    alert(data.msg);
                }
            }
        });
    }
</script>