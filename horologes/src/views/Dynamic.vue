<template>
    <section class="dynamics bg-content common_section">
    <!--导航条-->
    <div class=" pb-2 d-none d-lg-block mb-3">
           <span class="breadcrumb-item">
                  <router-link to="/">首页</router-link>
           </span>
            <span class="breadcrumb-item">
                 <a href="javascript:;">商城动态</a>
            </span>
    </div>
    <div class="bg-white p-3 p-md-4 p-lg-5">
        <h5 class="mt-2"><i class="fa fa-list-ul mr-2" aria-hidden="true"></i>商城动态
            <span class="herder-title-news">/ NEWS</span>
        </h5>
        <div class="d-flex flex-column  menu">
            <span class="d-lg-none bg-dark" @click="toggle">
                {{menuTitle}}
                <i class="fa fa-sort-desc" aria-hidden="true"></i>
            </span>
            <div class=" d-lg-block position-absolute" :class="toggleClass">
                <div class="d-flex flex-column flex-lg-row ">
                    <button class="bg-dark mr-lg-2" @click="query('全部资讯')" 
                    :class="`${this.$route.params.did=='全部资讯'?'checked':''}`">全部资讯</button>
                    <button class="bg-dark mr-lg-2" @click="query('店铺动态')"
                    :class="`${this.$route.params.did=='店  铺动态'?'checked':''}`">店铺动态</button>
                    <button class="bg-dark mr-lg-2"
                    @click="query('店长博客')"
                    :class="`${this.$route.params.did=='店长博客'?'checked':''}`">店长博客</button>
                </div>
            </div>
            <!-- 动态列表 -->
            <ul class="list-unstyled  mt-md-4 mt-3 list">
                <li v-for="info of infos.slice(start,start+count)">
                    <div class="d-flex  flex-sm-row flex-column">
                        <div>
                            <router-link :to="`/article/${info.nid}`">
                                <img :src="`${info.img}`" class="img-fluid"/>
                            </router-link>
                        </div>
                        <div class="ml-lg-5 ml-md-4 ml-0 ml-sm-3 mt-3 mt-sm-0">
                            <router-link :to="`/article/${info.nid}`"
                            class="font-16 ">{{info.title}}</router-link>
                            <p class="font-12">发布日期：{{new Date(info.time) | getDate}} <span class="ml-2">分类：{{info.type}}</span> </p>
                        </div>
                    </div>
                </li>
            </ul>
            <!-- 分页 -->
            <ul class="pagination pagination-sm">
                <li class="page-item  mr-2" :class="`${parseInt(start/count)==0?'disabled':''}`" @click="change(parseInt(start/count))">
                    <a  class="page-link">上一页</a>
                </li>
                <li class="page-item" v-for="page of pages" :class="`${page==parseInt(start/count)+1?'active':''}`" @click="change(page)">
                    <a  class="page-link mr-2">{{page}}</a>
                </li>
                <li class="page-item" :class="`${parseInt(start/count)+1==pages.length?'disabled':''}`" @click="change(parseInt(start/count)+2)">
                    <a class="page-link">下一页</a>
                </li>
            </ul>
        </div>
    </div>
</section>

</template>

<script>
export default {
    data(){
        return{
            infos:[],
            start:0,//起始位置
            count:6,//显示数据条数
            pages:[],//页面
            menuTitle:'菜单',
            toggleClass:'d-none'
        }
    },
    created(){
        this.startHttp();
    },
    methods:{
        startHttp(){
            this.axios.get('http://localhost:3000/infos',{
                params:{
                    did:this.$route.params.did
                }
            }).then(result=>{
                this.infos=result.data;
                if(!this.infos.length){
                    //如果没有 就重新跳转到全部资讯这里
                    this.$router.push('/infos/全部资讯'); 
                }else{
                    this.start=0;
                    this.count=6;
                    this.pages=[];
                    let length=Math.ceil(this.infos.length/this.count);
                    for(let i=0;i<length;i++){
                        this.pages.push(i+1);
                    }
                }
            })
        },
        change(page){//页码跳转
            if(page>=1 && page<=this.pages.length){
                this.start=(page-1)*6;
            }
        },
        query(str){//查询
            this.$router.push(`/infos/${str}`);
            this.toggleClass='';
            this.toggle();
        },
        toggle(){//显示和隐藏菜单
            if(this.toggleClass.indexOf('d-none')!=-1){
                this.toggleClass=' animated fadeInUp';
                this.menuTitle='关闭';
            }else{
                this.toggleClass='animated fadeOutDown';
                setTimeout(()=>{
                    this.toggleClass+=' d-none';
                },500);
                this.menuTitle='菜单';
            }
        }
    },
    watch:{
        $route(){
            this.startHttp();
        },
        start(){
            $(window).scrollTop(0);
        }
    },
    filters:{
        getDate(val){
            let year = val.getFullYear();
            let month = val.getMonth()+1>=10?val.getMonth()+1:'0'+(val.getMonth()+1);
            let day = val.getDate()>=10?val.getDate():'0'+val.getDate();
            return year+'.'+month+'.'+day;
        },
    }
}
</script>


<style scoped>
.dynamics .menu>div{
    width: 100%;
    top: 43px;
}
.dynamics .menu{
    margin-top: 1.5rem;
    cursor: pointer;
    position: relative;
}
@media (min-width:992px) {
    .dynamics .menu>div{
        animation: none;
        position: relative !important;
        top: 0;
    }
}
.animated{
    animation-duration: 0.5s !important;
}
.dynamics .menu>span{
    padding: 0.6rem 0;
    color: #cccccc;
    text-align: center;
    font-size: 1rem;
    position: relative;
}
.dynamics .menu>span>.fa-sort-desc{
    position: absolute;
    font-size: 1rem;
    right: 1rem;
    top: 50%;
    margin-top: -0.8rem;
}
.dynamics .menu>span:hover,.dynamics .menu>div>div>button:hover,.checked{
    background-color: #1d2124 !important;
    color: white;
}
.dynamics .menu>div>div>button{
    outline: 0;
    border: 0;
    padding: 0.5rem 1.25rem;
    color: #cccccc;
    font-size: 13px;
    cursor: pointer;
}
.dynamics .list a{
    color: #333333;
    font-weight: 500;
}
.dynamics .list img{
    transition: all 1s;
    min-width: 102px;
 }
.dynamics .list img:hover{
    transform: scale(1.08);
}
.dynamics .list p{
     color: #bfbfbf;
    margin-top: 1rem;
    margin-bottom: 0 !important;
 }
.dynamics .list li{
    border-bottom: 1px solid #ededed;
    padding: 1rem 0;
}
.dynamics .list li a:hover{
    color:#58b123 !important;
}
</style>
