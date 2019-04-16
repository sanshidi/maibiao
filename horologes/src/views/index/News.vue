<template>
   <section class="bg-trans news p-3 p-sm-4 p-md-5">
        <div class="text-white text-center mt-5 mb-4">
            <h1>NEWS</h1>
            <p>新闻资讯</p>
            <p class="line"></p>
        </div>
        <div class="d-flex justify-content-center align-items-center flex-wrap mb-5">
            <div class="col-12 col-lg-8 p-0 mb-3">
                <div class="bg-white clearfix">
                    <router-link to="/article/1" class="col-md-4 col-12 p-0  float-md-left  mb-md-0 mb-3   text-center d-block"><img src="img/news1.jpg"  class="p-0 img-fluid"/></router-link>
                    <div class="col-md-8 p-0 float-md-left pt-md-3 pl-md-3 pr-md-3">
                        <router-link to="/article/1"  class="font-16 text-dark">艾媒发布新零售行业白皮书 万表打造手表零售新业态</router-link>
                        <p class="font-14 mt-2">发表日期：2019-01-05</p>
                        <router-link to="/article/1" >
                            <p class="font-14 mb-0 content">新零售是以互联网为基础、以大数据为支撑，将线上平台、线下实体店和物流配置紧密结合的新型零售模式。马云于2016年10月提出新零售的概念：在互联网发展的基础上，新零售、新制造、新金融、新技术和新能源将成为今后的五大变革。2017年11月24日，全球领先的新经济行业数据挖掘和分析机构iiMedia Research(艾媒咨询)权威发布《2017年中国新零售行业白皮书》。报告显示，2017年无人零售商店交易额预计达389.4亿元，未来五年无人零售商店将会迎来发展红利期。</p>
                        </router-link>
                    </div>
                </div>
                <div class="bg-white clearfix mt-4 ">
                    <router-link to="/article/2"  class="col-md-4 col-12 p-0  float-md-left  mb-md-0 mb-3   text-center d-block"><img src="img/news2.jpg"  class="p-0 img-fluid"/></router-link>
                    <div class="col-md-8 p-0 float-md-left pt-md-3 pl-md-3 pr-md-3">
                        <router-link to="/article/2"  class="font-16 text-dark">传统与智能的完美结合 mVoice G2智能手表发布</router-link>
                        <p class="font-14 mt-2">发表日期：2017-05-23</p>
                        <router-link to="/article/2" >
                            <p class="font-14 mb-0 content">Martian Watches称，mVoice G2的传统自动表针独立于智能系统，可单独提供60天的动力走时，在mVoice系列中用户可以使用三大语音助手提供各类功能，比如询问天气，添加购物列表，创建闹钟提醒等等，直接进行Lyft约车等等，而且其OLED区域能够显示三方应用的提醒等消息，并且能够定制震动类型和LED颜色。</p>
                        </router-link>
                    </div>
                </div>
            </div>
            <div class="col-12 col-lg-4 text-center position-relative mb-md-3 ">
                <a href="#" @click.prevent="showVideo()"><img src="img/vedio-sm.jpg" class="img-fluid"/>
                    <i class="fa fa-play play fa-3x text-white" aria-hidden="true"></i>
                </a>
            </div>
            <div class="bg" :class="show"></div>
            <div class="video justify-content-center align-items-center" :class="videoClass" ref="videoDiv" @click="hideVideo">
                <video src="../../assets/video.mp4"   width="80%"  controls="controls" ref="video" @click.stop=""></video>
            </div>
        </div>
    </section>
</template>
<script>
export default {
    data(){
        return{
            show:'d-none',//背景的显示于隐藏
            videoClass:{
                'd-none':true,
                'animated':true,
                'zoomInLeft':false,
                'zoomOutRight':false,
                'd-flex':false
            }
        }
    },
    methods:{
        showVideo(){//显示video
            this.videoClass.zoomInLeft=true;
            this.videoClass['d-none']= false;
            this.videoClass['d-flex']= true;
            this.videoClass.zoomOutRight=false;
            this.$refs.video.play();
        },
        hideVideo(){
            this.videoClass.zoomInLeft=false;
            this.videoClass.zoomOutRight=true;
            setTimeout(()=>{
                this.videoClass['d-none']= true;
                this.videoClass['d-flex']= false;
            },500)
            this.$refs.video.pause();
        },
        newsScroll(){//显示背景
            let scrollT =$(window).scrollTop();
            let innerH=$(window).height();
            let divTop = $('.news').offset().top;
            //在div内就让其显示 出去就不显示
            if(scrollT>=divTop-innerH && scrollT<=divTop+$('.news').innerHeight()){
                this.show='';
            }else{
                this.show='d-none'
            }
        },
    },
    mounted(){
        //监听 滚动事件 因为resize事件也会出现尺寸改变所以都要监听
        this.newsScroll();
        $(window).on('scroll',this.newsScroll);
        $(window).on('resize',this.newsScroll);
    }
    ,destroyed(){
         $(window).off('scroll',this.newsScroll);
         $(window).off('resize',this.newsScroll);
    }
}
</script>

<style scoped>
.news{
     position: relative;
     text-align: left
 }
.news .bg{
    content: '';
    position: fixed;
    left: 0;
    right: 0;top: 0;
    bottom: 0;
    background-image: url("../../../public/img/bg1.jpg");
    z-index: -1;
    background-position: -240px 705px;
}
.news h1{
    font-weight: 700;
}
.line{
    border-bottom: 2px solid white;
    width: 2rem;
    margin: 0 auto;
}
.news>div:nth-child(2)>div:first-child>div{
    padding: 0.25rem;
}
.news>div:nth-child(2)>div:nth-child(2)>img{
    border: 0.25rem solid white;
}
.news .content{
    line-height: 1.5rem !important;
    height: 4.5rem;
    overflow: hidden;;
}
.news a{
    transition: transform .5s;
    overflow: hidden;
    color: rgb(141, 144, 149);
}
.news a:hover{
    color: #996600!important;
    transform: scale(1.1);
}
.news .play{
    position: absolute;
    left: 50%;
    top: 50%;
    margin-top:-24px;
    margin-left: -18px;
}
.news a:hover i{
    animation: flash 1s;
}
.news .video{
    position: fixed;
    z-index: 99;
    background: rgba(0,0,0,0.5);
    left: 0;
    right: 0;
    top: 0;
    bottom: 0;
}
</style>
