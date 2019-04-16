<template>
    <div class=" pb-2 d-none d-md-block mb-3">
        <span class="breadcrumb-item">
                <a href="/">首页</a>
        </span>
        <span class="breadcrumb-item">
            <router-link :to="link">{{type}}</router-link>
        </span>
        <span class="breadcrumb-item" v-if="value!=undefined">
            <a href="javascript:;">{{value}}</a>
        </span>
    </div>
</template>

<script>
export default {
    data(){
        return{
            type:'',
            value:'',
            link:'',
        }
    },
    methods:{
        check(params,path){
        
            if(path.indexOf('products/kword')!=-1){
                this.type='关键字';
                this.value=params.kword;
                this.link='';
            }else if(path.indexOf('products/brand')!=-1){
                this.type='品牌';
                this.value=params.brand;
                this.link='/products/brand';
            }else if(path.indexOf('products/type')!=-1){
                this.type='分类';
                this.value=params.type;
                this.link='/products/type';
            }
        }
    },
    created(){
        this.check(this.$route.params,this.$route.path);
    },
    watch:{
        $route(){
            this.type='',
            this.value='',
            this.link='',
            this.check(this.$route.params,this.$route.path);
        }
    }
}
</script>