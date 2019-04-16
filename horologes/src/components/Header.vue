
import { constants } from 'fs';
<template>
     <header class="container-fluid bg-black p-0">
        <!--顶部-->
        <div class="d-none d-lg-flex justify-content-between">
           <div class="d-flex align-items-center font-color-a3 font-12">
               <span><i class="fa fa-clock-o mr-2" aria-hidden="true"></i>
               在线时间 08:30~21:30</span>
               <span class="ml-4">欢迎访问钟表专卖商城！</span>
           </div>
           <!-- 购物车 -->
           <div class="d-flex">
               <a href="#">
                   <i class="fa fa-user-circle-o font-22" aria-hidden="true"></i>
               </a>
               <div class="car">
                   <a href="#">
                       <i class="fa fa-shopping-cart font-22 fa-2x" aria-hidden="true"></i>
                   </a>
                   <div class="car-detail">
                       <p class="mb-0" v-show="this.products.length==0">购物车里没有商品</p>
                       <div id="shopCar" v-show="this.products.length>0">
                           <ul class="list-unstyled list-group">
                            <transition-group v-for="product of products" :key="product.pid" enter-active-class="animated bounceInLeft" leave-active-class="animated bounceOutRight">
                               <li class="list-group-item" :key="product.pid" v-if="!product.show">
                                   <img :src="`${product.img}`" alt=""/>
                                   <div class="w-100 text-left">
                                       <span class="text-dark">{{product.title}}</span>
                                       <p class="mb-0">{{product.count}} * ￥{{product.price.toFixed(2)}}</p>
                                   </div>
                               <span class="close" @click="removePro(product)">
                                   &times;
                               </span>
                               </li> 
                               </transition-group>
                           </ul>
                           <p class="mb-0 text-center text-dark">小计 ￥{{countAll}}</p>
                           <button class="btn btn-link border-primary font-14">查看购物车</button>
                           <button class="btn btn-primary font-14">结算</button>
                       </div>

                   </div>
               </div>
           </div>
       </div>
        <!--大屏导航条-->
        <div class="d-none d-lg-flex justify-content-between align-items-center m-0 p-9 font-14 ">
            <!---------不被折叠的导航选项---------->
            <router-link to="/" class="navbar-brand"><img src="img/logo.png" alt="" width="183"/></router-link>
            <!--导航栏中的菜单 小屏幕隐藏垂直显示-->
            <ul class="d-flex justify-content-around w-100 list-unstyled mb-0">
                <li class="nav-item">
                    <router-link to="/" class="nav-link text-white">商城首页</router-link>
                </li>
                <li class="nav-item">
                    <router-link to="/products" class="nav-link  ">所有商品</router-link>
                </li>
                <li class="nav-item">
                    <router-link to="/infos" class="nav-link">商城动态</router-link>
                </li>
                <li class="nav-item">
                    <router-link to="/about" class="nav-link">关于店铺</router-link>
                </li>
                <li class="nav-item">
                    <router-link to="/underLine" class="nav-link">线下门店</router-link>
                </li>
             </ul>
            <div  class="d-none d-lg-block">
                <input type="text" placeholder="搜索商品关键字" class="search" @keyup.13="search" v-model="serachVal">
                <a @click="search"><i class="fa fa-search" aria-hidden="true"></i></a>
            </div>

        </div>
        <!--中小导航条-->
        <div class="d-flex d-lg-none justify-content-between p-9 align-items-center pl-3 pr-3">
            <!-- 侧边栏logo点击 -->
            <a href="javascript:void(0)" @click="show('left')">
                <i class="fa fa-align-justify" aria-hidden="true" ></i>
            </a>
            <router-link to="/"><img src="img/logo.png" alt="" width="103"/></router-link>
            <!-- --搜索框点击-- -->
            <div>
                <a href="javascript:void(0)" @click="show()">
                    <i class="fa fa-search" aria-hidden="true"></i>
                </a>
                <a href="javascript:void(0)">
                    <i class="fa fa-user-circle-o" aria-hidden="true"></i>
                </a>
                <a href="javascript:void(0)">
                    <i class="fa fa-shopping-cart" aria-hidden="true"></i>
                </a>
            </div>
            <!--侧边导航-->
            <aside class="side" :style="{left}">
                <div>
                    <ul class="list-unstyled list-group">
                        <li class="list-group-item">
                            <img src="img/logo.png" alt="" width="150"/>
                        </li>
                        <li class="list-group-item">
                            <router-link to="/">商城首页</router-link>
                        </li>
                        <li class="list-group-item">
                            <router-link to="/products">所有商品</router-link>
                        </li>
                        <li class="list-group-item">
                            <router-link to="/infos">商城动态</router-link>
                        </li>
                        <li class="list-group-item">
                            <router-link to="/about">关于店铺</router-link>
                        </li>
                        <li class="list-group-item">
                            <router-link to='underLine'>线下门店</router-link>
                        </li>
                    </ul>
                </div>
            </aside>
            <!--蒙版-->
            <div class="my-mask" @click="hide" :style="maskStyle">

            </div>
            <!--搜索框-->
            <div class="search-box" :class="searchClass">
                <p class="font-16 text-dark">搜索</p>
                <input type="text" placeholder="请输入关键词" class="font-16 p-2 mb-3 w-100 " v-model="serachVal" @keyup.13="search"/>
                <div class="d-flex justify-content-end w-100">
                    <a class="btn btn-link text-dark mr-2" @click="search">确定</a>
                    <a class="btn btn-link text-dark" @click="hide">取消</a>
                </div>
            </div>
        </div>
    </header>
