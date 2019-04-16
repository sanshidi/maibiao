<template>
    <div class="pro">
        <section class="products bg-content common_section">
            <router-view @add='startH'></router-view>
            <ProList :pros='pros'></ProList>
        </section>
    </div>
</template>


<script>
import ProList  from '../components/ProList.vue'
export default {
    data(){
        return{
            pros:[],
        }
    },
    components:{
        ProList,
    },
    created(){
        this.startH();
        this.$store.commit('changCount');
        this.$store.dispatch('changCount');
        // console.log(this.$store.state.cartList)
        // var obj = [
        //      {"name":"Tom","age":13},
        //      {"name":"Jack","age":14},
        //      {"name":"Mary","age":16},
        // ]
        // var objString = JSON.stringify(obj); //JSON 数据转化成字符串
        // $.cookie('myCookie',objString);
        // var myCookie = $.cookie('myCookie');
        // var newObject = JSON.parse(myCookie); //字符串转化成JSON数据
        // console.log(newObject);  
        // newObject[0].name='sd';
        // console.log(JSON.parse(myCookie));
    },
    methods:{
        startH(brand,classify,style,fun,water,start,end){
            
            let params;
            //当路由改变时 
            if(!this.isEmptyObject(this.$route.params)){
                if(this.$route.params.kword!==undefined){
                    params={kword:this.$route.params.kword}
                }else if(this.$route.params.brand!==undefined){
                    params={
                        brand:[this.$route.params.brand]
                    }
                }else if(this.$route.params.type!==undefined){
                    params={
                        classify:[this.$route.params.type]
                    }
                }
            }else{
                params={
                    brand,classify,style,fun,water,start,end
                }
            }
            console.log(params);
            this.axios.get('http://www.localhost:3000/products/',{
                params
            })
            .then(res=>{
                this.pros=res.data; 
                console.log(this.pros);   
            })
        },
        isEmptyObject(obj){//判断是否为空对象
            for(var key in obj){
                    return false
            };
            return true
        } 
    },
    watch:{
        $route(){
            this.startH();
        }
    },
}
</script>

<style>
@media (min-width: 768px) {
    .common_section{
        padding:2rem 1.5rem;
    }
}
@media (min-width:992px) {
    .common_section{
        padding: 2rem 2.5rem;
    }
}
.products li{
    cursor: pointer;
}
</style>
