<template>
    <section class="article" v-cloak>
    
        <!--导航条-->
    
        <transition enter-active-class="animated bounceInDown">   
            <div class="bg-white mb-3 p-3 pb-2  pl-lg-4" v-show="show">
    
                <span class="breadcrumb-item">
    
                        <router-link to="/index">首页</router-link>
    
                </span>
    
                <span class="breadcrumb-item">
    
                        <router-link to="/infos">全部资讯</router-link>
    
                    </span>
    
                <span class="breadcrumb-item">
    
                        <a href="javascript:;">{{cur.title}}</a>
    
                    </span>
    
            </div>
    
        </transition>
    
        <!--主体内容-->
    
        <div class="d-flex flex-column flex-lg-row">
    
            <transition enter-active-class="animated bounceInLeft">
    
                <div class="col-12 col-lg-8  p-0" v-show="show">
    
                    <div class="mr-lg-4 bg-white p-3 p-lg-4 ">
    
    
    
                        <h5>{{cur.title}}</h5>
    
                        <!--发布日期分享-->
    
                        <div class="d-flex align-items-center info flex-column flex-lg-row ">
    
                            <span class="w-100">发布日期：{{new Date(cur.time) | getDate}} {{new Date(cur.time) | getTime}}</span>
    
                            <div class="d-flex share w-100 mt-2 m-lg-0">
    
                                <span>分享到：</span>
    
                                <a href="javascript:;"><i class="fa fa-weixin align-middle" aria-hidden="true"></i></a>
    
                                <a href="javascript:;"><i class="fa fa-weibo" aria-hidden="true"></i></a>
    
                                <a href="javascript:;">豆</a>
    
                                <a href="javascript:;"><i class="fa fa-facebook" aria-hidden="true"></i></a>
    
                                <a href="javascript:;"><i class="fa fa-twitter" aria-hidden="true"></i></a>
    
                                <a href="javascript:;"><i class="fa fa-linkedin" aria-hidden="true"></i></a>
    
                            </div>
    
                        </div>
    
                        <!--内容中心-->
    
                        <div class="content" v-html="cur.content">
    
                        </div>
    
                        <!--上下篇-->
    
                        <div class="mt-4 pb-3">
    
                            <a href="javascript:;" v-if="prev===undefined">
    
                                    上一篇<span class="ml-3">没有了</span>
    
                                </a>
    
                            <router-link :to="`/article/${prev.nid}`" v-else>上一篇<span class="ml-3" v-html="prev.title"></span></router-link><br/>
    
    
    
                            <a href="javascript:;" v-if="next===undefined">
    
                                    下一篇<span class="ml-3">没有了</span>
    
                                </a>
    
                            <router-link :to="`/article/${next.nid}`" v-else>下一篇<span class="ml-3" v-html="next.title"></span></router-link>
    
                        </div>
    
                    </div>
    
                </div>
    
            </transition>
    
    
    
            <transition enter-active-class="animated bounceInRight">
    
                <aside class="col-12 col-lg-4  bg-white p-0   mb-4" v-show="show">
    
                    <div class="bg-white p-3 p-lg-4 ">
    
                        <a href="javascript:;" class="more">阅读更多文章</a>
    
                        <ul class="list-unstyled mt-3">
    
                            <li v-for="info of infos">
    
                                <div>
    
                                    <router-link :to="`/article/${info.nid}`">{{info.title}}</router-link>
    
                                    <p class="font-12 mb-0 mt-2">发布日期： {{new Date(info.time) | getDate}}</p>
    
                                </div>
    
                            </li>
    
                        </ul>
    
                    </div>
    
                </aside>
    
            </transition>
    
    
    
        </div>
    
    </section>
</template>
<script>
    export default {
    
        data() {
    
            return {
    
                next: {},
    
                prev: {},
    
                cur: {},
    
                infos: [],
    
                show:false
    
            }
    
        },
    
        created() { //数据加载完成后
    
            this.strartReq();
    
        },
    
        methods: {
    
            strartReq() {

    
                this.axios.get('http://localhost:3000/article', {
    
                    params: {
    
                        aid: this.$route.params.aid
    
                    }
    
                }).then(result => {
    
                    this.cur = JSON.parse(result.data.current)[0];
    
                    this.prev = JSON.parse(result.data.prev)[0];
    
                    this.next = JSON.parse(result.data.next)[0];
    
                    if (this.cur === undefined) {
    
                        //当没有当前文章则跳转到404..
    
                        this.$router.push('/notFound');
    
                    }
    
                })
    
                //获取右侧文章
    
                this.axios.get('http://localhost:3000/article/all').then(result => {
    
                    this.infos = result.data;
    
                })
    
            }
    
        },
    
        filters: {
    
            getDate(val) {
    
                let year = val.getFullYear();
    
                let month = val.getMonth() + 1 >= 10 ? val.getMonth() + 1 : '0' + (val.getMonth() + 1);
    
                let day = val.getDate() >= 10 ? val.getDate() : '0' + val.getDate();
    
                return year + '-' + month + '-' + day;
    
            },
    
            getTime(val) {
    
                let hour = val.getHours() >= 10 ? val.getHours() : '0' + val.getHours();
    
                let minu = val.getMinutes() >= 10 ? val.getMinutes() + 1 : '0' + val.getMinutes();
    
                return hour + ':' + minu;
    
            }
    
        },
    
        watch: {
            $route() {
                this.strartReq();
                this.show=false;
            }
    
        }, 
        mounted() {
            this.show=true;
        },
        updated(){
            this.$nextTick(()=>
            {
                this.show=true;
            })
        }    
    }
