<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<body>
<h2>Hello World!</h2>
<div data-countdown="2017/11/01"></div>
<div data-countdown="2017/11/01"></div>
<div data-countdown="2018/01/01"></div>
<div data-countdown="2019/4/09"></div>
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/jquery.countdown/2.1.0/jquery.countdown.min.js"></script>
<script>
    $('[data-countdown]').each(function(){
        var $this = $(this), finalDate = $(this).data('countdown');
        $this.countdown(finalDate, function(event) {
            $this.html(event.strftime('%D 天 %H:%M:%S'));
        });
    })

</script>
<div id="clock"></div>

<script>
    $('#clock').countdown('2019/04/10', function(event) {
        var format = event.strftime('秒杀倒计时:  %D天  %H时  %M分  %S秒');
        var $this = $(this).html(format);
    });
</script>
</body>
</html>
