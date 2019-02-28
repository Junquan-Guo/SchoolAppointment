$(document).ready(function ($) {

    /* ---------------------------------------------------------------------- */
    /*	Header 滚动显示隐藏顶部导航
	/* ---------------------------------------------------------------------- */

    $('#container').delay(400).addClass('active');
    (function () {

        var docElem = document.documentElement,
            didScroll = false,
            changeHeaderOn = 50;
        document.querySelector('header');
        function init() {
            window.addEventListener('scroll', function () {
                if (!didScroll) {
                    didScroll = true;
                    setTimeout(scrollPage, 100);
                }
            }, false);
        }

        function scrollPage() {
            var sy = scrollY();
            if (sy >= changeHeaderOn) {
                $('header').addClass('active');
            }
            else {
                $('header').removeClass('active');
            }
            didScroll = false;
        }

        function scrollY() {
            return window.pageYOffset || docElem.scrollTop;
        }

        init();

    })();

    /*-------------------------------------------------*/
    /* =  Search 弹出搜索框
	/*-------------------------------------------------*/

    var searchToggle = $('.open-search'),
		inputAnime = $(".form-search"),
		body = $('body');

    searchToggle.on('click', function (event) {
        event.preventDefault();//防止链接打开 URL。

        if (!inputAnime.hasClass('active')) {     //active控制透明度
            inputAnime.addClass('active');        //添加
        } else {
            inputAnime.removeClass('active');    //移除	
        }
    });

    body.on('click', function () {                //点击body移除
        inputAnime.removeClass('active');
    });

    var elemBinds = $('.open-search, .form-search');
    elemBinds.bind('click', function (e) {
        e.stopPropagation();//停止派送发事件
    });

    /*-------------------------------------------------*/
    /* =  登录注册弹出框
	/*-------------------------------------------------*/

    $("#ImgUser,#ContentPlaceHolder1_ImgUser3,#ContentPlaceHolder1_ImgUser4").click(function () {
        if ($("#Username").text() == "未登录") {
            $(".pop-up").show(600, function () {
                var top = 78
                $(".login_box").css("margin-top", top);
            });
        }
        else {
            $(".pop-up2").show(600, function () {
                $(".user_xx").css("display", "block");
            });
        }
    });
    $(".u-times a").click(function () {
        $(".pop-up,.pop-up2").hide(600);
    });

    $(".fa-eye").click(function () {
        $(".LgUserpass").attr("type", "Text")
        $(".fa-eye").hide();
        $(".fa-eye-slash").show();
    });
    $(".fa-eye-slash").click(function () {
        $(".LgUserpass").attr("type", "Password")
        $(".fa-eye-slash").hide();
        $(".fa-eye").show();
    });

    /*-------------------------------------------------*/
    /* =  登录、注册切换
	/*-------------------------------------------------*/

    $(document).on('click', '.toolbar a[data-target]', function (e) {
        e.preventDefault();                      //防止链接打开 URL
        var target = $(this).data('target');
        $('.login_box.visible').removeClass('visible');//hide others
        $(target).addClass('visible');//show target
    });

    /*-------------------------------------------------*/
    /* =  Login登录验证
	/*-------------------------------------------------*/

    $("#login").click(function () {
        var username = $("#LgUsername").val()
        var password = $("#LgUserpass").val()
        var cap = $("#TextBox1").val()
        $.ajax({
            url: "./UserServices.aspx",
            type: "get",
            data: {
                type: "login",
                username: username,
                password: password,
                cap: cap
            },
            success: function (data) {
                if (username == "") {
                    $('.presentation .tisi').html('请输入用户名!');
                    $("#successMsg .presentation").show(600).delay(300).fadeOut(1200);
                }
                else if (password == "") {
                    $('.presentation .tisi').html('请输入密码!');
                    $("#successMsg .presentation").show(600).delay(300).fadeOut(1200);

                }
                else if (cap == "") {
                    $('.presentation .tisi').html('请输入验证码!');
                    $("#successMsg .presentation").show(600).delay(300).fadeOut(1200);
                }
                else if (data == "验证码错误") {
                    $('.warning .tisi').html('验证码错误!');
                    $("#successMsg .warning").show(600).delay(300).fadeOut(1200);
                }
                else if (data != "") {
                    var arr = data.split(",")
                    $("#ImgUser").attr("src", arr[1].replace('~', '.'))
                    $("#Userid").text("")
                    $("#Username").text(arr[0])
                    $("#ImgUser2").attr("src", arr[1].replace('~', '.'))
                    $(".u-times a").trigger("click")
                    $('.succeed .tisi').html('登录成功!');
                    $("#successMsg .succeed").show(600).delay(300).fadeOut(1200);
                }
                else {
                    $("#YzUrl,#YzUrl2").attr("src", "./GenerateCheckCode.aspx?" + new Date())
                    $('.warning .tisi').html('用户名不存在或密码错误!');
                    $("#successMsg .warning").show(600).delay(300).fadeOut(1200);
                }
            }
        })
    })

    /*-------------------------------------------------*/
    /* =  Register注册验证
	/*-------------------------------------------------*/

    $("#reg").click(function () {
        var username = $("#txtUsername").val()
        var password = $("#txtPassword").val()
        var repwd = $("#txtrepassword").val()
        var cap = $("#TextBox3").val()
        var phone = $("#txtUserPhone").val()
        $.ajax({
            url: "./UserServices.aspx",
            type: "get",
            data: {
                type: "reg",
                username: username,
                phone: phone,
                password: password,
                repwd: repwd,
                cap: cap
            },
            success: function (data) {
                alert(data)
                if (username == "") {
                    $('.presentation .tisi').html('请输入用户名!');
                    $("#successMsg .presentation").show(600).delay(300).fadeOut(1200);
                }
                else if (phone == "") {
                    $('.presentation .tisi').html('请输入手机号码!');
                    $("#successMsg .presentation").show(600).delay(300).fadeOut(1200);
                }
                else if (password == "") {
                    $('.presentation .tisi').html('请输入密码!');
                    $("#successMsg .presentation").show(600).delay(300).fadeOut(1200);

                }
                else if (repwd == "") {
                    $('.presentation .tisi').html('请输入确认密码!');
                    $("#successMsg .presentation").show(600).delay(300).fadeOut(1200);

                }
                else if (repwd == password) {
                    $('.presentation .tisi').html('密码与确认密码不一致!');
                    $("#successMsg .presentation").show(600).delay(300).fadeOut(1200);
                }
                else if (cap == "") {
                    $('.presentation .tisi').html('请输入验证码!');
                    $("#successMsg .presentation").show(600).delay(300).fadeOut(1200);
                }
                else if (data == "验证码错误") {
                    $('.warning .tisi').html('验证码错误!');
                    $("#successMsg .warning").show(600).delay(300).fadeOut(1200);
                }
                else if (data == "注册成功") {
                    $(".u-times a").trigger("click")
                    $('.succeed .tisi').html('注册成功!');
                    $("#successMsg .succeed").show(600).delay(300).fadeOut(1200);
                } else {
                    $("#YzUrl,#YzUrl2").attr("src", "./GenerateCheckCode.aspx?" + new Date())
                    $('.warning .tisi').html('注册失败!');
                    $("#successMsg .warning").show(600).delay(300).fadeOut(1200);
                }
            }
        })
    })

    /*-------------------------------------------------*/
    /* =  验证码刷新
	/*-------------------------------------------------*/

    $("#YzUrl,#shuaxin,#YzUrl2,#shuaxin2").click(function () {
        $("#YzUrl,#YzUrl2").attr("src", "./GenerateCheckCode.aspx?" + new Date())
    })

    /*-------------------------------------------------*/
    /* =  tooltip提示信息
	/*-------------------------------------------------*/

    $(function () { $("[data-toggle='tooltip']").tooltip(); });

    /*-------------------------------------------------*/
    /* =  右侧悬浮
	/*-------------------------------------------------*/

    //目录
    $('.a-list').click(function (event) {
        $('#cd-main-nav').toggle(500, function () { });
    });
    //搜索
    $(".search_form ul li").mouseover(function () {
        var index = $(this).index();
        if (index == 0) {
            $(this).find("a").addClass("style1");
            $(".border1 li").eq(1).find("a").removeClass("style2");
            $(".border1 li").eq(2).find("a").removeClass("style3");
            $('#searchPlaceholder').prop('placeholder', '请输入文章名称...');
        }
        if (index == 1) {
            $(this).find("a").addClass("style2");
            $(".border1 li").eq(0).find("a").removeClass("style1");
            $(".border1 li").eq(2).find("a").removeClass("style3");
            $('#searchPlaceholder').prop('placeholder', '请输入视频名称...');
        }
        if (index == 2) {
            $(this).find("a").addClass("style3");
            $(".border1 li").eq(0).find("a").removeClass("style1");
            $(".border1 li").eq(1).find("a").removeClass("style2");
            $('#searchPlaceholder').prop('placeholder', '请输入人物名称...');
        }
    });
    //返回
    $(document).on("mouseleave", ".suspension, .suspension .a-top", function () {
        $(".suspension").find(".d").hide();
    });
    $(document).on("mouseenter", ".suspension .a-top", function () {
        $(".suspension").find(".d").hide();
    });
    $(document).on("click", ".suspension .a-top", function () {
        $("html,body").animate({ scrollTop: 0 });
    });
    $(window).scroll(function () {
        var st = $(document).scrollTop();
        var $top = $(".suspension .a-top");
        if (st > 400) {
            $top.css({ display: 'block' });
        } else {
            if ($top.is(":visible")) {
                $top.hide();
            }
        }
    });

    /*-------------------------------------------------*/
    /* =  左侧滚动监听
	/*-------------------------------------------------*/

    /*-------------------------------------------------*/
    /* =  反馈
	/*-------------------------------------------------*/

    $("#myModal").click(function () {
        $(".qutton1").toggle(500);
        $(".qutton_dialog2").hide();
        $(".qutton_dialog").show();
    });
    $("#myModal2").click(function () {
        $(".qutton1").toggle(500);
        $(".qutton_dialog").hide();
        $(".qutton_dialog2").show();
    });
    $(".u-times a").click(function () {
        $(".qutton1").hide(500);
    });

});
