$(document).ready(function () {
    $("#Select .btn").on('click', function () {
        ToggleRadioButtons("#Select", $(this));
    });
    $("#SelectTag .btn").on('click', function () {
        $("#tagtxt").val("").attr("disabled",true);
    });
    $("#tagDiv").on('click', function () {
        $("#tagtxt").attr("disabled",false);
        $('input:radio[name="tag"]').removeAttr('checked');
        $("#SelectTag .active").removeClass("active");
    });
});
// 放大图片
(function ($) {
    $.fn.commentImg = function (options) {
        var defaults = {
            activeClass: 'current',
            nextButton: '.next',
            prevButton: '.prev',
            imgNavBox: '.photos-thumb',
            imgViewBox: '.photo-viewer'
        };
        var opts = $.extend({}, defaults, options);

        this.each(function () {
            var _this = $(this),
                imgNav = _this.find(opts.imgNavBox).children(),
                imgViewBox = _this.find(opts.imgViewBox),
                prevBtn = _this.find(opts.prevButton),
                nextBtn = _this.find(opts.nextButton),
                src = '',
                img = new Image();

            function setViewImg(viewSrc) {
                img.src = viewSrc;
                img.onload = function () {
                    var imageWidth = img.width;
                    var imageHeight = img.height;
                    imgViewBox.show(0, function () {
                        $(this).css({"width": imageWidth, "height": imageHeight}).find("img").attr('src', src);
                    });
                }
            }

            imgNav.on("click", function () {
                $(this).toggleClass(opts.activeClass).siblings().removeClass(opts.activeClass);
                if ($(this).hasClass(opts.activeClass)) {
                    src = $(this).attr('data-src');
                    setViewImg(src);
                } else {
                    imgViewBox.css({"width": 0, "height": 0}).hide();
                }
            });

            imgViewBox.on("click", function () {
                imgNav.removeClass(opts.activeClass);
                $(this).css({"width": 0, "height": 0}).hide();
            });

            prevBtn.hover(function () {
                var index = imgNav.index(_this.find(opts.imgNavBox).children("." + opts.activeClass));
                if (index < 1) {
                    $(this).css({"cursor": "default"}).children().hide();
                } else {
                    $(this).css({"cursor": "pointer"}).children().show();
                }
            }, function () {
                $(this).css({"cursor": "default"}).children().hide();
            });

            nextBtn.hover(function () {
                var index = imgNav.index(_this.find(opts.imgNavBox).children("." + opts.activeClass));
                if (index >= imgNav.length - 1) {
                    $(this).css({"cursor": "default"}).children().hide();
                } else {
                    $(this).css({"cursor": "pointer"}).children().show();
                }
            }, function () {
                $(this).css({"cursor": "default"}).children().hide();
            });

            prevBtn.on("click", function (e) {
                e.stopPropagation();
                var index = imgNav.index(_this.find(opts.imgNavBox).children("." + opts.activeClass));
                if (index > 0) {
                    index--;
                    imgNav.eq(index).toggleClass(opts.activeClass).siblings().removeClass(opts.activeClass);
                    src = imgNav.eq(index).attr('data-src');
                    setViewImg(src);
                }
                if (index <= 0) {
                    $(this).css({"cursor": "default"}).children().hide();
                }
            });

            nextBtn.on("click", function (e) {
                e.stopPropagation();
                var index = imgNav.index(_this.find(opts.imgNavBox).children("." + opts.activeClass));
                if (index < imgNav.length - 1) {
                    index++;
                    imgNav.eq(index).toggleClass(opts.activeClass).siblings().removeClass(opts.activeClass);
                    src = imgNav.eq(index).attr('data-src');
                    setViewImg(src);
                }
                if (index >= imgNav.length - 1) {
                    $(this).css({"cursor": "default"}).children().hide();
                }
            })

        })

    }

})(jQuery);
// 上传图片
$(function(){
    var delParent;
    var defaults = {
        fileType         : ["jpg","png","bmp","jpeg"],   // 上传文件的类型
        fileSize         : 1024 * 1024 * 10                  // 上传文件的大小 10M
    };
    /*点击图片的文本框*/
    $(".file").change(function(){
        var idFile = $(this).attr("id");
        var file = document.getElementById(idFile);
        var imgContainer = $(this).parents(".z_photo"); //存放图片的父亲元素
        var fileList = file.files; //获取的图片文件
        var input = $(this).parent();//文本框的父亲元素
        var imgArr = [];
        //遍历得到的图片文件
        var numUp = imgContainer.find(".up-section").length;
        var totalNum = numUp + fileList.length;  //总的数量
        if(fileList.length > 4 || totalNum > 4 ){
            alert("上传图片数目不可以超过4个，请重新选择");  //一次选择上传超过4个 或者是已经上传和这次上传的到的总数也不可以超过4个
        }
        else if(numUp < 4){
            fileList = validateUp(fileList);
            for(var i = 0;i<fileList.length;i++){
                var imgUrl = window.URL.createObjectURL(fileList[i]);
                imgArr.push(imgUrl);
                var $section = $("<section class='up-section fl loading'>");
                imgContainer.prepend($section);
                var $span = $("<span class='up-span'>");
                $span.appendTo($section);

                var $img0 = $("<img class='close-upimg'>").on("click",function(event){
                    event.preventDefault();
                    event.stopPropagation();
                    $(".works-mask").show();
                    delParent = $(this).parent();
                });
                $img0.attr("src","../../image/shop/a7.png").appendTo($section);
                var $img = $("<img class='up-img up-opcity'>");
                $img.attr("src",imgArr[i]);
                $img.appendTo($section);
                var $p = $("<p class='img-name-p'>");
                $p.html(fileList[i].name).appendTo($section);
                var $input = $("<input id='taglocation' name='taglocation' value='' type='hidden'>");
                $input.appendTo($section);
                var $input2 = $("<input id='pic' name='pics' value='' type='hidden'/>");
                $input2.appendTo($section);

            }
        }
        setTimeout(function(){
            $(".up-section").removeClass("loading");
            $(".up-img").removeClass("up-opcity");
        },450);
        numUp = imgContainer.find(".up-section").length;
        if(numUp >= 4){
            $(this).parent().hide();
        }
    });



    $(".z_photo").delegate(".close-upimg","click",function(){
        $(".works-mask").show();
        delParent = $(this).parent();
    });

    $(".wsdel-ok").click(function(){
        $(".works-mask").hide();
        var numUp = delParent.siblings().length;
        if(numUp < 5){
            delParent.parent().find(".z_file").show();
        }
        delParent.remove();
    });

    $(".wsdel-no").click(function(){
        $(".works-mask").hide();
    });

    function validateUp(files){
        var arrFiles = [];//替换的文件数组
        for(var i = 0, file; file = files[i]; i++){
            //获取文件上传的后缀名
            var newStr = file.name.split("").reverse().join("");
            if(newStr.split(".")[0] != null){
                var type = newStr.split(".")[0].split("").reverse().join("");
                console.log(type+"===type===");
                if(jQuery.inArray(type, defaults.fileType) > -1){
                    // 类型符合，可以上传
                    if (file.size >= defaults.fileSize) {
                        alert(file.size);
                        alert('您这个"'+ file.name +'"文件大小过大');
                    } else {
                        // 在这里需要判断当前所有文件中
                        arrFiles.push(file);
                    }
                }else{
                    alert('您这个"'+ file.name +'"上传类型不符合');
                }
            }else{
                alert('您这个"'+ file.name +'"没有类型, 无法识别');
            }
        }
        return arrFiles;
    }



})
//me
$(function () {
    $(".tm-m-photos").commentImg({
        activeClass: 'tm-current', //缩略图当前状态class,默认'current'
        nextButton: '.tm-m-photo-viewer-navright', //向后翻页按钮，默认'.next'
        prevButton: '.tm-m-photo-viewer-navleft', //向前翻页按钮，默认'.prev'
        imgNavBox: '.tm-m-photos-thumb', //缩略图容器，默认'.photos-thumb'
        imgViewBox: '.tm-m-photo-viewer' //浏览图容器，默认'.photo-viewer'
    });
})
// 分页
//------------------
function scrollTo(ele, speed) {
    if (!speed) speed = 300;
    if (!ele) {
        $("html,body").animate({scrollTop: 0}, speed);
    } else {
        if (ele.length > 0) $("html,body").animate({scrollTop: $(ele).offset().top}, speed);
    }
    return false;
}