</template>


<script>
export default {
    data(){
        return {
            //侧边栏
            left:'-15rem',
            //蒙版style
            maskStyle:{opacity: 0,visibility: 'hidden',},
            //搜索框class
            searchClass:'d-none',
            serachVal:''
        }
    },
    methods:{
        show(e){//控制显示和隐藏模态框 以及侧边栏,搜索框等
            if(e=='left'){
                this.left=0;
            }
            else{
                this.searchClass='';
            }
            this.maskStyle={opacity: 0.3,visibility: 'visible',}
        },
        hide(){//控制显示和隐藏模态框 以及侧边栏,搜索框等
            this.searchClass='d-none';
            this.left='-15rem';
            this.maskStyle={opacity: 0,visibility: 'hidden',};
        },
        removePro(item){//删除商品 
            this.$set(item,'show',true);//为其绑定一定show属性
            setTimeout(()=>{
                this.$store.dispatch('delCart',item.pid).then(()=>{
                    if(this.products.length==0){
                        this.proShow=!this.proShow;
                    }
                }) 
            },500) 
        },
        search(){
            if(this.serachVal.trim()!==''){
                this.hide();
                this.$router.push(`/products/kword/${this.serachVal}`)
                this.serachVal='';
            }
        }
    },
    created(){//数据加载完成后

    },
    computed:{//计算后属性
        countAll(){
            let total=0;
            for (const product of this.products) {
                total+=product.count*product.price;
            }
            return total.toFixed(2);
        },
        products(){
            return this.$store.state.cartList;
        },
    },
    mounted(){//dom元素查找完成后
       
    },
    destroyed(){//组件销毁后{}

    }
}
</script>
<style scoped>
.active{
    background-color: red
}
header>div:first-child{
    border-bottom: 1px solid #3d3d3d;
    height: 3rem;
    line-height: 3rem;
    padding:0 2.5rem;
}
header>div{
    position: relative;
}
header>div:first-child a{
    display: inline-block;
    color: #a3a3a3;
    padding-left: 0.5rem;
    margin-left: 1rem;
}
header .bg-dark{
    background-color: #212121 !important ;
}
header .nav-link{
    color: white;
}
header .search{
    border: none;
    background: transparent;
    text-indent: 0.5rem;
    border-bottom: 1px solid #a3a3a3;
    line-height: 2rem;
    color: #a3a3a3;
    outline: none;
    width: 10rem;
    padding-right: 2rem;
}
header>div:nth-child(2) .fa-search{
    color: white;
    font-size: 1rem;
    position: absolute;
    right:3rem;
    top: 2.1rem;}
header>div:nth-child(3) a{
    color: white;
    padding: 0 0.2rem;
}
header .side{
    position: fixed;
    background-color: #212121 !important ;
    top: 0;
    left: -15rem;
    bottom: 0;
    width: 15rem;
    overflow: hidden;
    z-index: 99;
    transition: left 0.5s;
}
header>div:nth-child(3) .list-group-item{
    background-color: #212121 !important ;
    cursor: pointer;
    transition: padding-left 1s;
}
header>div:nth-child(3) .list-group-item:hover{
    padding-left: 3rem;
    color: white;
}
header>div:nth-child(3) .list-group-item>a{
    color: #a3a3a3;
    display: inline-block;
    width: 100%;
    height: 100%;
}
header>div:nth-child(3) .list-group-item>a:hover{
    color: white;
}
header .car{
    position: relative;
  
}
header  .car .list-group{
    max-height: 366px;
    overflow: auto
}
header .car-detail{
    position: absolute;
    right: 0;
    top:3rem;
    background-color: white;
    z-index: 9999;
    padding: 0.5rem 1rem;
    box-shadow: 0 2px 10px gray;
    width: 18rem;
}
header .car .car-detail .list-group-item{
    position: relative;
    display: flex;
    transition: all 0.5s linear;
    overflow: hidden;
}
header .car-detail .list-group-item>img{
    width: 80px;
    height: 92px;
}
header .close{
    position: absolute;
    right: 1rem;
    top: 1.5rem;
}
header .car-detail button{
    width: 100%;
    border-radius: 2px;
}
.car>.car-detail{
    visibility: hidden;
    opacity: 0;
    transition: all 0.5s;
}
.car:hover .car-detail{
    visibility: visible;
    opacity: 1;
}
header .search-box{
    position: fixed;
    left: 10%;
    right: 10%;
    top: 30%;
    background-color: white;
    border: 2px solid gray;
    padding: 1rem ;
    animation:bounceInDown 1s;
    z-index: 98;
}
.search-box .btn-link:hover{
    background-color: grey;
    opacity: 0.5;
    color: white !important;
}
/*定义滚动条高宽及背景 高宽分别对应横竖滚动条的尺寸*/
.list-group::-webkit-scrollbar { 
    width: 6px; 
    background-color: rgba(217,217,217,0.3); 
} 
/*定义滑块 内阴影+圆角*/
.list-group::-webkit-scrollbar-thumb { 
    background-color: gainsboro; 
    border-radius: 6px; 
} 
/*定义滚动条轨道 内阴影+圆角*/
.list-group::-webkit-scrollbar-track { 
    box-shadow: inset 0 0 6px rgba(217,217,217,0.3); 
    background-color: #fff; 
} 
</style>

