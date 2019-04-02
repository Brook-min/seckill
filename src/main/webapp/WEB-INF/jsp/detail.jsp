<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <title>秒杀详情页</title>
    <%@include file="common/head.jsp" %>

    <!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>

    <!-- 使用CDN获取公共js http://www.bootcdn.cn -->
    <!-- jQuery cookie操作插件 -->
    <script src="https://cdn.bootcss.com/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
    <!-- jquery countdown倒计时插件 -->
    <script src="https://cdn.bootcss.com/jquery.countdown/2.1.0/jquery.countdown.min.js"></script>

    <script type="text/javascript">
        $(function () {
            var seckill = {
                //封装秒杀相关ajax的url
                URL: {
                    now: function () {
                        return '/seckill/time/now';
                    }
                },
                validatePhone: function (phone) {
                    if (phone && phone.length == 11 && !isNaN(phone)) {
                        return true;
                    } else {
                        return false;
                    }
                },

                countdown: function (seckillId, nowTime, startTime, endTime) {
                    var seckillBox = $('#seckill-box');
                    //时间判断
                    if (nowTime > endTime) {
                        //秒杀结束
                        seckillBox.html('秒杀结束！');
                    } else if (nowTime < startTime) {
                        //秒杀未开始，计时
                        var killTime = new Date(startTime + 1000);
                        seckillBox.countdown(killTime, function (event) {
                            //时间格式
                            var format = event.strftime('秒杀倒计时:  %D天  %H时  %M分  %S秒');
                            seckillBox.html(format);
                            //时间完成后回调事件
                        }).on('finish.countdown', function () {
                            //秒杀地址
                        });
                    } else {
                        //秒杀开始了
                    }
                },
                //详情页秒杀逻辑
                detail: {
                    //详情页初始化
                    init: function (params) {
                        //手机验证和登陆，计时交互
                        //规划我们的交互流程
                        //在cookie中查找手机号
                        var killPhone = $.cookie('killPhone');

                        //验证手机号
                        if (!seckill.validatePhone(killPhone)) {
                            //绑定phone
                            var killPhoneModal = $('#killPhoneModal');
                            //显示弹出层
                            killPhoneModal.modal({
                                show: true, //显示弹出层
                                backdrop: 'static',//禁止位置关闭
                                keyboard: false//关闭键盘事件
                            });
                            $('#killPhoneBtn').click(function () {
                                var inputPhone = $('#killPhoneKey').val();
                                console.log('inputPhone=' + inputPhone);//TODO
                                if (seckill.validatePhone(inputPhone)) {
                                    //电话写入cookie
                                    $.cookie('killPhone', inputPhone, {expires: 7, path: '/seckill'});
                                    //刷新页面
                                    window.location.reload();
                                } else {
                                    $('#killPhoneMessage').hide().html('<label class="label label-danger">手机号错误！</label>').show(300);
                                }
                            });
                        }
                        //已经登陆
                        //计时交互
                        var startTime = params['startTime'];
                        var endTime = params['endTime'];
                        var seckillId = params['seckillId'];
                        $.get(seckill.URL.now(), {}, function (result) {
                            if (result && result['success']) {
                                var nowTime = result['data'];
                                //时间判断，时间交互
                                seckill.countdown(seckillId, nowTime, startTime, endTime);
                            } else {
                                console.log('result=' + result);
                            }
                        });
                    }
                }
            }

            //使用el表达式传入参数
            seckill.detail.init({
                seckillId:${seckill.seckillId},
                startTime:${seckill.startTime.time},//毫秒
                endTime:${seckill.endTime.time}
            });
        });
    </script>
</head>
<body>
<div class="container">
    <div class="panel panel-default text-center">
        <div class="panel-heading"><h1>${seckill.name}</h1></div>
        <div class="panel-body">
            <h2 class="text-danger">
                <!-- 显示time图标 -->
                <span class="glyphicon glyphicon-time"></span>
                <!-- 展示倒计时 -->
                <span class="glyphicon" id="seckill-box"></span>
            </h2>
        </div>
    </div>
</div>
<!-- 登录弹出层，输入电话 -->
<div id="killPhoneModal" class="modal fade">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h3 class="modal-title text-center">
                    <span class="glyphicon glyphicon-phone"></span>秒杀电话：
                </h3>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-xs-8 col-xs-offset-2">
                        <input type="text" name="killPhone" id="killPhoneKey"
                               placeholder="填写手机号^o^" class="form-control"/>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <!-- 验证信息 -->
                <span id="killPhoneMessage" class="glyphicon"></span>
                <button type="button" id="killPhoneBtn" class="btn btn-success">
                    <span class="glyphicon glyphicon-phone"></span>
                    Submit
                </button>
            </div>
        </div>
    </div>
</div>
</body>
</html>