</script>

<style scoped>
    [v-clock] {
        display: none !important;
    }
    
    
    
    .article .breadcrumb-item+.breadcrumb-item::before {
    
        content: '/';
    
    }
    
    
    
    .article {
    
        background-color: #ededed;
    
        font-size: 14px;
    
        color: #666666;
    
        font-family: "微软雅黑", Helvetica, Arial, Verdana, sans-serif;
    
        padding: 2rem 0;
    
        text-align: left;
    
    }
    
    
    
    .article h5 {
    
        color: #494949;
    
        padding: 1rem 0;
    
        font-size: 18px;
    
        ;
    
        font-weight: 400;
    
        transition: all 0.5s;
    
    }
    
    
    
    .article .info {
    
        border-bottom: 1px solid #eeeeee;
    
        border-top: 1px solid #eeeeee;
    
        padding: 0.6rem 0;
    
    }
    
    
    
    .article .share a {
    
        width: 18px;
    
        height: 18px;
    
        border-radius: 50%;
    
        font-size: 10px;
    
        display: flex;
    
        justify-content: center;
    
        align-items: center;
    
        transition: all 0.6s;
    
        margin: 0 0.2rem;
    
        border: 1px solid;
    
    }
    
    
    
    .share a:nth-of-type(1),
    
    .share a:nth-of-type(3) {
    
        border-color: #7bc549;
    
        color: #7bc549;
    
    }
    
    
    
    .share a:nth-of-type(1):hover,
    
    .share a:nth-of-type(3):hover {
    
        color: white;
    
        background: #7bc549;
    
    }
    
    
    
    .share a:nth-of-type(2) {
    
        color: #ff763b;
    
        border-color: #ff763b;
    
    }
    
    
    
    .share a:nth-of-type(2):hover {
    
        color: white;
    
        background: #ff763b;
    
    }
    
    
    
    .share a:nth-of-type(4) {
    
        color: #44619D;
    
        border-color: #44619D;
    
    }
    
    
    
    .share a:nth-of-type(4):hover {
    
        color: white;
    
        background: #44619D;
    
    }
    
    
    
    .share a:nth-of-type(5) {
    
        color: #55acee;
    
        border-color: #55acee;
    
    }
    
    
    
    .share a:nth-of-type(5):hover {
    
        color: white;
    
        background: #55acee;
    
    }
    
    
    
    .share a:nth-of-type(6) {
    
        color: #0077B5;
    
        border-color: #0077B5;
    
    }
    
    
    
    .share a:nth-of-type(6):hover {
    
        color: white;
    
        background: #0077B5;
    
    }
    
    
    
    @media (min-width: 768px) {
    
        .article {
    
            padding: 2rem 3rem;
    
        }
    
        .article h5 {
    
            font-size: 22px;
    
        }
    
    }
    
    
    
    @media (min-width:992px) {
    
        .article {
    
            padding: 2rem 2.5rem;
    
        }
    
    }
    
    
    
    .article .breadcrumb-item>a {
    
        color: #666;
    
    }
    
    
    
    .article .breadcrumb-item>a:hover {
    
        color: black;
    
    }
    
    
    
    .article .content {
    
        padding: 2.5rem 0;
    
        border-bottom: 1px solid #eeeeee;
    
    }
    
    
    
    .article .more {
    
        padding: 0.5rem 0;
    
        width: 100%;
    
        color: #888888;
    
        text-align: center;
    
        border: 1px solid #eeeeee;
    
        transition: all 0.6s;
    
        display: block;
    
        margin-top: 1rem;
    
    }
    
    
    
    .article .more:hover {
    
        color: #dc8c13;
    
        border-color: #dc8c13;
    
    }
    
    
    
    .article aside li {
    
        border-bottom: 1px solid #eee;
    
        padding: 0.5rem 0;
    
    }
    
    
    
    .article aside li a {
    
        color: #888888;
    
    }
    
    
    
    .article aside li p {
    
        color: #c4c4c4;
    
    }
    
    
    
    .article aside li>div {
    
        transition: all 0.6s;
    
    }
    
    
    
    .article aside li:hover div {
    
        transform: translateX(15px);
    
    }
    
    
    
    .article aside li:hover a {
    
        color: black;
    
    }
    
    
    
    .article .content {
    
        font-family: '微软雅黑' !important;
    
    }
    
    
    
    .article .content p {
    
        text-indent: 28px;
    
    }
</style>
