$(document).ready(function () {
    $("#main-menu li:eq(1)").addClass("active");
    $("#main-menu li:eq(1) ul li:eq(0)").addClass("active-menu");
    var i;
    var year=new Date().getFullYear();
    for(i=year-100;i<=year;i++){
        $("#birthdayYear").append("<option value=\""+i+"\" >"+i+"</option>");//append函数附加html到元素结尾处
    }
    for(i=1;i<=12;i++){
        $("#birthdayMonth").append("<option value=\""+i+"\" >"+i+"</option>");//append函数附加html到元素结尾处
    }
    var birthday = new Date($("#birthday").val());
    if(birthday!=null){
        $("#birthdayYear option").eq(birthday.getFullYear()-year+101).attr("selected",true);
        $("#birthdayMonth option").eq(birthday.getMonth()+1).attr("selected",true);
        getDays();
        $("#birthdayDay option").eq(birthday.getDate()).attr("selected",true);
    }
    $("#birthday").val(new Date(birthday));
});

$("#birthdayYear,#birthdayMonth").change(function () {
    getDays();
    getBirthday();
});

$("#birthdayDay").change(function () {
    getBirthday();
});

$("#profile").on('change', function () {
    $("#upload-profile").submit();
});

function getDaysInMonth(month,year){//年月对应的日数算法
    var days;
    if (month==1 || month==3 || month==5 || month==7 || month==8 || month==10 || month==12) {
        days=31;//固定31
    }else if (month==4 || month==6 || month==9 || month==11){
        days=30;//固定30
    }else{
        if ((year%4 == 0 && year%100 != 0) || (year%400 == 0)) {     //排除百年，每四年一闰；每四百年一闰；
            days=29; //闰年29
        }else {
            days=28; //平年28
        }
    }
    return days;//返回该年月的日数
}

function getDays(){
    var birthdayYear = $("#birthdayYear option:selected").val();
    var birthdayMonth = $("#birthdayMonth option:selected").val();
    var birthDay = $("#birthdayDay");
    if(birthdayYear=="" || birthdayMonth==""){
        birthDay.empty();
        birthDay.append("<option value='' selected>请选择</option>");
        return;
    }
    var days =  getDaysInMonth(birthdayMonth,birthdayYear);
    birthDay.empty();
    birthDay.append("<option value='' selected>请选择</option>");
    for(var i=1;i<=days;i++){
        birthDay.append("<option value=\""+i+"\">"+i+"</option>");
    }
}

function getBirthday() {
    var birthdayYear = $("#birthdayYear option:selected").val();
    var birthdayMonth = $("#birthdayMonth option:selected").val();
    var birthdayDay = $("#birthdayDay option:selected").val();
    var birthday = $("#birthday");
    if(birthdayYear!="" && birthdayMonth!="" && birthdayDay!=""){
        birthday.val(new Date(birthdayYear+"-"+birthdayMonth+"-"+birthdayDay));
        // alert(birthday);
    }
}