function ToggleRadioButtons(groupName, current) {
    //在当前的btn-group里先清除所有“选取”图标，全部换成“取消”样式（“初始化”）
    $(groupName + " .glyphicon-check")
        .removeClass("glyphicon-check")
        .addClass("glyphicon-unchecked");
    $(groupName + " .active").css("opacity", 0.6);
    //alert("暂停啦");
    //更改当前用户选择的那个btn图标
    current.find(":first-child")
        .removeClass("glyphicon-unchecked")
        .addClass("glyphicon-check");
    current.css("opacity", 1);
}

function goToReview() {
    $("#rev")
        .removeClass("active")
        .addClass("active");
    $("#para")
        .removeClass("active");
    $("#tags")
        .removeClass("active");
    scrollTo('#section', 300);
}

var lockq = false, lockp = false, lockv = false;

function OnStar(no, num) {  //submit
    switch (no) {
        case 0:
            $("#quality").val(num);
            lockq = true;
            break;
        case 1:
            $("#price").val(num);
            lockp = true;
            break;
        case 2:
            $("#value").val(num);
            lockv = true;
            break;
        default:
    }
}

function start(no, num) {  //move
    switch (no) {
        case 0:
            if (lockq) return;
            $("#startq").attr("class", "starB s" + num.toString());
            $("#scoreq").text((num / 2).toFixed(1));
            break;
        case 1:
            if (lockp) return;
            $("#startp").attr("class", "starB s" + num.toString());
            $("#scorep").text((num / 2).toFixed(1));
            break;
        case 2:
            if (lockv) return;
            $("#startv").attr("class", "starB s" + num.toString());
            $("#scorev").text((num / 2).toFixed(1));
            break;
        default:
    }
}

function kaifach(no, num) {  //out
    switch (no) {
        case 0:
            if (lockq) return;
            $("#quality").val(num);
            break;
        case 1:
            if (lockp) return;
            $("#price").val(num);
            break;
        case 2:
            if (lockv) return;
            $("#value").val(num);
            break;
        default:
    }
}

function resetScore() {
    lockq = false;
    lockp = false;
    lockv = false;
}
function changeFollow(id, islogin){
    if(islogin==false){
        login();
        return;
    }
    $.ajax({
        url:'/fun/add2Follow',
        type:'GET',
        data:'goods_id='+id,
        dataType:'text',
        async:false,
        success:function(result){
            alert(result);
            window.location.reload();  //刷新
        }
    });
}
function vget(obj){
    return obj;
}

function Add2Cart() {
    $.ajax({
        //几个参数需要注意一下
        type: "get",//方法类型
        dataType: "text",//预期服务器返回的数据类型
        url: "/fun/add2Cart" ,//url
        data: $('#detailForm').serialize(),
        success: function (result) {
            $("#cartDialog").modal();
        },
        error : function() {
            alert("异常！");
        }
    });
}
function login(){
    $("#login").modal();
}