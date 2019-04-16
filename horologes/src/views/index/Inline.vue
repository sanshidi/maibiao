<template>
     <!--ONLINE STORE-->
    <section class="d-none d-lg-flex bg-white online">
        <a href="#" class="w-50"> <img src="img/product/online.jpg" alt=""/></a>
        <div class="online_detail">
            <h1 class="mt-4">ONLINE STORE</h1>
            <ul class="list-unstyled mt-5 mb-5">
                <li><i class="fa fa-map-marker" aria-hidden="true"></i>GPRS系统实时定位</li>
                <li><i class="fa fa-compass" aria-hidden="true"></i>掌握最新气象情况</li>
                <li><i class="fa fa-user-o" aria-hidden="true"></i>关联其它设备</li>
                <li><i class="fa fa-clock-o" aria-hidden="true"></i></i>倒计时提醒功能</li>
                <li><i class="fa fa-code-fork" aria-hidden="true"></i>血压实时监测</li>
            </ul>
            <p>精于工，卓于质。</p>
            <p>时光传承经典 经典铭记时光</p>
            <a href="#" class="detail">了解详情</a>
        </div>
    </section>
</template>
<script>
export default {
    data(){
        return{
            shouldAdd:true,
        }
    },
    mounted(){
        window.addEventListener('scroll',this.scroll)
    },
    methods:{
        scroll(){
            let scrollT =$(window).scrollTop();
            let divTop = $('.online').offset().top;
            if(scrollT>=divTop-100 && this.shouldAdd){
                $('.online').css({'visibility':"visible"})
                .children().first().addClass('animated bounceInLeft').next().addClass('animated bounceInRight');
                this.shouldAdd=false;
                window.removeEventListener('scroll',this.scroll)
            }
        },
    },
    destroyed(){
        window.removeEventListener('scroll',this.scroll);
    }
}
</script>
<style scoped>
.online{
    padding: 50px;
    color: black;
    font-weight: bold;
    font-size: 14px;
    visibility: hidden;
    text-align:left;
}
.online>a>img{
    transition: transform 1s;
}
.online>a>img:hover {
    transform:scale(1.1) ;
}
.online h1{
    font-weight: 700;
}
.online .fa{
    width: 1rem;
    margin-right: 0.3rem;
    text-align: center;
}
.online .w-60{
    width: 60%;
}
.online a.detail{
    display: block;
    border-radius: 2rem;
    background-color: #112233;
    color: white;
    transition: all 0.5s;
    font-size: 1rem;
    line-height: 3rem;
    width: 11rem;
    text-align: center;
    margin-top: 4rem;
}
.online a.detail:hover{
    color: black;
    background-color: white;
    border: 1px solid black;
}
.online ul>li{
    margin-bottom: 1rem;
}
.online>a{
    margin-right: 8rem;
}

</style>
