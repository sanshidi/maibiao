import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import axios from 'axios';

Vue.config.productionTip = false
Vue.prototype.axios=axios; //将axios对象放入到vue的原型对象中

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
