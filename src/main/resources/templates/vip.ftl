<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=yes"/>
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <title>视频解析器</title>
    <link href="bootstrap.min.css" rel="stylesheet"/>
    <link href="youku.css?_v_=1.0.2" rel="stylesheet"/>
    <link href="iqiyi.css?_v_=1.0.2" rel="stylesheet"/>
    <link href="qq.css?_v_=1.0.2" rel="stylesheet"/>
    <script src="jquery-3.3.1.min.js"></script>
</head>

<body>
<div class="container">
    <div class="row clearfix" style="margin-top: 30px;">
        <div class="col-md-12 col-xs-12">
            <div class="col-md-10  col-xs-10" style="padding-left: 0">
                <input type="text" class="form-control" id="v-url" placeholder="视频地址"/>
            </div>
            <div class="col-md-2 col-xs-2" style="padding-left: 0">
                <input type="button" class="btn btn-primary" onclick="play()" value="播 放">
            </div>
        </div>
        <div class="col-md-12 col-xs-12" style="margin-top: 10px;">
            <select class="form-control" id="chanel">
                <option value="http://api.baiyug.cn/vip/index.php?url=">优酷,爱奇艺1</option>
                <option value="http://player.jidiaose.com/supapi/iframe.php?v=">优酷,爱奇艺2</option>
                <option value="http://api.pucms.com/index.php?url=">优酷,爱奇艺3</option>
                <option value="http://www.a305.org/flv.php?url=">优酷,爱奇艺6</option>
                <option value="http://www.wmxz.wang/video.php?url=">优酷,爱奇艺7</option>
                <option value="http://jx.ck921.com/?url=">优酷,爱奇艺8</option>
                <option value="http://s1y2.com/?url=">优酷,爱奇艺9</option>
                <option value="http://www.ou522.cn/t2/1.php?url=">优酷,爱奇艺10</option>
                <option value="http://jx.xuanpianwang.com/parse?url=">优酷,爱奇艺11</option>
                <option value="http://014670.cn/jx/qy.php?type=qiyi&url=">爱奇艺</option>
                <option value="http://014670.cn/jx/yk.php?type=youku&url=">优酷</option>
                <option value="http://vip.72du.com/api/?url=">优酷,爱奇艺,乐视,搜狐,芒果,PPTV,华数</option>
                <option value="http://000o.cc/jx/ty.php?url=">优酷,乐视,搜狐,芒果,华数</option>
                <option value="http://yyygwz.com/index.php?url=">乐视,搜狐,芒果,华数</option>
                <option value="http://www.wmxz.wang/video.php?url=">优酷,腾讯,爱奇艺,乐视,搜狐,芒果,华数</option>
                <option value="http://www.vipjiexi.com/yun.php?url=">优酷,乐视,搜狐,芒果,华数</option>
                <option value="http://2gty.com/apiurl/yun.php?url=">腾讯,乐视,搜狐,芒果,PPTV,华数</option>
                <option value="http://www.chepeijian.cn/jiexi/vip.php?url=">优酷,爱奇艺,乐视,搜狐,芒果,PPTV,华数</option>
                <option value="http://jx.71ki.com/index.php?url=">优酷、乐视、搜狐、爱奇艺</option>
                <option value="http://vip.jlsprh.com/index.php?url=">⑨号vip引擎系统【芒果TV】</option>
                <option value="http://www.82190555.com/video.php?url=">⑧号vip引擎系统【优酷Youku】</option>
                <option value="http://www.dgua.xyz/webcloud/?url=">⑦号vip引擎系统【爱奇艺稳定】</option>
                <option value="http://api.91exp.com/svip/?url=">④号vip引擎系统【搜狐SOhu】</option>
                <option value="http://api.662820.com/xnflv/index.php?url=">③号vip引擎系统【PPTV解析】</option>
                <option value="http://v.72du.com/api/?url=">②号通用vip引擎系统【稳定通用】</option>
                <option value="http://www.vipjiexi.com/tong.php?url=">腾讯,爱奇艺</option>
                <option value="http://65yw.2m.vc/chaojikan.php?url=">芒果TV,搜狐接口</option>
                <option value="http://v.rpsofts.com/v.php?url=">优酷超清接口</option>
            </select>
        </div>
        <div class="col-md-12 col-xs-12" style="margin-top: 10px;">
            <iframe src="" id="video" style="width: 100%;height: 300px;" class="form-control"></iframe>
        </div>
        <div class="col-md-12 col-xs-12" style="margin-top: 30px;">
            <div class="col-md-10  col-xs-10" style="padding-left: 0">
                <input type="text" class="form-control" id="search" placeholder="全站搜索"/>
            </div>
            <div class="col-md-2 col-xs-2" style="padding-left: 0">
                <input type="button" class="btn btn-primary" onclick="search()" value="搜 索">
            </div>
        </div>
        <div class="col-md-12 col-xs-12" style="margin-top: 5px;">
            <div class="radio">
                <label><input type="radio" name="type" value="youku" checked>优酷</label>
                <label><input type="radio" name="type" value="iqiyi">爱奇艺</label>
                <label><input type="radio" name="type" value="qq">腾讯</label>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <div class="row clearfix" style="margin-top: 30px;">
        <div class="col-md-12 col-xs-12">
            <div class="vipContent"></div>
        </div>
    </div>
</div>
<script>
    function play() {
        var url = $("#v-url").val();
        if (!url) {
            alert("输入视频地址！");
            return;
        }

        $("#video").attr("src", $("#chanel").val() + url);
    }
    function search() {
        var keyword = $("#search").val();
        if (!keyword) {
            alert("输入要搜索的资源！");
            return;
        }

        var type = $("input[name='type']:checked").val();
        $.get("vip-search?type=" + type + "&key=" + keyword, function (data) {
            $(".vipContent").html(data);
            if ("youku" === type) {
                $("div[data-spm='filter']").remove();
                $(".sk-about-search").remove();
                $(".page-nav").remove();
                $("a[data-spm='ddetail']").remove();
                $("a[title='收起']").remove();
                $("a[title='查看更多']").remove();
            } else if ("iqiyi" === type) {
                $("#af-elem-content").remove();
                $("#relate-ping-back").remove();
                $(".mod-searchAbout").remove();
                $(".mod-page").remove();
                $(".result_tab_list_wrap").remove();
                $(".result_tab_list").remove();
                $(".result_tab_body").remove();
                $(".arrowL-tip-box").remove();
                $(".discernList_keyword").remove();
                $(".discernList_filter").remove();
                $(".discernList_rank").remove();
                $(".info_download_longBtn").parent().remove();
                $("pre").remove();
            }

            $("a[data-type='go-vip']").bind("click", function (e) {
                e.preventDefault();
                e.stopPropagation();
                var url = $(this).attr("data-url");
                $("#v-url").val(url);
                $("#video").attr("src", $("#chanel").val() + url);
                $('html,body').animate({scrollTop: 0}, 1000);
            });
        });
    }
</script>
</body>
</html>