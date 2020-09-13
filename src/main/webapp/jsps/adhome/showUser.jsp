<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="modal fade" id="showUserDetail" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="overflow: scroll">
    <div class="modal-dialog" style="width:40%;">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel"><strong>用户详情</strong></h4>
            </div>
            <div class="modal-body">
                <h4 class="h4 text-info">用户订单表</h4>
                <div>
                    <table class="table table-striped table-bordered" id="orderTable"></table>
                </div>
<%--                <div>
                    <table class="table table-striped table-bordered" id="followTable"></table>
                </div>
                <div>
                    <table class="table table-striped table-bordered" id="reviewsTable"></table>
                </div>--%>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-danger" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>