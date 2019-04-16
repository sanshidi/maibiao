<template>
<div>
     <div class=" d-flex flex-column flex-md-row pt-3 pt-md-0 pl-3 pl-md-0 justify-content-between">
        <!--品牌-->
        <div>
                <span class="font-16 ">品牌</span>
                <ul class="fa-ul ml-0 mt-2" @click="check($event,1)">
                   <li><i class=" fa fa-square-o mr-2"></i>卡西欧（CASIO）</li>
                   <li><i class=" fa fa-square-o mr-2"></i>天梭（TISSOT）</li>
                   <li><i class=" fa fa-square-o mr-2"></i>天王（TIAN WANG）</li>
                   <li><i class=" fa fa-square-o mr-2"></i>罗西尼（ROSSINI）</li>
                   <li><i class=" fa fa-square-o mr-2"></i>阿玛尼（ARMANI）</li>
                   <li><i class=" fa fa-square-o mr-2"></i>齐博林（Zeppelin）</li>
                </ul>
          </div>
        <!--分类-->
        <div>
            <span class="font-16 ">分类</span>
            <ul class="fa-ul ml-0  mt-2" @click="check($event,2)">
                <li><i class=" fa fa-square-o mr-2"></i>女士机械表</li>
                <li><i class=" fa fa-square-o mr-2"></i>女士石英表</li>
                <li><i class=" fa fa-square-o mr-2"></i>男士机械表</li>
                <li><i class=" fa fa-square-o mr-2"></i>男士石英表</li>
            </ul>
          </div>
        <!--风格-->
        <div class="col-12 col-md-2 p-0 mt-3 mt-md-0">
            <span class="font-16 ">风格</span>
            <ul class="list-unstyled ml-0  mt-2  type1 type" 
            @click="select($event,1)">
                <li>休闲</li>
                <li>可爱</li>
                <li>商务</li>
                <li>复古</li>
                <li>时尚</li>
                <li>极简</li>
                <li>运动</li>
            </ul>
        </div>
        <!--功能-->
        <div class="col-12 col-md-2 p-0 mt-3 mt-md-0">
            <span class="font-16 ">功能</span>
            <ul class="list-unstyled ml-0  mt-2 type2 type" @click="select($event,2)">
                <li>双时区</li>
                <li>年历</li>
                <li>日期显示</li>
                <li>星期显示</li>
                <li>月份显示</li>
            </ul>
        </div>
        <!--防水-->
        <div class="col-12 col-md-2 p-0 mt-3 mt-md-0">
            <span class="font-16 ">防水</span>
            <ul class="list-unstyled ml-0  mt-2 type3 type" @click="select($event,3)">
                <li>30M</li>
                <li>50M</li>
                <li>100M</li>
                <li>200M</li>
                <li>500M</li>
                <li>500M以上</li>
            </ul>
        </div>
        <!--价格-->
        <div class=" col-11 col-md-2 p-0 mt-3 mt-md-0">
            <span class="font-16 ">价格</span>
            <div class="w-100 slider-div mt-3 mb-3">
                <table></table>
                <div class="slider-ranger" @click="rangeClick($event)">
                </div>
                <span class="slider" @mousedown.prevent="mousedown($event)"></span>
                <div id="maskBefore"></div>
                <span class="slider" @mousedown.prevent="mousedown($event)"></span>
                <div id="maskAfter"></div>
            </div>
            <p>价格：¥<span id="start">{{start}}</span> - ¥<span id="end">{{end}}</span></p>
        </div>
    </div>
    <div  class="pl-3 pl-md-0  mb-0 mb-md-4"  >
        <button class="btn-dark border-0 " @click="submit">提 交</button>
    </div>
</div>
</template>

