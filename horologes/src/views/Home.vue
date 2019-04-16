<template>
  <div class="home">
    <Herder></Herder>
    <router-view></router-view>
    <Footer></Footer>
  </div>
</template>

<script>
// @ is an alias to /src
import Herder from '@/components/Header.vue';
import Footer from '../components/Footer.vue'
export default {
  components: {Herder,Footer},
  watch:{
   '$route':function(to,from){
     $('html').scrollTop(0);
     $('body').scrollTop(0);
   }
  }
}
</script>
