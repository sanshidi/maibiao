function hide(e){
    let side=document.getElementsByClassName('side')[0];
    let search = document.getElementsByClassName('search-box')[0];
    let mask = document.getElementsByClassName('my-mask')[0];
    side.style.left='-15rem';
    mask.style.visibility='hidden';
    mask.style.opacity=0;
    search.classList.add('d-none');
}
function show(str){
    let div;
    if(str=='search'){
        div=document.getElementsByClassName('search-box')[0];
        div.classList.remove('d-none');
    }else{
        div=document.getElementsByClassName('side')[0];
        div.style.left=0;
    }
    let mask = document.getElementsByClassName('my-mask')[0];

    mask.style.visibility='visible';
    mask.style.opacity=0.3;
}
window.onload=function(){
    let closes = document.getElementsByClassName('close');
    if(closes.length>0){
        noShop.style.display='none';
        shopCar.style.display='block';
    }
    for(let close of closes){
        close.onclick=function(){
            setTimeout(()=>{
                this.parentNode.remove();
                if(closes.length==0){
                    noShop.style.display='block';
                    shopCar.style.display='none';
                }
            },500);
            this.parentNode.style.opacity=0;
        }
    }
}