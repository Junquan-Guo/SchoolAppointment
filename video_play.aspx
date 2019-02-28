<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="video_play.aspx.cs" Inherits="video_play" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
    <style>
        .navbar-nav > li:nth-of-type(3)> a.active{
            color: #ffffff !important;
            background-color: #E60012;
        }
        video_bg{
            width: 100%;
            height: 100%;
            background: #F4F4F4;
        }
        a:hover {
            text-decoration: none;
        }

        #willesPlay {
            margin: 50px auto 80px;
            box-shadow: 0px 0px 15px #333333;
            position: relative;
        }

        /*播放器头部*/
        #willesPlay .playHeader {
            width: 100%;
            height: 48px;
            background: url(images/playheader.jpg) repeat-x;
            border-radius: 3px 3px 0px 0px;
        }

        #willesPlay .playHeader .videoName {
            font-size: 16px;
            width: 400px;
            height: 48px;
            line-height: 48px;
            text-align: center;
            margin: 0 auto;
            color: #7a7f82;
        }
        /*功能区*/
        #willesPlay .playContent {
            position: relative;
            height: auto;
            overflow: hidden;
            background: #000;
            padding: 0 10%;
            cursor: pointer;
        }

        #willesPlay .playContent .turnoff {
            position: absolute;
            z-index: 10;
            right: -40px;
            top: 45%;
            margin-top: -90px;
        }

        #willesPlay .playContent .turnoff li a {
            display: block;
            width: 40px;
            height: 40px;
            line-height: 40px;
            margin-bottom: 20px;
            text-align: center;
            font-size: 20px;
            color: #fff;
            background: rgba(0,0,0,.5);
        }

        #willesPlay .playContent .turnoff li a:hover {
            color: #666;
        }

        #willesPlay .playContent .turnoff2 {
            position: absolute;
            z-index: 10;
            left: -40px;
            top: 45%;
            margin-top: -90px;
        }

        #willesPlay .playContent .turnoff2 li a {
            display: block;
            width: 40px;
            height: 40px;
            line-height: 40px;
            margin-bottom: 20px;
            text-align: center;
            font-size: 20px;
            color: #fff;
            background: rgba(0,0,0,.5);
        }

        #willesPlay .playContent .turnoff2 li a:hover {
            color: #666;
        }

        #willesPlay .playContent .playTip {
            position: absolute;
            width: 110px;
            height: 110px;
            text-align: center;
            line-height: 104px;
            top: 50%;
            left: 50%;
            margin-left: -55px;
            margin-top: -55px;
            background: #02a388;
            opacity: 0.8;
            font-size: 60px;
            border: 3px solid #FFFFFF;
            border-radius: 50%;
            color: #fff;
            cursor: pointer;
        }
        /*进度面板*/
        #willesPlay .playControll {
            position: absolute;
            z-index: 2147483650;
            width: 100%;
            height: 48px;
            bottom: -48px;
            background: url(images/playheader.jpg) repeat-x;
            border-radius: 0px 0px 3px 3px;
            -moz-user-select: none;
            -webkit-user-select: none;
            user-select: none;
        }

        #willesPlay .fullControll {
            background: rgba(0,0,0,.5);
        }

        #willesPlay .fullControll .timebar span {
            color: #FFFFFF;
        }

        #willesPlay .playControll .playPause {
            float: left;
            width: 20px;
            height: 25px;
            background: url(images/img-sp.png) no-repeat -148px -111px ;
            margin: 11px 0px 0px 12px;
            cursor: pointer;
        }

        #willesPlay .playControll .playIcon {
            background-position: -148px -143px;
        }
        /*进度条*/
        #willesPlay .playControll .timebar {
            float: left;
            width: calc(100% - 145px);
            line-height: 48px;
            overflow: hidden;
            margin: 0 auto;
            margin: 0px 0px 0px 20px;
        }

        #willesPlay .playControll .timebar .progress {
            float: left;
            width: 80%;
            margin: 19px 5px;
            height: 10px;
            cursor: pointer;
        }

        #willesPlay .playControll .timebar span {
            float: left;
            width: 8%;
            text-align: center;
        }

        #willesPlay .otherControl {
            float: right;
            position: relative;
        }

        #willesPlay .otherControl span {
            display: inline-block;
            width: 30px;
            height: 30px;
            text-align: center;
            line-height: 30px;
            vertical-align: middle;
            font-size: 20px;
            margin: 9px 7px;
            cursor: pointer;
        }

        #willesPlay .otherControl span:nth-child(1) {
            font-size: 28px;
            color: #02a388;
        }
        #willesPlay .otherControl span:nth-child(2) {
            color: #919597;
        }
        /*音量*/
        #willesPlay .otherControl .volumeBar {
            display: none;
            position: absolute;
            top: -110px;
            left: 4px;
            width: 26px;
            height: 100px;
            background: #f1f2f2;
            border-radius: 4px;
            cursor: pointer;
        }

        #willesPlay .otherControl .volumeBar:after {
            content: "";
            display: block;
            position: absolute;
            bottom: -7px;
            left: 5px;
            width: 0;
            height: 0;
            border-left: 8px solid transparent;
            border-right: 8px solid transparent;
            border-top: 8px solid #f1f2f2;
        }

        #willesPlay .otherControl .volumeBar .volumewrap {
            background: #a2a7aa;
            width: 8px;
            height: 80px;
            position: absolute;
            bottom: 10px;
            left: 9px;
            border-radius: 4px;
        }

        #willesPlay .otherControl .volumeBar .progress {
            background: none;
        }

        #willesPlay .otherControl .volumeBar .progress-bar {
            position: absolute;
            bottom: 0px;
            left: 0px;
            border-radius: 4px;
        }

        video::-webkit-media-controls-enclosure {
            /*禁用播放器控制栏的样式*/
            display: none !important;
        }

        :-webkit-full-screen {
        }
    </style>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Fitness312ConnectionString %>" SelectCommand="SELECT * FROM [video] WHERE ([videoid] = @videoid)">
        <SelectParameters>
            <asp:QueryStringParameter Name="videoid" QueryStringField="videoid" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div class="breadcrumb-wrapper">
        <div class="container">
            <div class="row">
                <div class="col-md-3 col-sm-4 bcid-cat">
                    <asp:ListView ID="ListView1" runat="server" DataKeyField="videoid" DataSourceID="SqlDataSource1">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%#Eval("videoname") %>' />
                        </ItemTemplate>
                    </asp:ListView>
                </div>
                <div class="col-md-9 col-sm-8 location">
                    <i class="fa fa-map-marker"></i>&nbsp;<span>当前位置：
                        <asp:SiteMapPath ID="SiteMapPath1" runat="server" Font-Names="Verdana" PathSeparator="/ ">
                            <CurrentNodeStyle ForeColor="#777777" Font-Size="13px" />
                            <NodeStyle Font-Bold="True" ForeColor="#777777" Font-Size="13px" />
                            <PathSeparatorStyle Font-Bold="True" Font-Size="8px" ForeColor="#777777" CssClass="separator" />
                            <RootNodeStyle Font-Bold="True" ForeColor="#0daed3" Font-Size="13px" />
                        </asp:SiteMapPath>
                    </span>
                </div>
            </div>
        </div>
    </div>
    <div class="video_bg">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <asp:DataList ID="DataList1" runat="server" DataKeyField="videoid" DataSourceID="SqlDataSource1">
                        <ItemTemplate>
                            <div id="willesPlay">
                                <div class="playHeader">
                                    <div class="videoName">
                                        <asp:Label ID="Label1" runat="server" Text='<%#Eval("videoname") %>'></asp:Label>
                                    </div>
                                </div>
                                <div class="playContent">
                                    <div class="turnoff2">
                                        <ul>
                                            <li><a href="javascript:;" data-toggle="tooltip" data-placement="right" title="收藏" class="glyphicon glyphicon-heart-empty"></a></li>
                                            <li><a href="javascript:;" data-toggle="tooltip" data-placement="right" title="点赞" class="glyphicon glyphicon-thumbs-up"></a></li>
                                            <li><a href="javascript:;" data-toggle="tooltip" data-placement="right" title="关灯" class="btnLight on glyphicon glyphicon-sunglasses"></a></li>
                                            <li><a href="javascript:;" data-toggle="tooltip" data-placement="right" title="分享" class="glyphicon glyphicon-share"></a></li>
                                        </ul>
                                    </div>
                                    <div class="turnoff">
                                        <ul>
                                            <li><a href="javascript:;" data-toggle="tooltip" data-placement="left" title="旋转" class="glyphicon glyphicon-refresh"></a></li>
                                            <li><a href="javascript:;" data-toggle="tooltip" data-placement="left" title="缩放" class="glyphicon glyphicon-zoom-in"></a></li>
                                            <li><a href="javascript:;" data-toggle="tooltip" data-placement="left" title="倍数" class="glyphicon glyphicon-flash"></a></li>
                                            <li><a href="javascript:;" data-toggle="tooltip" data-placement="left" title="亮度" class="glyphicon glyphicon-asterisk"></a></li>
                                        </ul>
                                    </div>
                                    <video width="100%" height="auot" id="playVideo">
                                        <source src='<%#Eval("videocontent") %>' type="video/mp4" />
                                        <source src='<%#Eval("videocontent") %>' type="video/webm" />
                                    </video>
                                    <div class="playTip glyphicon glyphicon-play"></div>
                                </div>
                                <div class="playControll">
                                    <div class="playPause playIcon"></div>
                                    <div class="timebar">
                                        <span class="currentTime">0:00:00</span>
                                        <div class="progress">
                                            <div class="progress-bar progress-bar-info progress-bar-striped" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width: 0%"></div>
                                        </div>
                                        <span class="duration">0:00:00</span>
                                    </div>
                                    <div class="otherControl">
                                        <span class="volume glyphicon glyphicon-volume-down" data-toggle="tooltip" data-placement="left" title="声音"></span>
                                        <span class="fullScreen glyphicon glyphicon-fullscreen" data-toggle="tooltip" data-placement="left" title="全屏"></span>
                                        <div class="volumeBar">
                                            <div class="volumewrap">
                                                <div class="progress">
                                                    <div class="progress-bar progress-bar-info" role="progressbar" aria-valuemin="0" aria-valuemax="100" style="width: 8px; height: 40%;"></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(function () {
            var playVideo = $('video');
            var playPause = $('.playPause'); //播放和暂停
            var currentTime = $('.timebar .currentTime'); //当前时间
            var duration = $('.timebar .duration'); //总时间
            var progress = $('.timebar .progress-bar'); //进度条
            var volumebar = $('.volumeBar .volumewrap').find('.progress-bar');
            playVideo[0].volume = 0.4; //初始化音量
            playPause.on('click', function () {
                playControl();
            });
            $('.playContent').on('click', function () {
                playControl();
            }).hover(function () {//鼠标进入
                $('.turnoff').stop().animate({//动画
                    'right': 0
                }, 500);
                $('.turnoff2').stop().animate({
                    'left': 0
                }, 500);
            }, function () {//鼠标离开
                $('.turnoff').stop().animate({
                    'right': -40
                }, 500);
                $('.turnoff2').stop().animate({
                    'left': -40
                }, 500);
            });
            $(document).click(function () {
                $('.volumeBar').hide();
            });
            playVideo.on('loadedmetadata', function () {
                duration.text(formatSeconds(playVideo[0].duration));
            });

            playVideo.on('timeupdate', function () {
                currentTime.text(formatSeconds(playVideo[0].currentTime));
                progress.css('width', 100 * playVideo[0].currentTime / playVideo[0].duration + '%');
            });
            playVideo.on('ended', function () {
                $('.playTip').removeClass('glyphicon-pause').addClass('glyphicon-play').fadeIn();
                playPause.toggleClass('playIcon');
            });

            $(window).keyup(function (event) {
                event = event || window.event;
                if (event.keyCode == 32) playControl();
                if (event.keyCode == 27) {
                    $('.fullScreen').removeClass('cancleScreen');
                    $('#willesPlay .playControll').css({
                        'bottom': -48
                    }).removeClass('fullControll');
                };
                event.preventDefault();
            });


            //全屏
            $('.fullScreen').on('click', function () {
                if ($(this).hasClass('cancleScreen')) {
                    if (document.exitFullscreen) {
                        document.exitFullscreen();
                    } else if (document.mozExitFullScreen) {
                        document.mozExitFullScreen();
                    } else if (document.webkitExitFullscreen) {
                        document.webkitExitFullscreen();
                    }
                    $(this).removeClass('cancleScreen');
                    $('#willesPlay .playControll').css({
                        'bottom': -48
                    }).removeClass('fullControll');
                } else {
                    if (playVideo[0].requestFullscreen) {
                        playVideo[0].requestFullscreen();
                    } else if (playVideo[0].mozRequestFullScreen) {
                        playVideo[0].mozRequestFullScreen();
                    } else if (playVideo[0].webkitRequestFullscreen) {
                        playVideo[0].webkitRequestFullscreen();
                    } else if (playVideo[0].msRequestFullscreen) {
                        playVideo[0].msRequestFullscreen();
                    }
                    $(this).addClass('cancleScreen');
                    $('#willesPlay .playControll').css({
                        'left': 0,
                        'bottom': 0
                    }).addClass('fullControll');
                }
                return false;
            });

            //音量
            $('.volume').on('click', function (e) {
                e = e || window.event;
                $('.volumeBar').toggle();
                e.stopPropagation();
            });
            $('.volumeBar').on('click mousewheel DOMMouseScroll', function (e) {
                e = e || window.event;
                volumeControl(e);
                e.stopPropagation();
                return false;
            });
            $('.timebar .progress').mousedown(function (e) {
                e = e || window.event;
                updatebar(e.pageX);
            });
            //$('.playContent').on('mousewheel DOMMouseScroll',function(e){
            //	volumeControl(e);
            //});
            var updatebar = function (x) {
                var maxduration = playVideo[0].duration; //Video 
                var positions = x - progress.offset().left; //Click pos
                var percentage = 100 * positions / $('.timebar .progress').width();
                //Check within range
                if (percentage > 100) {
                    percentage = 100;
                }
                if (percentage < 0) {
                    percentage = 0;
                }

                //Update progress bar and video currenttime
                progress.css('width', percentage + '%');
                playVideo[0].currentTime = maxduration * percentage / 100;
            };
            //音量控制
            function volumeControl(e) {
                e = e || window.event;
                var eventype = e.type;
                var delta = (e.originalEvent.wheelDelta && (e.originalEvent.wheelDelta > 0 ? 1 : -1)) || (e.originalEvent.detail && (e.originalEvent.detail > 0 ? -1 : 1));
                var positions = 0;
                var percentage = 0;
                if (eventype == "click") {
                    positions = volumebar.offset().top - e.pageY;
                    percentage = 100 * (positions + volumebar.height()) / $('.volumeBar .volumewrap').height();
                } else if (eventype == "mousewheel" || eventype == "DOMMouseScroll") {
                    percentage = 100 * (volumebar.height() + delta) / $('.volumeBar .volumewrap').height();
                }
                if (percentage < 0) {
                    percentage = 0;
                    $('.otherControl .volume').attr('class', 'volume glyphicon glyphicon-volume-off');
                }
                if (percentage > 50) {
                    $('.otherControl .volume').attr('class', 'volume glyphicon glyphicon-volume-up');
                }
                if (percentage > 0 && percentage <= 50) {
                    $('.otherControl .volume').attr('class', 'volume glyphicon glyphicon-volume-down');
                }
                if (percentage >= 100) {
                    percentage = 100;
                }
                $('.volumewrap .progress-bar').css('height', percentage + '%');
                playVideo[0].volume = percentage / 100;
                e.stopPropagation();
                e.preventDefault();
            }

            function playControl() {
                playPause.toggleClass('playIcon');
                if (playVideo[0].paused) {
                    playVideo[0].play();
                    $('.playTip').removeClass('glyphicon-play').addClass('glyphicon-pause').fadeOut();
                } else {
                    playVideo[0].pause();
                    $('.playTip').removeClass('glyphicon-pause').addClass('glyphicon-play').fadeIn();
                }
            }
            //关灯
            $('.btnLight').click(function (e) {
                e = e || window.event;
                if ($(this).hasClass('on')) {
                    $(this).removeClass('on');
                    $('.video_bg').append('<div class="overlay"></div>');
                    $('.overlay').css({
                        'position': 'absolute',
                        'width': 100 + '%',
                        'height': $(document).height(),
                        'background': '#000',
                        'opacity': 1,
                        'top': 0,
                        'left': 0,
                        'z-index': 999
                    });
                    $('.playContent').css({
                        'z-index': 1000
                    });
                    $('.playControll').css({
                        'bottom': -48,
                        'z-index': 1000
                    });

                    $('.playContent').hover(function () {
                        $('.playControll').stop().animate({
                            'height': 48,
                        }, 500);
                    }, function () {
                        setTimeout(function () {
                            $('.playControll').stop().animate({
                                'height': 0,
                            }, 500);
                        }, 2000)
                    });
                } else {
                    $(this).addClass('on');
                    $('.overlay').remove();
                    $('.playControll').css({
                        'bottom': 0,
                    });
                }
                e.stopPropagation();
                e.preventDefault();
            });
        });

        //秒转时间
        function formatSeconds(value) {
            value = parseInt(value);
            var time;
            if (value > -1) {
                hour = Math.floor(value / 3600);
                min = Math.floor(value / 60) % 60;
                sec = value % 60;
                day = parseInt(hour / 24);
                if (day > 0) {
                    hour = hour - 24 * day;
                    time = day + "day " + hour + ":";
                } else time = hour + ":";
                if (min < 10) {
                    time += "0";
                }
                time += min + ":";
                if (sec < 10) {
                    time += "0";
                }
                time += sec;
            }
            return time;
        }
    </script>
</asp:Content>

