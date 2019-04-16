<template>
    <div>
        <Lunbo></Lunbo>
        <Inline></Inline>
        <News></News>
        <Product></Product>
        <Info></Info>
    </div>
</template>

<script>
import Lunbo from './index/Lunbo.vue'
import Inline from './index/Inline.vue'
import News from './index/News.vue'
import Product from './index/Product.vue'
import Info from './index/Info.vue'

export default {
    components:{
        Lunbo,
        Inline,
        News,
        Product,
        Info
    }
}
</script>


