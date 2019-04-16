<template>
<div>
    <transition name="slide-fade">
    <div v-show="show" class="container-fluid p-0 lunbo" :style="{height:height}">
        <!--
        data-ride="carousel" 让图片动起来
        外包裹 carousel
        内包裹 carousel-inner
        子项目 carousel-item
        添加标题 carousel-caption
        -->
        <div class="carousel slide" data-ride="carousel" id="carousel" :style="{height:height}" data-interval="3000" ref="carousel">
            <!--轮播图片-->
            <div class="carousel-inner">
                <div class="carousel-item " v-for="(imgage,i) of imgs" :class="`${i==0?'active':''}`" >
                    <router-link :to="imgage.herf">
                        <img :src="imgage.img" :alt="imgage.title" class="w-100"/>
                    </router-link>
                </div>
            </div>
            <!--导航指示符-->
            <ul class="carousel-indicators">
                <li :class="`${i==0?'active':0}`" :data-slide-to="i"  data-target="#carousel" v-for="(img,i) of imgs"></li>
            </ul>
        </div>
    </div>
    </transition>
</div>
</template>
<script>
export default {
    data(){
        return{
            imgs:[],
            height:'',
            show:false
        }
    },
    created(){
        this.axios.get('http://localhost:3000/index/lunbo').then(result=>{
            this.imgs=result.data;
        })
        this.height=$(window).innerWidth()*800/1920+'px';
        console.log('cccccc');
    },

    mounted(){
        this.$nextTick(()=>{
             this.height='auto';
        })
        //重新调用carousel动画
        $(this.$refs.carousel).carousel('cycle');
        this.show=true;
    },
}
</script>

<style scoped>
/* 可以设置不同的进入和离开动画 */
/* 设置持续时间和动画函数 */
.slide-fade-enter-active {
  transition: all 1s ease;
}
.slide-fade-leave-active {
  transition: all 1s cubic-bezier(1.0, 0.5, 0.8, 1.0);
}
.slide-fade-enter, .slide-fade-leave-to
/* .slide-fade-leave-active 用于 2.1.8 以下版本 */ {
  opacity: 0;
}
.lunbo  .carousel-indicators{
    z-index: 2
}
.lunbo  .carousel-indicators>li{
    border-radius: 50%;
    margin:0 0.5rem ;
    width: .8rem;
    height: .8rem;
    cursor: pointer;
}
@media (max-width: 991px){
    .lunbo .carousel-indicators>li {
        width: .7rem;
        height: .7rem;
    }
}
@media (max-width: 767px){
    .lunbo .carousel-indicators>li {
        width: .5rem;
        height: .5rem;
    }
}
@media (max-width: 556px){
    .lunbo .carousel-indicators>li {
        width: .4rem;
        height: .4rem;
    }
}
</style>
