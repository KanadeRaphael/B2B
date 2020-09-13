<%--
  Created by IntelliJ IDEA.
  User: xif19
  Date: 2018/12/29
  Time: 13:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<div class="modal fade" id="address">
    <div class="modal-dialog" style="width: 500px;">
        <div class="modal-content">
            <div class="modal-header text-center">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">编辑收货地址</h4>
            </div>
            <div class="modal-body">
                <form id="address-form" action="${pageContext.request.contextPath}/saveOrUpdateAddress" method="post" role="form">
                    <input type="hidden" id="id" name="id">
                    <input type="hidden" id="type" name="type">
                    <div class="form-group">
                        <label class="txtlbl" for="consignee">收货人:</label>
                        <input class="form-control" type="text" id="consignee" name="consignee" autocomplete="off">
                    </div>
                    <div class="form-group">
                        <label class="txtlbl" for="mobile">手机:</label>
                        <input class="form-control" type="text" id="mobile" name="mobile" autocomplete="off">
                    </div>
                    <div class="form-group">
                        <label class="txtlbl">地区:</label>
                        <ul>
                            <li>
                                <label for="province" class="label label-info">省份</label>
                                <select id="province" name="province" class="form-control" data-live-search="true">
                                </select>
                            </li>
                            <li>
                                <label for="city" class="label label-info">城市</label>
                                <select id="city" name="city" class="form-control" data-live-search="true">
                                </select>
                            </li>
                        </ul>
                    </div>
                    <div class="clearfix"></div><br/>
                    <div class="form-group">
                        <label class="txtlbl" for="detail">详细地址:</label>
                        <input class="form-control" type="text" id="detail" name="detail" autocomplete="off">
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <input class="btn btn-default" form="address-form" type="submit" value="保存地址"/>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>