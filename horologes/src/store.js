import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)
export default new Vuex.Store({
  state: {
    count:0,
    cartList:(function(){
      console.log('----');
      return ($.cookie('myCookie')==undefined | $.cookie('myCookie')=='null')?[]:JSON.parse($.cookie('myCookie'));
    })()
      
  },
  mutations: {
    changCount(state){
      state.count++;
    },
    //添加或者修改购物车
    updateCart(state,obj){
        let a=false;
        for (const item of state.cartList) {
           if(item.pid==obj[0].pid){
              item.count=obj[0].count+item.count;
              a=true;
           }
        }
        if(!a){
          state.cartList.push(obj[0]);
        }
        var objString = JSON.stringify(state.cartList); //JSON 数据转化成字符串
        $.cookie('myCookie',objString);
    },
    //删除购物车中的某一项
    delCart(state,pid){
      console.log(state.cartList);
      for(let i=0;i<state.cartList.length;i++){
        if(state.cartList[i].pid==pid){
          state.cartList.splice(i,1);
        }
      }
      console.log(state.cartList);
      var objString = JSON.stringify(state.cartList); //JSON 数据转化成字符串
      $.cookie('myCookie',objString);
    }
  },
  actions: {
    changCount(context,obj){
      context.commit('changCount',obj)
    },
    delCart(context,pid){
      console.log('==')
      context.commit('delCart',pid)
    }
  }
})
