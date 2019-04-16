<template>
       <section class="info p-3 p-sm-4 p-md-5">
        <div class="text-white text-center mt-5 mb-4" data-toggle="hidden">
            <h1 class="text-center">INFOS</h1>
            <p>资讯中心</p>
            <p class="line"></p>
        </div>
        <ul class="list-unstyled pt-3 pb-3 mb-0">
            <li class="p-1 p-sm-3 p-md-4 p-lg-5" data-toggle="hidden" v-for="(info,i) of news">
                <div class=" d-flex align-items-center justify-content-center flex-column flex-md-row  p-0">
                    <div class=" col-12  col-lg-4 col-md-4 text-left text-md-center p-0">
                        <p class="mb-0">
                            <span class="day">{{info.time | getMonthDay}}</span> 
                            {{new Date(info.time).getFullYear()}}
                        </p>
                    </div>
                    <div class="col-12  col-md-8 d-flex  justify-content-around p-0  flex-column content pr-md-4">
                        <router-link  :to='`article/${info.nid}`' class="font-18 ">{{info.title}}</router-link>
                        <p class="mb-2 font-12 mt-3" v-html="$options.filters.maxLength(info.content)"></p>
                        <i class="fa fa-chevron-right fa-2x" aria-hidden="true"></i>
                    </div>
                </div>
            </li>
        </ul>
        <div class="text-center mt-4 mb-md-0 mb-2 " data-toggle="hidden">
            <a href="#" class="btn-detail">了解详情<i class="fa fa-long-arrow-right ml-2" aria-hidden="true"></i></a>
        </div>
        <div :class="bg2"></div>
    </section>
</template>

<script>
export default {
    data(){
        return{
            bg2:'',
            news:[],
        }
    },
    methods:{
        infoS(){
            let top=$(window).scrollTop();
            let innerH = $(window).innerHeight();
            let divTop = $(this.$el).offset().top;
            if(top>=divTop-innerH && top<=divTop+$(this.$el).innerHeight()){
                this.bg2='bg2'
            }else{
                this.bg2='';
            }
            $(this.$el).find('[data-toggle=hidden]').each(function(){
                if(top>=$(this).offset().top+$(this).innerHeight()-innerH){
                    $(this).attr('data-toggle','').addClass('animated bounceInUp');
                }
            })
        }
    },
    created(){//数据加载完成后
        this.axios.get('http://localhost:3000/index/news').then(result=>{
            this.news=result.data;
        })
    },
    mounted(){//元素渲染后
        $(window).on('scroll',this.infoS);  
    },
    destroyed(){//销毁后
        $(window).off('scroll',this.infoS);
    },
    filters:{
        maxLength(val){
            let p = document.createElement('div');
            p.innerHTML=val;
            val=$(p).text();
            if(val.length>=50){
                return val.slice(0,50)+'...';
            }
        },
        getMonthDay(val){
            let month = new Date(val).getMonth()+1;
            if(month<10) month='0'+month;
            let day = new Date(val).getDate();
            if(day<10) day='0'+day;
            return month+'-'+day;
        }
    }
 
}
</script>

<style scoped>
.info h1{
    font-weight: 700;
}
.info .bg2{
    content: '';
    position: fixed;
    left: 0;
    right: 0;top: 0;
    bottom: 0;
    background-image: url("../../../public/img/bg2.jpg");
    z-index: -2;
    background-position: -240px 705px;
}
.info li{
    border-bottom: 1px solid #343435;
    transition: all 0.5s;
}
.info .day{
    font-size: 2.3rem;
    font-weight: 400;
}
.info .font-18{
    font-size: 1.1rem;
    color: #dbdbdb;
}
.info{
    background: rgba(0,0,0,0.7);
    color: #8d9095;
     text-align: left;
}
.info .fa-2x{
    font-size: 1.5rem;
    right: -1rem;
    position: absolute;
    top: 50%;
    margin-top: -0.75rem;
    color: white;
    visibility: hidden;
}
.info li>div{
    transition: transform 0.5s;
}
.info li>div:last-child{
    overflow: hidden;
}
.info .content{
    overflow: hidden;
    position: relative;
}
.info .font-18:hover{
    color: white;
}
@media (min-width: 991px) {
    .info li{
        background-color: #1a1a1a;
    }
    .info li:hover{
        color: white;
        background-color:transparent;
    }
    .info .fa-2x{
        font-size: 1.5rem;
    }
}
@media (min-width: 767px) {
    .info li:hover div{
        transform: translateX(-2rem);
    }
    .info li:hover .fa-2x{
        transform: translateX(-1.5rem);
    }
    .info .fa-2x{
        font-size: 1.2rem;
        margin-top: -0.6rem;
        visibility: visible;
    }
    .info  li:hover .font-18{
        color: white;
    }
}
.btn-detail{
    padding: 0.5rem 1rem 0.5rem 1.3rem;
    background: transparent;
   ;
    display: inline-block;
    color: #888;
    border:1px solid  #888888;
}
.btn-detail:hover{
    border-color: white;
    color: white
}
.info [data-toggle=hidden]{
    visibility: hidden;
}
</style>
