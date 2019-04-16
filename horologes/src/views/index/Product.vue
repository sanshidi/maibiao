<template>
        <!--商品展示中心-->
    <section class="products p-1 p-sm-2 p-md-3 p-lg-5">
        <div class="text-white text-center mt-5 mb-4" :style="`visibility:${visible}`" :class="class1">
            <h1 class="text-center">PRODUCTS</h1>
            <p>商品列表</p>
            <p class="line"></p>
        </div>
        <ul class="list-unstyled col-12 d-flex  flex-wrap" :style="`visibility:${visible}`" :class="classUl">
            <li class=" col-md-3 col-6 p-0 mb-2" v-for="product of products">
                <div class="text-center bg-white  m-md-2 m-1">
                    <router-link :to="`detail/${product.pid}`" class="d-block mb-3 mt-3" :title="product.title">
                        <img :src="product.img" class="img-fluid"/>
                    </router-link>
                    <router-link :to="`detail/${product.pid}`" class="title" :title="product.title">{{product.title}}</router-link>
                    <p class="price">￥{{product.price}}</p>
                </div>
            </li>
        </ul>
    </section>
</template>

<script>
export default {
    data(){
        return{
            products:[],
            showPro:true,
            visible:'hidden',
            class1:'',
            classUl:'',
        }
    },
    created(){
        this.axios.get('http://localhost:3000/index/products')
        .then(result=>{
            this.products=result.data;
        })
    },
    mounted(){
        $(window).on('scroll',this.proScroll);
        $(window).on('resize',this.proScroll);
    },
    methods:{
        proScroll(){
            let scrollT =$(window).scrollTop();
            let divTop = $(this.$el).offset().top;
            if(scrollT>=divTop-100 && this.showPro){
                this.showPro=false;
                this.visible='visible';
                this.class1='animated bounceInDown';
                this.classUl='animated bounceInUp';
                $(window).off('scroll',this.proScroll);
                $(window).off('resize',this.proScroll);
            }
        }
    },
    destroyed(){
        $(window).off('scroll',this.proScroll);
        $(window).off('resize',this.proScroll);
    }
}
</script>

<style scoped>
.products{
    background: #efefef;
    font-size: 14px;
}
.products h1{
    color: black;
    font-weight: 700;
}
.products h1+p{
    color: black;
}
.products .line{
    border-bottom-color:black ;
}
.products>ul>li>div{
    overflow: hidden;
    transition: all 0.5s;
}
.products>ul>li img{
    transition: transform 1s;
}
.products>ul>li:hover div{
    box-shadow:0 5px 40px #b1afaf;
    transform: translateY(-7px);
}
.products>ul>li:hover img{
    transform:scale(1.1)
}
.products>ul>li:hover .title{
    color:black !important;
}
.products>ul>li:hover .title::after{
    width: 100%;
}
.products .price{
    color:#666;
}
.products .title{
     position: relative;
     font-size: 15px;
     padding-bottom: 1rem;
     display: block;
     color: #6c757d;
 }
.products .title::after{
    position: absolute;
    left: 0;
    bottom: 0.5rem;
    content: '';
    border-top: 1px solid #eeeeee;
    width: 0;
    transition: width 1s;
}
@media (min-width:500px) and (max-width: 580px ) {
    .products>ul>li div{
        margin: 0.5rem !important;
    }
}
@media (min-width:580px) and (max-width: 650px ) {
    .products>ul>li div{
        margin: 0.6rem !important;
    }
}
@media (min-width:650px) and (max-width: 767px ) {
    .products>ul>li div{
        margin: 0.8rem !important;
    }
}

</style>

