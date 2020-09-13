var second = 59;
var counttimeId;
var yzm;
var count = 0;

function getValidate() {
    count++;
    if (count == 5) second = 600;
    var email1 = $("#email1").val();
    var email2 = $("#email2").val();
    var email;
    if (email1 != null && email1 != "")
        email = email1;
    else email = email2;
    $.ajax({
        url: "mail",
        type: "get",
        data: "user_mail=" + email,
        dataType: "text",
        async: true,
        success: function (result) {
            yzm = result;
            count = 0;
        }
    });
    if (second == 59 || second == 600) {
        $(".mailbtn").attr("disabled", true);
        $(".mailbtn").css("background-color", "#777777").css("cursor", "not-allowed");
        countdown59();
        counttimeId = setInterval("countdown59()", 1000);
    }
}

function countdown59() {
    $(".mailbtn").val("技能冷却中:" + second--);
    if (second == -2) {   //先前执行一次防止延迟
        clearTimeout(counttimeId);
        $(".mailbtn").attr("disabled", false);
        $(".mailbtn").css("background-color", "#337ab7").css("cursor", "pointer");
        $(".mailbtn").val("获取验证码");
        second = 59;
    }
}

function my_submit() {
    $.ajax({
        type: "POST",
        url: "/userLogin",
        data: $('#form_login').serialize(),
        async: false,
        success: function (data) {
            if (data.success) {
                alert(data.msg);
                window.location.reload();
            } else {
                alert(data.msg);
            }
        }
    });
}

function register() {
    if ($("#valid").val() == yzm) {
        $.ajax({
            type: "POST",
            url: "/userRegister",
            data: $('#form_reg').serialize(),
            async: false,
            success: function (data) {
                if (data.success) {
                    alert(data.msg);
                    window.location.reload();
                } else {
                    alert(data.msg);
                }
            }
        });
    } else {
        $("#valid").addClass("has-error").val("验证码错误");
        ;
    }
}

function alterPsw() {
    if ($("#valid1").val() == yzm) {
        if ($("#password").val() == $("#password2").val()) {
            $.ajax({
                type: "POST",
                url: "/fun/alterPsw",
                data: $('#alterPswForm').serialize(),
                dataType: "text",
                async: false,
                success: function (data) {
                    alert(data);
                    $("#alterPsw").modal("hide");
                }
            });
        } else alert("两次密码不相同");
    } else {
        $("#valid1").addClass("has-error").val("验证码错误");
    }
}