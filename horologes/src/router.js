import Vue from 'vue'
import Router from 'vue-router'
import Home from './views/Home.vue'
import Index from './views/Index.vue'
import NotFound from './views/NotFound.vue' 


Vue.use(Router)

export default new Router({
  // linkActiveClass:'active',
  routes: [
    {
      path: '/',
      component: Home,
      children:[
        
        //主页面
        {path:'/',component:Index},
        {path:'/index',component:Index},
        
        //文章路由
        {path:'/article/:aid',component:()=>import('./views/Article.vue')},
        
        //商城动态
        {path:'/infos/:did',component:()=>import('./views/Dynamic.vue')},
        {path:'/infos',component:()=>import('./views/Dynamic.vue')},
        
        //关于店铺
        {path:'/about',component: () => import(/* webpackChunkName: "about" */ './views/About.vue')},
        
        //线下门店
        {path:'/underLine',component: () => import( './views/UnderLine.vue')},
        
        //商品展示
        {path:'/products',component:()=>import('./views/Goods.vue'),children:[
          {path:'/',component:()=>import('./views/products/search.vue')},

          {path:'/products/kword/:kword',name:'kwrod',component:()=>import('./views/products/Kword.vue')},

          {path:'/products/brand',component:()=>import('./views/products/Kword.vue')},
          {path:'/products/brand/:brand',component:()=>import('./views/products/Kword.vue')},

          {path:'/products/type',component:()=>import('./views/products/Kword.vue')},
          {path:'/products/type/:type',component:()=>import('./views/products/Kword.vue')},
        ]}
      ]
    },
    {
      path:'/*',
      name:'notFound ',
      component:NotFound 
    }
  ]
})