<script>
export default {
    data(){
        return{
            brand:[],
            classify:[],
            style:[],
            fun:[],
            water:[],
            start:0,
            end:52800,
            max:52800,
            needMove:false,
            cur:'',
            last:0,
        }
    },
    created(){
        $(window).on('mousemove',this.mousemove)
        .on('mouseup',this.mouserup)
    },
    methods:{
        submit(){
            this.$emit('add',this.brand,this.classify,this.style,this.fun,this.water,this.start,this.end);
        },
        check(e,i){
            let target=e.target;
            let parent = target.parentNode;
            if(parent.nodeName=='LI'){
                target=parent;
            }
            if(target.nodeName=='LI'){
                $(target).toggleClass('checked').children('i').toggleClass('fa-square-o fa-check-square-o');
                if(i==1){
                    if($(target).hasClass('checked')){
                        this.brand.push($(target).text());
                    }else{
                        this.brand.splice(this.brand.indexOf($(target).text()),1);
                    }
                }else{
                    if($(target).hasClass('checked')){
                        this.classify.push($(target).text());
                    }else{
                        this.classify.splice(this.classify.indexOf($(target).text()),1);
                    }
                }
            }
        },
        select(e,i){
            let target=e.target;
            if(target.nodeName=='LI'){
                $(target).toggleClass('selected');
                if(i==1){
                    if($(target).hasClass('selected')){
                        this.style.push($(target).text());
                    }else{
                        this.style.splice(this.brand.indexOf($(target).text()),1);
                    }
                }else if(i==2){
                    if($(target).hasClass('selected')){
                        this.fun.push($(target).text());
                    }else{
                        this.fun.splice(this.fun.indexOf($(target).text()),1);
                    }
                }else{
                    if($(target).hasClass('selected')){
                        this.water.push($(target).text());
                    }else{
                        this.water.splice(this.water.indexOf($(target).text()),1);
                    }
                }
            }
        },
        mousemove(e){
            if(this.needMove) {
                this.move(e);
            }
        },
        mouserup(){
            this.needMove=false;
            $(this.cur).css({backgroundColor:''});
        },
        mousedown(e){
            this.needMove=true;
            this.last = e.clientX;
            $(e.target).css({backgroundColor:'#9d2929'});
            this.cur= e.target;
        },
        move(e){
            let $slider1 = $('.products .slider').eq(0);
            let $slider2 = $('.products .slider').eq(1);
            let width = parseFloat($('.products .slider-ranger').css('width'));

            //当前距离左边的left值
            let left=parseFloat($(this.cur).css('left'))+e.clientX-this.last;
            this.last = e.clientX;

            //当滚动的是第一个滚动slider时
            if($slider1[0]==this.cur){
                if(left<0){
                    left=0
                }
                if(left>=parseFloat($slider2.css('left'))){
                    left=parseFloat($slider2.css('left'));
               
                    $slider1.css({zIndex:parseInt($slider2.css('zIndex'))+1});
                }
                }else{//当滚动的是第二个滚动slider时
                    if(left>width){
                        left=width;
                    }
                    if(left<=parseFloat($slider1.css('left'))){
                        left=parseFloat($slider1.css('left'));
                        $slider2.css({zIndex:parseInt($slider1.css('zIndex'))+1});
                    }
                }
                left=(left/width*100);
                this.cur.style.left=left+'%';
                if(this.cur==$slider1[0]){
                    $('#maskBefore').css({width:parseFloat(left)+0.5+'%'});
                    this.start=parseInt(this.max*left/100);
                }else{
                    $('#maskAfter').css({width:100-parseFloat(left)+'%'})
                    this.end=parseInt(this.max*left/100);
                }
        },
        rangeClick(e){
            let $slider1 = $('.slider').eq(0);
            let $slider2 = $('.slider').eq(1);
            console.log($slider1[0].offsetLeft,$slider2[0].offsetLeft, e.offsetX);

            let left=(e.offsetX/$slider1[0].parentNode.clientWidth*100);

            if(e.offsetX-$slider1[0].offsetLeft<$slider2[0].offsetLeft- e.offsetX){
                $slider1.css({left:left+'%'});
                $('#maskBefore').css({width:parseFloat(left)+0.5+'%'});
                this.start=parseInt(this.max*left/100);
            }else{
                $slider2.css({left:left+'%'});
                $('#maskAfter').css({width:100-parseFloat(left)+'%'})
            
                this.end=parseInt(this.max*parseFloat(left)/100);

            }
        }

    },
    destroyed(){
        $(window).off('mousemove',this.mousemove)
        .off('mouseup',this.mouserup);
    }
}
</script>

<style scoped>
.products .slider-ranger{
    height: 6px;
    margin-top: 6px;
    background-color: black;
    border-radius: 5px;
    position: relative;
}
#maskBefore,#maskAfter{
    position: absolute;
    height: 6px;
    width: 0;
    background-color: #ededed;
    z-index: 2;
    top: 6px;
}

#maskBefore{
    left: 0;
}
#maskAfter{
    right: 0;
}
.products .slider-div{
    position: relative;
    height: 18px;
    margin-right: 18px;
}
.products .slider-div>.slider{
    position: absolute;
    width: 18px;
    height: 18px;
    border-radius: 50%;
    background-color: #cccccc;
    top: 0;
    z-index: 3;
    cursor: pointer;
}
.products .slider-div>.slider:nth-of-type(1){
    left: 0%;
}
.products .slider-div>.slider:nth-of-type(2){
    left: 100%;
}
.products>div:first-child{
    font-size: 13px;
    color: #333333;
    padding-right: 18px;
}
.products .fa-ul>li:hover{
    color: #000000;
}
.products .type>li{
    padding: 5px 0.5rem;
    text-align: center;
    border: 1px solid #cccccc;
    margin:0.2rem 0.4rem 0.2rem 0;
    float: left;
}
.products .type>li:hover,.products .selected{
    border-color:salmon  !important;
    color: #000000;
}
.products .checked{
    color: #000000;
}

</style>
