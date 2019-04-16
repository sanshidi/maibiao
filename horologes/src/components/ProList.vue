<template>
    <div class="m-3 m-md-0 bg-white" >
        <div v-if="pros.length>0">
            <ul class="list-unstyled  d-flex flex-row flex-wrap pro">
           
            <li class="col-6 col-md-3 d-flex flex-column justify-content-center   p-0 p-sm-3 p-lg-4 text-center" v-for="pro of pros.slice(start,start+count)">
                <!--to='`details/${pro.pid}`'-->
                <a  :title="pro.title" @click="addCart(pro.pid)"><img :src="pro.img" :alt="pro.title" class="img-fluid"/></a>
                <router-link :to='`details/${pro.pid}`' :title="pro.title" class="mt-3 mb-2 font-16 title" >{{pro.title}}</router-link>
                <span class="price">¥{{pro.price}}</span>
            </li>
          
            </ul>
            <div class="d-flex justify-content-center pt-3 pb-4 ">
                <ul class="pagination pagination-sm ">
                    <li class="page-item  mr-2" :class="`${parseInt(start/count)==0?'disabled':''}`">
                        <a @click="change(parseInt(start/count))" class="page-link" >上一页</a>
                    </li>
                    <li class="page-item" v-for="page of pages" :class="`${page==parseInt(start/count)+1?'active':''}`">
                        <a @click="change(page)" class="page-link mr-2" >{{page}}</a>
                    </li>
                    <li class="page-item" :class="`${parseInt(start/count)+1==pages.length?'disabled':''}`">
                        <a @click="change(parseInt(start/count)+2)" class="page-link ">下一页</a>
                    </li>
                </ul>
            </div>
        </div>

        <div  v-else  class="d-flex align-items-center justify-content-center "style="height:22rem">
            <div style="color:red">没有相关商品，请重新选择</div>
        </div>
    </div>
</template>

<script>
import store from '../store'
export default {
    data(){
        return {
            start:0,
            count:8,
            pages:[],
        }
    },
    props:['pros']//拿到父元素获得的商品列表
    ,created(){
        // this.startHttp();
    },
    store,
    methods:{
        change(page){//页码跳转
            if(page>=1 && page<=this.pages.length){
                this.start=(page-1)*this.count;
                $(window).scrollTop(0);
            }
        },
        addCart(id){
            this.axios.get('http://www.localhost:3000/infos/pros',{
                params:{
                    pid:id
                }
            }).then(res=>{
                res.data[0].count=1;
                this.$store.commit('updateCart',res.data)
               
            })
        }   
    },
    watch:{
        pros(){
            //重置
            this.start=0;
            this.count=8;
            this.pages=[];
            let length=Math.ceil(this.pros.length/this.count);
            for(let i=0;i<length;i++){
                this.pages.push(i+1);
            }
        }
    }
}
</script>

<style scoped>
.products .title{
    color: #666666;
}
.products .price{
    color: #ff753a;
}
.products .pro{
    overflow: hidden;
}
.products .pro a:hover{
    color: #000;
}
.products .pro>li>a>img{
    transition: all 1s;
}
.products .pro>li>a>img:hover{
    transform: scale(1.1);
}

</style>
