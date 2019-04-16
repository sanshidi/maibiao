 <template> 
 <footer class="container-fluid p-0 bg-black">
        <section class="pt-5 pb-2 d-none d-lg-block">
            <ul class="list-unstyled d-flex  p-9">
                <li class="d-flex w-100">
                    <img src="img/car-icon.png">
                    <div class="ml-3">
                        <p class="font-16 font-weight-bold mb-0">
                            满1000全包邮</p>
                        <p class="mb-0 font-12">全场订单满1000包邮</p>
                    </div>
                </li>
                <li class="d-flex w-100">
                    <img src="img/person-icon.png">
                    <div class="ml-3">
                        <p class="font-16 font-weight-bold mb-0">
                            贴心的售后服务</p>
                        <p class="mb-0 font-12">7x24小时售后随时为您服务</p>
                    </div>
                </li>
                <li class="d-flex w-100">
                    <img src="img/sale-icon.png">
                    <div class="ml-3">
                        <p class="font-16 font-weight-bold mb-0">
                            店铺优惠劵</p>
                        <p class="mb-0 font-12">每日整点可领取限量优惠劵</p>
                    </div>
                </li>
                <li class="d-flex w-100">
                    <img src="img/gift-icon.png">
                    <div class="ml-3">
                        <p class="font-16 font-weight-bold mb-0">
                            下单送精美礼品</p>
                        <p class="mb-0 font-12">本店购买任意商品赠送精美礼品</p>
                    </div>
                </li>
            </ul>
        </section>
        <hr class="d-none d-lg-block"/>
        <section class="d-none d-lg-block p-9">

                <ul class="list-unstyled d-flex mt-4 mb-4">
                    <li class="w-100 mr-5">
                        <ul class="list-unstyled line-height-24">
                            <li><p  class="font-16 mb-4 font-weight-bold">关于产品</p></li>
                            <li class="font-12">本店商品非质量问题谢绝退换，如有质量问题，本店承担运费调换</li>
                        </ul>
                    </li>
                    <li class="w-100 mr-5">
                        <ul class="list-unstyled line-height-24">
                            <li><p class="font-16 mb-4 font-weight-bold">售前服务</p></li>
                            <li class="font-12 mb-0">消費者保障服务</li>
                            <li class="font-12 mb-0">七天无理由退款</li>
                            <li class="font-12 mb-0">假一赔三</li>
                        </ul>
                    </li>
                    <li class="w-100 mr-5">
                        <ul class="list-unstyled line-height-24">
                            <li><p class="font-16 mb-4 font-weight-bold">售后服务</p></li>
                            <li class="font-12 mb-0">保养说明</li>
                            <li class="font-12 mb-0">隐私政策</li>
                            <li class="font-12 mb-0">客户常见问题</li>
                            <li class="font-12 mb-0"> 咨询服务</li>
                        </ul>
                    </li>
                    <li class="w-100 mr-5 ">
                        <ul class="list-unstyled line-height-24">
                            <li><p class="font-16 mb-4 font-weight-bold">关于产品</p></li>
                            <li class="font-12 ">本店商品非质量问题谢绝退换，如有质量问题，本店承担运费调换</li>
                        </ul>
                    </li>

                </ul>

                <ul class="list-unstyled d-flex mt-4">
                    <li class="w-100 mr-5">
                        <ul class="list-unstyled line-height-24">
                            <li><p  class="font-16 mb-4 font-weight-bold">支付方式</p></li>
                            <li class="d-flex">
                                <img src="img/yinlian.png"  height="34"/>
                                <img src="img/zhifubao.png"  height="34" class="ml-3"/>
                                <img src="img/webchat.png"  height="34" class="ml-3"/>
                            </li>
                        </ul>
                    </li>
                    <li class="w-100 mr-5">
                        <ul class="list-unstyled line-height-24">
                            <li><p class="font-16 mb-4 font-weight-bold">关于商城</p></li>
                            <li class="font-12">本店商品非质量问题谢绝退换，如有质量问题，本店承担运费调换</li>
                        </ul>
                    </li>
                    <li class="w-100 mr-5">
                        <ul class="list-unstyled line-height-24">
                            <li><p class="font-16 mb-4 font-weight-bold">关于产品</p></li>
                            <li class="font-12">本店商品非质量问题谢绝退换，如有质量问题，本店承担运费调换</li>
                        </ul>
                    </li>
                    <li class="w-100 mr-5 ">
                        <ul class="list-unstyled line-height-24">
                            <li class="mb-3"><img src="img/logo.png" height="38"></li>
                            <li><img src="img/ercode.jpg" alt=""/></li>
                            <li class="font-12 mt-1 chat">搜索微信号：HUINI</li>
                        </ul>
                    </li>
                </ul>
            </div>
        </section>
        <hr class="d-none d-lg-block"/>
        <section class="pt-4 pb-2 " >
            <div class="d-flex justify-content-center mb-2">
                <span></span>
                <span></span>
                <span></span>
                <span></span>
                <span></span>
            </div>
            <p class="text-center font-12 pt-1 mb-0">Copyright © 2010-2018红酒庄园直营商品专卖 All rights reserved</p>
        </section>
    </footer>
 
 
 </template>


 <style scoped>
    footer hr{
        border-top: 1px solid #3d3d3d;
        margin: 0 !important;
    }
    footer>section:first-child img{
        height: 46px;
    }
    .line-height-24{
        line-height:1.5rem;
    }
    footer{
        color:#828282;
    }
    footer p[class*='font-16'],.chat{
        color: #c1c1c1;
    }
    footer>section:last-child span{
        height: 1rem;
        width: 1rem;
        margin: 0 1rem;
        background-image: url("../../public/img/icon.png");
    }
    footer>section:last-child span:first-child{
        background-position: 0 16px;
    }
    footer>section:last-child span:nth-child(2){
        background-position: 353px 16px;
    }
    footer>section:last-child span:nth-child(3){
        background-position: 240px 16px;
    }
    footer>section:last-child span:nth-child(4){
        background-position:272px 16px;
    }
    footer>section:last-child span:last-child{
        background-position: 144px 16px;
    }
    footer li{
        cursor: pointer;
        text-align: left
    }
    footer p{
        text-align: left
    }
</style>
 