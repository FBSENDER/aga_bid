require 'spec_helper'
bid_generate = AgaBid::BidJobGenerate.new("qihu","hotel")
mdata="7天连锁酒店预订,1,20
7酒店官网,1,20
elong.com,1,20
e家宾馆,1,20
yilong,1,20
七天连锁酒店预订,1,20
万家连锁酒店,1,20
三亚湾酒店,1,20
三亚蓝海银滩酒店,1,20
三亚锦江之星酒店,1,20
三明实惠宾馆,1,20
三明宾馆,1,20
三清山国际度假酒店,1,20
三清山酒店预订,1,20
三门峡快捷酒店,1,20
上海7天连锁酒店,1,20
上海世博酒店,1,20
上海住宿,1,20
上海吴中路周边酒店,1,20
上海嘉定新城附近宾馆,1,20
上海大华三路宾馆,1,20
上海如家,1,20
上海如家快捷酒店,1,20
上海如家快捷酒店预订,1,20
上海如家酒店预订电话,1,20
上海宾馆,1,20
上海宾馆预订,1,20
上海岳阳医院附近酒店,1,20
上海布丁旅馆,1,20
上海延复招待所,1,20
上海打浦桥附近住宿,1,20
上海打浦桥附近的宾馆,1,20
上海明捷万丽酒店,1,20
上海汉庭酒店预订,1,20
上海瑞泰静安酒店,1,20
上海航友宾馆,1,20
上海虹桥嘉廷酒店,1,20
上海虹桥宾馆官网,1,20
上海速8酒店,1,20
上海酒店,1,20
上海酒店官网,1,20
上海酒店预定,1,20
上海锦佳饭店,1,20
上海附近宾馆,1,20
上海青旅,1,20
上饶7天连锁酒店,1,20
东二环酒店,1,20
东山宾馆_to_24,1,20
东海酒店,1,20
东港酒店,1,20
东莞东火车站附近酒店,1,20
东莞宾馆,1,20
东莞市住宿,1,20
东营职业学院住宿,1,20
东营职业学院附近酒店,1,20
中医院附近宾馆,1,20
中卫附近酒店,1,20
中国政法大学附近宾馆,1,20
中山喜来登酒店,1,20
中山富华酒店,1,20
中山市东区酒店,1,20
中山市人民医院附近酒店,1,20
中山张家边宾馆,1,20
中山酒店,1,20
临沂技师学院附近旅馆,1,20
临沂旅馆,1,20
临沂附近酒店,1,20
临潼旅馆预订,1,20
丹东7天连锁酒店,1,20
丹东市酒店订房,1,20
丹东旅店,1,20
丹江口市连锁酒店,1,20
丽君酒店,1,20
丽江旅社,1,20
义乌乐尚豪华酒店,1,20
义乌小商品批发市场酒店,1,20
义乌小商品批发市场附近酒店,1,20
乌镇住哪里比较好,1,20
乌镇住宿,1,20
乌镇客房预订,1,20
乌镇旅店,1,20
乌鲁木齐市招待所,1,20
乐山住宿,1,20
乐山旅馆,1,20
乐清旅馆,1,20
九寨沟住宿,1,20
九江旅店,1,20
九江旅游住宿,1,20
乳山酒店,1,20
云台山住宿,1,20
云城区酒店,1,20
五台山云龙酒店,1,20
五台山住宿,1,20
五台山住宿攻略,1,20
五台山青年旅馆,1,20
五指山住宿,1,20
五莲酒店预订,1,20
井冈山旅馆,1,20
亚奥国际,1,20
仁寿附近酒店,1,20
介休火车站附近宾馆,1,20
介休火车站附近酒店,1,20
从化温泉酒店,1,20
仙桃订房,1,20
伊春市宾馆预订,1,20
住宿乌镇,1,20
住宿查询,1,20
住宿白洋淀,1,20
住宿网站,1,20
住宿蔚县,1,20
住宿阿尔山,1,20
住宿预订,1,20
余姚如家酒店,1,20
余姚火车站附近酒店,1,20
佛山如家酒店预订,1,20
佳木斯7天连锁酒店,1,20
保定军校广场附近住宿,1,20
保定宾馆,1,20
保定旅馆,1,20
保定酒店,1,20
保定酒店预订,1,20
信阳有哪些快捷酒店,1,20
信阳预订酒店,1,20
免费订酒店,1,20
入住酒店,1,20
公寓酒店,1,20
六盘水大酒店,1,20
兰州住宿攻略,1,20
兰州汉庭酒店预订,1,20
兰州酒店预订,1,20
兴城宏盛家庭宾馆,1,20
内江宾馆,1,20
凤凰古城住宿,1,20
凤城旅店,1,20
凯里酒店预订,1,20
包头宾馆,1,20
包头酒店,1,20
包头酒店预订,1,20
北京7天连锁酒店价格,1,20
北京世纪金源大饭店,1,20
北京东长安饭店,1,20
北京中央民族大学附属中学附近宾馆,1,20
北京住宿,1,20
北京住宿哪里便宜,1,20
北京住宿预订,1,20
北京佑安医院附近住宿,1,20
北京便宜的快捷酒店,1,20
北京便宜的旅馆,1,20
北京便宜酒店,1,20
北京凯盛兴丰国际酒店,1,20
北京前门大栅栏附近住宿,1,20
北京君悦,1,20
北京唐府酒店,1,20
北京图书馆附近宾馆,1,20
北京地铁2号线附近酒店,1,20
北京外交部宾馆,1,20
北京大钟寺附近住宿,1,20
北京如家快捷酒店官网,1,20
北京如家酒店,1,20
北京如家酒店价格,1,20
北京宝钞宾馆,1,20
北京宾馆预订,1,20
北京市酒店,1,20
北京广源大厦附近的宾馆,1,20
北京广电国际酒店,1,20
北京快捷酒店,1,20
北京快捷酒店官网,1,20
北京快捷酒店预订,1,20
北京招待所,1,20
北京文苑宾馆,1,20
北京新街口地铁站宾馆,1,20
北京旅社,1,20
北京旅馆,1,20
北京旅馆预订,1,20
北京日坛宾馆,1,20
北京朝阳医院周边宾馆,1,20
北京朝阳医院附近住宿,1,20
北京朝阳医院附近宾馆,1,20
北京朝阳医院附近酒店,1,20
北京朝阳大悦城附近酒店,1,20
北京欣燕都,1,20
北京法国文化中心附近酒店,1,20
北京火车站宾馆,1,20
北京火车站附近住宿,1,20
北京火车站附近宾馆,1,20
北京的酒店,1,20
北京石佛营周边宾馆,1,20
北京自由行时尚酒店,1,20
北京西单饭店,1,20
北京西坝河酒店,1,20
北京速8连锁酒店,1,20
北京速8酒店,1,20
北京酒店,1,20
北京酒店式公寓,1,20
北京酒店预定,1,20
北京酒店预订,1,20
北京酒店预订网,1,20
北京银河宾馆,1,20
北京青年酒店,1,20
北京预订酒店,1,20
北京首都机场朗豪酒店,1,20
北京鼓楼中医医院附近酒店,1,20
北京龙庆峡周边宾馆,1,20
北戴河 酒店,1,20
北戴河住宿,1,20
北戴河刘庄宾馆,1,20
北戴河刘庄附近的酒店,1,20
北戴河单庄住宿,1,20
北戴河家庭旅馆网,1,20
北戴河订酒店,1,20
北方朗悦酒店,1,20
北方金融大厦酒店,1,20
北海住宿攻略,1,20
北海便宜酒店,1,20
北海公寓酒店,1,20
北海旅店,1,20
北海酒店,1,20
北海酒店有哪些,1,20
北航附中附近宾馆,1,20
十堰宾馆,1,20
十堰市住宿,1,20
十堰附近酒店,1,20
千山宾馆,1,20
千岛湖希尔顿,1,20
华南理工大学城校区 住宿,1,20
华南理工大学城校区住宿,1,20
华南理工大学城校区酒店,1,20
华南理工大学城校区附近住宿,1,20
华山艺龙,1,20
华庭酒店,1,20
华强酒店,1,20
南京市宾馆,1,20
南京正德学院附近宾馆,1,20
南京酒店,1,20
南京酒店预订,1,20
南京附近酒店,1,20
南充市连锁酒店,1,20
南充订房网,1,20
南充酒店预订,1,20
南平宾馆,1,20
南平市区酒店,1,20
南平市快捷酒店,1,20
南戴河住宿,1,20
南戴河宾馆,1,20
南昌住宿,1,20
南昌商务酒店,1,20
南昌国贸酒店,1,20
南昌宾馆预订,1,20
南昌市酒店,1,20
南昌旅馆,1,20
南昌洪城客运站附近酒店,1,20
南昌订旅馆,1,20
南昌适合情侣的酒店,1,20
南昌酒店官网,1,20
南昌青旅,1,20
南阳宾馆预订,1,20
南靖客栈,1,20
即墨 酒店预订,1,20
即墨住宿,1,20
即墨订房,1,20
厦门 定酒店,1,20
厦门7天酒店,1,20
厦门住宿,1,20
厦门客栈,1,20
厦门市中心酒店,1,20
厦门情人旅馆,1,20
厦门汉庭酒店预订,1,20
厦门眼科医院附近住宿,1,20
厦门酒店,1,20
厦门酒店预订,1,20
厦门锦江之星酒店,1,20
去凤凰住哪里好,1,20
去哪儿网,1,20
去承德住哪好,1,20
古交附近酒店,1,20
合肥五中附近宾馆,1,20
合肥六安路小学附近宾馆,1,20
合肥六安路小学附近的宾馆,1,20
合肥工业大学屯溪路校区宾馆,1,20
合肥新八中附近酒店,1,20
合肥格林豪泰连锁酒店,1,20
合肥步行街宾馆预订,1,20
合肥清溪路宾馆,1,20
合肥金融学校附近宾馆,1,20
合肥金融学校附近酒店,1,20
吉林市快捷酒店,1,20
吉林市旅店,1,20
吉泰连锁酒店,1,20
同城网酒店预订,1,20
同城酒店预订,1,20
同程网酒店预订,1,20
吕梁招待所,1,20
周庄住宿,1,20
周庄青年旅舍,1,20
周庄青旅,1,20
周边酒店,1,20
咸宁酒店推荐,1,20
咸阳国贸大酒店,1,20
哈尔滨7天连锁酒店,1,20
哈尔滨乐松附近宾馆,1,20
哈尔滨凤凰大酒店,1,20
哈尔滨定房,1,20
哈尔滨宾馆,1,20
哈尔滨宾馆酒店,1,20
哈尔滨宾馆预定,1,20
哈尔滨宾馆预订,1,20
哈尔滨市宾馆,1,20
哈尔滨旅店预定,1,20
哈尔滨特价宾馆,1,20
唐山市快捷酒店,1,20
唐山旅店,1,20
唐山爱时特套房酒店,1,20
唐山附近酒店,1,20
嘉兴宾馆预订,1,20
嘉峪关住宿,1,20
嘉峪关旅馆,1,20
四川宾馆,1,20
四平附近宾馆,1,20
垫江酒店,1,20
增城宾馆,1,20
大丰新词大酒店,1,20
大冶快捷酒店,1,20
大同酒店预订,1,20
大岭山镇旅馆,1,20
大庆宾馆预订,1,20
大理宾馆预订,1,20
大理青年旅店,1,20
大连住宿推荐,1,20
大连外国语大学附近宾馆,1,20
大连如家快捷酒店,1,20
大连家庭旅店,1,20
大连宾馆,1,20
大连宾馆预订,1,20
大连市区酒店,1,20
大连旅游住宿攻略,1,20
大连汉庭连锁酒店,1,20
大连瓦房店住宿,1,20
大连的凯宾斯基酒店,1,20
大连酒店,1,20
大连酒店公寓,1,20
大连酒店艺龙,1,20
大连酒店预订,1,20
大连金元大酒店,1,20
大连青年旅舍,1,20
天水宾馆,1,20
天水市旅游住哪里好,1,20
天水度假村,1,20
天津 旅馆,1,20
天津主题酒店,1,20
天津住宿,1,20
天津宾馆酒店,1,20
天津宾馆预订,1,20
天津市旅馆,1,20
天津悦家快捷酒店,1,20
天津情趣酒店,1,20
天津汉庭酒店,1,20
天津酒店预定,1,20
天津酒店预订,1,20
天津附近酒店,1,20
天门市酒店,1,20
太原酒店,1,20
太原酒店预订,1,20
太原锦鹏快捷酒店,1,20
太原附近酒店,1,20
奉化酒店预定,1,20
威海住宿攻略,1,20
威海公寓式酒店,1,20
威海公寓酒店,1,20
威海宾馆艺龙,1,20
威海酒店,1,20
孝感宾馆预订,1,20
宁波住宿,1,20
宁波市宾馆,1,20
宁波汉庭连锁酒店,1,20
宁波酒店,1,20
宁波酒店预订,1,20
安康宾馆预订,1,20
宏村宾馆,1,20
宏村宾馆预定,1,20
定宾馆,1,20
定富阳宾馆,1,20
定酒店,1,20
宜兴住宿,1,20
宜兴宾馆预订,1,20
宜兴酒店攻略,1,20
宜宾连锁酒店,1,20
宜宾酒店,1,20
宜宾酒店预订,1,20
宜昌市宾馆,1,20
宜昌市旅馆,1,20
宜昌机场附近酒店,1,20
宜昌火车站附近酒店,1,20
宜昌酒店,1,20
宜昌酒店预订,1,20
宜春住宿攻略,1,20
宜春职业技术学院附近宾馆,1,20
宜春职业技术学院附近酒店,1,20
宜春连锁酒店官网,1,20
宝坻一中附近宾馆,1,20
客栈,1,20
宣城宾馆,1,20
宣城职业技术学院附近宾馆,1,20
家庭酒店,1,20
宾馆,1,20
宾馆五莲,1,20
宾馆南平,1,20
宾馆武当山,1,20
宾馆网上预订,1,20
宾馆网站,1,20
宾馆预定,1,20
宾馆预订,1,20
宾馆预订网站,1,20
寿光快捷酒店,1,20
寿光预订酒店,1,20
射洪宾馆,1,20
射洪酒店,1,20
山东工业职业学院附近旅馆,1,20
山东工业职业学院附近的酒店,1,20
山东工程技师学院附近宾馆,1,20
山东工程技师学院附近的宾馆,1,20
山东工程技师学院附近酒店,1,20
山东技师学院附近住宿,1,20
山西大同大学附近酒店,1,20
岳阳格兰云天大酒店,1,20
峨眉山住宿,1,20
峨眉山的宾馆,1,20
常平火车站住宿,1,20
平凉连锁酒店,1,20
平山县快捷酒店,1,20
平度商务酒店,1,20
平度市宾馆,1,20
平度市快捷酒店,1,20
平度旅馆,1,20
平潭大酒店,1,20
平遥古城住宿,1,20
广东司法警官职业学院附近的酒店,1,20
广交会酒店,1,20
广交会附近的酒店,1,20
广安的酒店,1,20
广州7天连锁酒店,1,20
广州中瑞酒店,1,20
广州南方大酒店,1,20
广州圣淘沙商务宾馆,1,20
广州增城附近的宾馆,1,20
广州如家连锁酒店,1,20
广州如家酒店预订,1,20
广州宾馆预订,1,20
广州招待所,1,20
广州景星酒店,1,20
广州民航职业技术学院附近酒店,1,20
广州花城广场附近住宿,1,20
广州芳村客运站附近宾馆,1,20
广州芳村客运站附近的宾馆,1,20
广州西关附近酒店,1,20
广州订房网,1,20
广州邦国酒店订房,1,20
广州酒店,1,20
广州酒店预定,1,20
广汉酒店,1,20
广西南宁火车站周边酒店,1,20
广西师范大学 住宿,1,20
广西机电工业学校附近宾馆,1,20
庆阳市酒店,1,20
庐山大酒店,1,20
庐山宾馆,1,20
庐山青旅,1,20
康定新都桥酒店,1,20
廊坊住宿,1,20
廊坊酒店预订,1,20
延安酒店预订,1,20
建国宾馆,1,20
开封宾馆,1,20
开封旅馆,1,20
张家口宾馆,1,20
张家界住宿预定,1,20
张家界宾馆预订,1,20
张家界市快捷酒店,1,20
张家界景区住宿,1,20
张家界火车站附近住宿,1,20
张家界火车站附近酒店,1,20
张家界连锁酒店,1,20
张掖七彩丹霞国际青年旅舍,1,20
张掖快捷酒店,1,20
徐州九州职业技术学院附近酒店,1,20
徐州云龙公园附近宾馆,1,20
徐州酒店,1,20
德令哈酒店,1,20
德州卫校附近住宿,1,20
德州火车站附近的宾馆,1,20
德州订房,1,20
德阳宾馆预订,1,20
德阳酒店,1,20
快捷酒店预订,1,20
怎么订酒店,1,20
惠州十里银滩酒店,1,20
惠州大酒店,1,20
惠州订房,1,20
惠州酒店,1,20
惠州酒店预订,1,20
慈溪如家酒店,1,20
成山头住宿,1,20
成都7天连锁酒店,1,20
成都七中高新校区附近宾馆,1,20
成都世纪城新国际会展中心周边酒店,1,20
成都世纪城新国际会展中心附近宾馆,1,20
成都中医药大学附属医院附近酒店,1,20
成都华西坝附近酒店,1,20
成都喜洋洋商务酒店,1,20
成都四川大学望江校区附近酒店,1,20
成都如家酒店预订,1,20
成都宾馆价格,1,20
成都宾馆预定,1,20
成都宾馆预订,1,20
成都市7天连锁酒店,1,20
成都市区酒店,1,20
成都成华区周边宾馆,1,20
成都新南门站住宿,1,20
成都新都 宾馆,1,20
成都旅馆,1,20
成都汉庭酒店预订,1,20
成都王府井周边酒店,1,20
成都百花潭公园附近住宿,1,20
成都职业技术学院锦江校区 旅馆,1,20
成都职业技术学院锦江校区酒店,1,20
成都职业技术学院锦江校区附近旅馆,1,20
成都职业技术学院锦江校区附近酒店,1,20
成都茶店子客运站附近酒店,1,20
成都荷花池附近的宾馆,1,20
成都西南交大附近宾馆,1,20
成都西南交大附近的酒店,1,20
成都酒店,1,20
成都酒店公寓,1,20
成都酒店查询,1,20
成都酒店预订,1,20
成都金牛区住宿,1,20
成都附近宾馆,1,20
成都附近酒店,1,20
房间预订,1,20
打折宾馆,1,20
打折酒店,1,20
扬州住宿,1,20
扬州宾馆预订,1,20
扬州技师学院附近的酒店,1,20
扬州西站附近宾馆,1,20
扬州酒店,1,20
承德住宿攻略,1,20
承德宾馆预订,1,20
承德市宾馆,1,20
承德速8酒店,1,20
抚州酒店预订,1,20
抚顺宾馆预订,1,20
抚顺酒店,1,20
拉萨市的酒店,1,20
拉萨旅店,1,20
拉萨旅馆,1,20
揭东县酒店,1,20
揭阳如家酒店,1,20
攀枝花酒店,1,20
敦煌宾馆预订,1,20
文登市快捷酒店,1,20
新乡市宾馆,1,20
新乡附近酒店,1,20
新余酒店预订,1,20
新沂宾馆住宿,1,20
新泰市宾馆,1,20
旅店预定,1,20
旅馆,1,20
无锡订酒店,1,20
无锡酒店预订,1,20
日照 酒店,1,20
日照宾馆预订,1,20
日照旅馆,1,20
日照职业技术学院附近宾馆,1,20
日照附近宾馆,1,20
时代假日酒店,1,20
昆明北市区酒店,1,20
昆明官渡大酒店,1,20
昆明市中心酒店,1,20
昆明火车北站酒店,1,20
昆明理工大学津桥学院附近宾馆,1,20
昆明羊甫车场附近酒店,1,20
昌黎公寓,1,20
昌黎黄金海岸住宿,1,20
昌黎黄金海岸附近宾馆,1,20
晋江酒店,1,20
普陀山住宿,1,20
普陀山客栈,1,20
景德镇住宿,1,20
景德镇住宿攻略,1,20
景德镇格林豪泰酒店,1,20
曲阜宾馆,1,20
曲阜宾馆酒店预订,1,20
曲阜尚客优快捷酒店,1,20
曲阜酒店,1,20
曹县宾馆,1,20
曹妃甸周边酒店,1,20
月坨岛住宿,1,20
朝阳市的宾馆,1,20
本溪住宿,1,20
本溪桓仁酒店,1,20
本溪酒店,1,20
朱家尖酒店预订,1,20
来宾酒店,1,20
杭州七亩庭园精品酒店,1,20
杭州下沙区酒店预订,1,20
杭州便宜酒店,1,20
杭州吴山广场周边宾馆,1,20
杭州如家酒店预订,1,20
杭州实惠旅馆,1,20
杭州宾馆,1,20
杭州宾馆预订,1,20
杭州布丁连锁酒店,1,20
杭州招待所,1,20
杭州新侨饭店,1,20
杭州旅店,1,20
杭州旅馆,1,20
杭州汉庭酒店,1,20
杭州汉庭酒店预订,1,20
杭州汽车南站周边宾馆,1,20
杭州酒店,1,20
杭州酒店预定,1,20
杭州酒店预订,1,20
松原附近酒店,1,20
枣庄学院宾馆,1,20
枣庄火车站附近酒店,1,20
柳州网上订房,1,20
柳州酒店,1,20
栖霞市附近宾馆,1,20
栖霞的宾馆,1,20
桂林7天连锁酒店,1,20
桂林住宿攻略,1,20
桂林宾馆查询,1,20
桂林附近旅馆,1,20
桐乡市的宾馆,1,20
梅州招待所,1,20
梧州市宾馆,1,20
森海丽景泛印酒店,1,20
楚雄的酒店,1,20
榆次周边酒店,1,20
横店客栈,1,20
横店酒店,1,20
横店酒店预订,1,20
欧亚学院周边酒店,1,20
欧亚学院附近住宿,1,20
欧亚学院附近宾馆,1,20
欧亚学院附近旅馆,1,20
欧亚学院附近的酒店,1,20
武夷山大酒店,1,20
武安住宿,1,20
武当山住宿预订,1,20
武当山宾馆住宿,1,20
武当山酒店,1,20
武汉如家酒店,1,20
武汉宾馆预定,1,20
武汉徐东大街附近的酒店,1,20
武汉旅馆,1,20
武汉武昌区宾馆,1,20
武汉水果湖附近的宾馆,1,20
武汉育才高中附近酒店,1,20
武汉艳阳天酒店官网,1,20
武汉订房,1,20
武汉酒店预订,1,20
武汉酒店预订网,1,20
武汉附近酒店,1,20
永州市酒店,1,20
永康市宾馆,1,20
永春酒店,1,20
永春酒店预订,1,20
汉中酒店预订,1,20
汕头汉庭酒店,1,20
汕尾旅店,1,20
江景酒店,1,20
江汉大学附近酒店,1,20
江油市酒店宾馆,1,20
江油特价酒店,1,20
沂水酒店,1,20
沈阳120中学附近的宾馆,1,20
沈阳120中学附近的酒店,1,20
沈阳住宿,1,20
沈阳北陵公园附近旅馆,1,20
沈阳如家酒店预订,1,20
沈阳宾馆酒店,1,20
沈阳宾馆预订,1,20
沈阳的旅店,1,20
沧州快捷酒店,1,20
河池酒店,1,20
河源酒店连锁,1,20
河源酒店预订,1,20
泰安住宿攻略,1,20
泰安定房,1,20
泰安宾馆,1,20
泰安宾馆预订,1,20
泰安旅馆,1,20
泰安酒店预订,1,20
泰安附近酒店,1,20
泰山住宿,1,20
泰山宾馆,1,20
泰山山顶酒店,1,20
泰顺度假村酒店,1,20
泸山宾馆,1,20
泸州旅馆,1,20
洛阳便宜的旅馆,1,20
洛阳宾馆预订,1,20
洛阳招待所,1,20
洛阳酒店,1,20
洛阳酒店预订,1,20
洪湖市酒店,1,20
济南 订房,1,20
济南国际会展中心住宿,1,20
济南定酒店,1,20
济南宾馆,1,20
济南宾馆预订,1,20
济南市住宿,1,20
济南市宾馆,1,20
济南旅店,1,20
济南育英中学附近酒店,1,20
济南艺术学校附近宾馆,1,20
济南蓝海大饭店历城,1,20
济南酒店,1,20
济南银座佳悦酒店,1,20
济南青旅,1,20
济宁便宜的酒店,1,20
济宁市连锁酒店,1,20
济宁酒店,1,20
济源订房,1,20
浙二医院附近的宾馆,1,20
浙江机电职业技术学院附近的酒店,1,20
浙江机电职业技术学院附近酒店,1,20
浙江理工大学下沙校区附近酒店,1,20
浙江财经学院下沙校区附近的宾馆,1,20
海口市宾馆,1,20
海宁宾馆预订,1,20
海宁酒店,1,20
海珠广场附近酒店,1,20
海阳如家酒店,1,20
淄博 酒店,1,20
淄博火车站附近宾馆,1,20
淮安酒店预订,1,20
深圳 订酒店,1,20
深圳7天连锁酒店,1,20
深圳华联宾馆,1,20
深圳喜来登酒店,1,20
深圳如家酒店预订,1,20
深圳客栈,1,20
深圳新世界宾馆,1,20
深圳民族风情酒店订房,1,20
深圳精品酒店,1,20
深圳雅枫国际酒店,1,20
深圳鸿丰大酒店南山店,1,20
深大旅馆,1,20
清远佛冈住宿,1,20
清远订房,1,20
清远酒店,1,20
清远酒店预订,1,20
温州 酒店,1,20
温州医学院茶山校区附近宾馆,1,20
温州宾馆预订,1,20
温州市旅馆,1,20
温江酒店,1,20
湖州市住宿,1,20
湛江住宿,1,20
湛江旅社,1,20
滁州附近宾馆,1,20
滕州如家酒店,1,20
滕州市附近宾馆,1,20
满洲里客栈,1,20
滨江附近的宾馆,1,20
漳州市的酒店,1,20
漳浦酒店,1,20
潍坊丽景酒店,1,20
潍坊住宿,1,20
潍坊宾馆酒店,1,20
潍坊附近宾馆,1,20
潜江 酒店,1,20
潜江市宾馆,1,20
潜江附近酒店,1,20
潮州宝华酒店,1,20
潮州客栈,1,20
潮州快捷酒店,1,20
潮阳实验学校附近的酒店,1,20
澳门住宿,1,20
澳门酒店预订,1,20
烟台住宿攻略,1,20
烟台大学附近住宿,1,20
烟台大学附近宾馆,1,20
烟台如家连锁酒店,1,20
烟台家庭旅馆,1,20
烟台护士学校旅馆,1,20
烟台旅馆,1,20
烟台汽车总站附近宾馆,1,20
烟台通汇大酒店,1,20
烟台酒店住宿,1,20
烟台酒店预定,1,20
爱尊客连锁酒店,1,20
牙克石连锁酒店,1,20
牡丹江宾馆,1,20
牡丹江酒店预订,1,20
玉溪住宿,1,20
珠江路站附近住宿,1,20
珠海吉大酒店,1,20
珠海市宾馆,1,20
珠海红旗镇旅馆,1,20
珠海荷包岛酒店,1,20
珠海酒店,1,20
珠海附近酒店,1,20
瓦房店住宿,1,20
甘南预订酒店,1,20
电子科技大学清水河校区附近住宿,1,20
电子科技大学清水河校区附近酒店,1,20
番禺 酒店,1,20
白城酒店预订,1,20
白洋淀酒店预定,1,20
盐城市附近宾馆,1,20
盘锦7天连锁酒店,1,20
盱眙宾馆,1,20
眉山宾馆预订,1,20
眉山职业技术学院附近酒店,1,20
石家庄住宿,1,20
石家庄住宿预订,1,20
石家庄定宾馆,1,20
石家庄实惠宾馆,1,20
石家庄客栈,1,20
石家庄宾馆,1,20
石家庄工商职业学院周边酒店,1,20
石家庄工商职业学院附近的酒店,1,20
石家庄市招待所,1,20
石家庄旅馆,1,20
石家庄洲际酒店,1,20
石家庄特价旅馆,1,20
石家庄的宾馆,1,20
石家庄自家快捷酒店,1,20
石家庄酒店,1,20
石家庄酒店预订,1,20
石家庄驿家365连锁酒店,1,20
石屏 住宿,1,20
石河子特价宾馆,1,20
祁县宾馆,1,20
福州宾馆查询,1,20
福州旅社,1,20
福州汽车北站附近酒店,1,20
福州酒店,1,20
科技大学宾馆,1,20
秦皇岛市旅店,1,20
秦皇岛快捷酒店,1,20
秦皇岛订房,1,20
章丘宾馆,1,20
章丘旅店,1,20
简阳附近酒店,1,20
精品酒店,1,20
绍兴旅馆,1,20
绥中度假酒店,1,20
绵阳宾馆预订,1,20
绵阳招待所,1,20
绵阳酒店电话,1,20
绵阳酒店预订,1,20
网上如何订酒店,1,20
网上定旅店,1,20
网上订酒店,1,20
网上预订酒店,1,20
美国驻广州领事馆周边酒店,1,20
聊城市招待所,1,20
聊城市酒店预订,1,20
聊城市附近宾馆,1,20
肇东宾馆,1,20
肇庆7天连锁酒店,1,20
肇庆好世界酒店,1,20
肇庆学院附近住宿,1,20
肇庆学院附近的宾馆,1,20
肇庆怀集县酒店,1,20
肇庆订房,1,20
肇庆酒店预订,1,20
肇庆附近酒店,1,20
肥城快捷酒店,1,20
胶南宾馆,1,20
胶南市的宾馆,1,20
胶州酒店,1,20
自贡商务酒店,1,20
自贡酒店连锁,1,20
艺龙,1,20
艺龙大酒店,1,20
艺龙如家,1,20
艺龙宾馆预订,1,20
艺龙旅行网,1,20
艺龙网站,1,20
艺龙网订酒店,1,20
艺龙网酒店预订,1,20
艺龙网首页,1,20
艺龙订酒店,1,20
苏州乐园酒店,1,20
苏州住宿,1,20
苏州南园宾馆,1,20
苏州市中心宾馆,1,20
苏州快捷酒店,1,20
苏州订房,1,20
苏州青年旅舍,1,20
荣成 旅馆,1,20
荣成如家,1,20
莆田速8酒店,1,20
莆田酒店,1,20
莒南宾馆,1,20
莱西宾馆,1,20
莱西酒店,1,20
莱阳快捷酒店,1,20
莱阳附近酒店,1,20
菏泽宾馆预订,1,20
萍乡主题酒店,1,20
营口宾馆预订,1,20
营口附近酒店,1,20
葫芦岛旅店,1,20
蒙自情侣酒店,1,20
蓬莱住宿攻略,1,20
蓬莱市宾馆预订,1,20
蓬莱旅店,1,20
蔚县宾馆预订,1,20
蜀南竹海住宿,1,20
衡水家庭旅馆,1,20
衡水宾馆预订,1,20
衡水快捷酒店,1,20
衡阳林隐假日大酒店,1,20
衢州快捷酒店,1,20
西塘客栈,1,20
西塘快捷宾馆,1,20
西塘西街客栈,1,20
西塘订房,1,20
西塘青年旅舍,1,20
西宁旅馆,1,20
西安宾馆预订,1,20
西安布丁酒店,1,20
西安快捷酒店价格,1,20
西安旅馆,1,20
西安欧亚学院附近的酒店,1,20
西安汉庭酒店,1,20
西安汉庭酒店预订,1,20
西安罗曼主题酒店,1,20
西安酒店,1,20
西安长征国际酒店,1,20
西安附近酒店,1,20
西昌印象快捷酒店,1,20
西昌宾馆预订,1,20
西昌酒店,1,20
西昌酒店预订,1,20
订乌镇住宿,1,20
订宾馆,1,20
订房,1,20
订房网,1,20
订房间,1,20
订深圳酒店,1,20
订澳门酒店,1,20
订酒店,1,20
订酒店哪个网站好,1,20
订酒店网站,1,20
许昌职业技术学院住宿,1,20
诸城附近酒店,1,20
贵港住宿,1,20
贵港宾馆,1,20
贵阳宾馆预订,1,20
贵阳酒店官网,1,20
资源住宿预订,1,20
资阳酒店预订,1,20
赣州三中宾馆,1,20
赣州客栈,1,20
赣州市宾馆预定,1,20
赤峰旅店,1,20
辽源订房,1,20
辽阳旅店,1,20
辽阳附近宾馆,1,20
运城旅馆,1,20
运河花园酒店,1,20
连云港如家酒店,1,20
连云港宾馆,1,20
连云港酒店,1,20
连锁酒店官网,1,20
连锁酒店预订,1,20
迪士尼乐园酒店,1,20
通山大酒店,1,20
通州酒店,1,20
遂宁宾馆,1,20
遵义酒店预订,1,20
邢台眼科医院附近酒店,1,20
邢台酒店预订,1,20
邯郸市快捷酒店,1,20
邹城住宿,1,20
郑州宾馆预订,1,20
郑州旅馆预定,1,20
郑州火车站附近宾馆,1,20
郑州火车站附近的宾馆,1,20
郑州火车站附近的酒店,1,20
郑州经三路宾馆,1,20
郑州订房,1,20
郑州豫都商务酒店地址,1,20
郑州连锁酒店,1,20
郑州预订宾馆,1,20
郫县宾馆,1,20
郴州职业技术学院周边酒店,1,20
都匀附近酒店,1,20
都江堰住宿,1,20
都江堰住宿攻略,1,20
都江堰大酒店,1,20
都江堰酒店预定,1,20
都江堰酒店预订,1,20
鄂州酒店,1,20
鄂州酒店预订,1,20
酒店,1,20
酒店 成都,1,20
酒店 横店,1,20
酒店住宿,1,20
酒店打折网,1,20
酒店携程,1,20
酒店桂林,1,20
酒店诸城,1,20
酒店连锁,1,20
酒店预定,1,20
酒店预订,1,20
酒店预订哪个网站好,1,20
酒店预订官网,1,20
酒店预订网,1,20
酒店黄骅,1,20
重庆7天快捷酒店,1,20
重庆公寓式酒店,1,20
重庆十八中附近的酒店,1,20
重庆商务酒店,1,20
重庆宾馆预订,1,20
重庆情侣主题酒店,1,20
重庆旅游住哪里好,1,20
重庆橡树林酒店,1,20
重庆火车北站附近的酒店,1,20
重庆火车北站附近酒店,1,20
重庆火车站附近酒店,1,20
金乡酒店预定,1,20
金乡附近酒店,1,20
金华市区酒店,1,20
金华市酒店查询,1,20
金华酒店,1,20
金华酒店预订,1,20
金桥国际公寓,1,20
钟祥酒店,1,20
铁岭如家酒店,1,20
铜仁大酒店,1,20
铜川市宾馆,1,20
银川宾馆,1,20
银川旅店,1,20
锡林浩特酒店预订,1,20
锦州市的宾馆,1,20
镇江住宿攻略,1,20
镇江南站附近宾馆,1,20
镇江酒店预订,1,20
长丰酒店,1,20
长乐酒店预订,1,20
长乐附近酒店,1,20
长兴宾馆,1,20
长岛县预订宾馆,1,20
长春站附近的宾馆,1,20
长春速8酒店,1,20
长沙宾馆,1,20
长沙市酒店,1,20
长沙酒店预定,1,20
长沙酒店预订,1,20
长沙预订酒店,1,20
阆中古城住宿,1,20
阜新宾馆,1,20
阜新宾馆预订,1,20
阳朔住宿,1,20
阳朔帝都大酒店,1,20
阳朔酒店预订,1,20
阳江海景房,1,20
阿尔山 酒店,1,20
附近宾馆,1,20
雁荡山住宿,1,20
雅居乐酒店,1,20
青岛住宿,1,20
青岛城阳宾馆,1,20
青岛如家连锁酒店,1,20
青岛如家酒店预订,1,20
青岛宾馆,1,20
青岛宾馆预订,1,20
青岛市宾馆,1,20
青岛情趣酒店,1,20
青岛旅社,1,20
青岛李沧附近旅馆,1,20
青岛永安路小学附近宾馆,1,20
青岛眼科医院酒店,1,20
青岛眼科医院附近酒店,1,20
青岛远洋船员学院附近宾馆,1,20
青岛酒店管理学院周边酒店,1,20
青岛酒店管理学院附近宾馆,1,20
青岛颐中体育场附近宾馆,1,20
青岛龙港海景酒店,1,20
青年旅店,1,20
青田住宿,1,20
鞍山酒店预订,1,20
韶关快捷酒店,1,20
韶关旅馆,1,20
预定哈尔滨酒店,1,20
预定宾馆,1,20
预定徐州酒店,1,20
预定深圳酒店,1,20
预定襄阳酒店,1,20
预定西昌酒店,1,20
预定酒店,1,20
预定黄冈宾馆,1,20
预订宾馆,1,20
预订酒店,1,20
香港君悦酒店,1,20
香港酒店预订,1,20
马鞍山酒店,1,20
驻马店招待所,1,20
高密酒店预订,1,20
高碑店酒店,1,20
鸡西宾馆查询,1,20
麻城酒店预订,1,20
黄冈酒店预订,1,20
黄台宾馆,1,20
黄山宾馆预订,1,20
黄山市宾馆,1,20
黄山市酒店预订,1,20
黄山酒店,1,20
黄石订房,1,20
齐齐哈尔劳动湖酒店,1,20
齐齐哈尔旅店,1,20
齐齐哈尔特价宾馆,1,20
龙口商务宾馆,1,20
龙口酒店,1,20
龙泉驿酒店预订,1,20
龙虎山住宿,1,20"
job_class = Db::BidJob.config(Db::EnvConfig.new("qihu","hotel","exact"))
mdata.split("\n").each do |line|
  job = line.split(",")
  keyword_string = job[0]
  rank = job[1].to_i
  max_price= job[2].to_f
  bid_generate.qihu_generate_or_update(keyword_string,rank,max_price)
  p line
end
