//使用express构建web服务器 --11:25
const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
/*引入路由模块*/
const index=require("./routes/index.route");
const details=require("./routes/details.route");
const products=require("./routes/products.route");
const article=require("./routes/article.route");
const infos=require("./routes/infos.route");
var app = express();
var server = app.listen(3000);

//设置CORS跨域
app.use(cors({
	'origin':'*'
}))

//使用body-parser中间件
app.use(bodyParser.urlencoded({extended:false}));

//托管静态资源到public目录下
app.use(express.static('public'));
/*使用路由器来管理路由*/
app.use("/index",index);
app.use("/details",details);
app.use('/products',products);
app.use('/article',article);
app.use('/infos',infos);
