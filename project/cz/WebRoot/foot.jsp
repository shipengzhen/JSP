<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
        <div class="row mt20">
            <div class="col-lg-12">
                <ul class="listbar-5">
                    <li><i class="icon-main icon-intr-1 ilb ml31"></i>
                        <p class="tc gray-font">
                            正品保证<br>
                            假1赔10
                        </p>
                    </li>
                    <li><i class="icon-main icon-intr-2 ilb ml31"></i>
                        <p class="tc gray-font">
                            质优价廉<br>
                            买贵就赔
                        </p>
                    </li>
                    <li><i class="icon-main icon-intr-3 ilb ml31"></i>
                        <p class="tc gray-font">
                            7天保障<br>
                            无理由退换
                        </p>
                    </li>
                    <li><i class="icon-main icon-intr-4 ilb ml31"></i>
                        <p class="tc gray-font">
                            满100元<br>
                            免运费
                        </p>
                    </li>
                    <li><i class="icon-main icon-intr-5 ilb ml31"></i>
                        <p class="tc gray-font">
                            100优惠宝<br>
                            =1元
                        </p>
                    </li>
                    <li><i class="icon-main icon-intr-6 ilb ml31"></i>
                        <p class="tc gray-font">
                            24小时<br>
                            闪电发货
                        </p>
                    </li>
                    <li><i class="icon-main icon-intr-7 ilb ml31"></i>
                        <p class="tc gray-font">
                            7x24小时<br>
                            在线客服
                        </p>
                    </li>
                    <li><i class="icon-main icon-intr-8 ilb ml31"></i>
                        <p class="tc gray-font">
                            支持多种<br>
                            支付方式
                        </p>
                    </li>
                    <li><i class="icon-main icon-intr-9 ilb ml31"></i>
                        <p class="tc gray-font">
                            开箱验货<br>
                            放心付款
                        </p>
                    </li>
                    <li><i class="icon-main icon-intr-10 ilb ml31"></i>
                        <p class="tc gray-font">
                            晒单奖励<br>
                            评论奖励
                        </p>
                    </li>
                </ul>
            </div>
        </div>
        <div class="row mt10">
            <div class="col-lg-12 help-center">
                <ul class="help-list">
                    <li>
                        <ul class="help-on">
                            <li class="ontitle"><i class="icon-main icon-help-1 pull-left"></i>关于我们</li>
                            <li class="ontext"><a id="a" href="#">关于传智</a></li>
                            <li class="ontext"><a href="#">联系我们</a></li>
                            <li class="ontext"><a href="#">加入我们</a></li>
                        </ul>
                    </li>
                    <li>
                        <ul class="help-on">
                            <li class="ontitle"><i class="icon-main icon-help-2 pull-left"></i>购物指南</li>
                            <li class="ontext"><a href="#">购物流程</a></li>
                            <li class="ontext"><a href="#">服务协议</a></li>
                            <li class="ontext"><a href="#">优惠券说明</a></li>
                        </ul>
                    </li>
                    <li>
                        <ul class="help-on">
                            <li class="ontitle"><i class="icon-main icon-help-3 pull-left"></i>支付方式</li>
                            <li class="ontext"><a href="#">银联支付</a></li>
                            <li class="ontext"><a href="#">快钱支付</a></li>
                            <li class="ontext"><a href="#">支付宝支付</a></li>
                        </ul>
                    </li>
                    <li>
                        <ul class="help-on">
                            <li class="ontitle"><i class="icon-main icon-help-4 pull-left"></i>配送方式</li>
                            <li class="ontext"><a href="#">运费说明</a></li>
                        </ul>
                    </li>
                    <li>
                        <ul class="help-on">
                            <li class="ontitle"><i class="icon-main icon-help-5 pull-left"></i>售后服务</li>
                            <li class="ontext"><a href="#">退换货政策</a></li>
                            <li class="ontext"><a href="#">退换货流程</a></li>
                            <li class="ontext"><a href="#">退换货申请</a></li>
                        </ul>
                    </li>
                    <li>
                        <ul class="help-on">
                            <li class="ontitle"><i class="icon-main icon-help-6 pull-left"></i>帮助信息</li>
                            <li class="ontext"><a href="#">常见问题</a></li>
                            <li class="ontext"><a href="#">投诉建议</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    <footer>
        <div class="container">
            <p class="tc lh200">
                <a href="#">关于我们</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="">联系我们</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="">网络联盟</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="">商家入驻</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="">网络招聘</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="">广告服务</a>&nbsp;&nbsp;|
                <br />
                互联网出版许可证编号新出网证 <a href="http://www.miibeian.gov.cn/" target="_blank" rel="external nofollow">你妹的备案</a> ©传智<br>
                京公网安备88888888888888号
            </p>
        </div>
    </footer>
    <script src="assets/lib/jquery/jquery-1.11.0.js"></script>
    <script src="assets/lib/bootstrap/js/bootstrap.js"></script>
    <script type="text/javascript">
        $('#vcode_img').click(function  () {
            $(this).attr('src',  $(this).data('src')+'?'+ Math.random());
        });
    </script>
</body>
</html>
