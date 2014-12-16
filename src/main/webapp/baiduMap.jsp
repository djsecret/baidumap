<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta name="keywords" content="百度地图,百度地图API，百度地图自定义工具，百度地图所见即所得工具"/>
    <meta name="description" content="百度地图API自定义地图，帮助用户在可视化操作下生成百度地图"/>
    <title>百度地图API自定义地图</title>
    <!--引用百度地图API-->
    <style type="text/css">
        html, body {
            margin: 0;
            padding: 0;
        }

        .iw_poi_title {
            color: #CC5522;
            font-size: 14px;
            font-weight: bold;
            overflow: hidden;
            padding-right: 13px;
            white-space: nowrap
        }

        .iw_poi_content {
            font: 12px arial, sans-serif;
            overflow: visible;
            padding-top: 4px;
            white-space: -moz-pre-wrap;
            word-wrap: break-word
        }
    </style>
    <script language="javascript" src="jquery-2.1.1.min.js"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?key=&v=1.1&services=true"></script>
</head>

<body>
<!--百度地图容器-->
<div style="width:650px;height:665px;border:#ccc solid 1px;float:left;" id="dituContent"></div>
<div style="width:555px;height:655px;border:#ccc solid 1px;float:right;padding:5px 20px;" id="myContent">

    <span style="width:300px; height:10px; border:#000 solid 2px; padding:5px 20px;" id="myLocation"></span>

</div>

<script type="text/javascript">
    //创建和初始化地图函数：
    function initMap() {
        createMap();//创建地图
        setMapEvent();//设置地图事件
        addMapControl();//向地图添加控件
        addMarker();//向地图中添加marker
    }

    //创建地图函数：
    function createMap() {
        var map = new BMap.Map("dituContent");//在百度地图容器中创建一个地图
        var point = new BMap.Point(71.12293, 41.96888);//定义一个中心点坐标
        map.centerAndZoom(point, 6);//设定地图的中心点和坐标并将地图显示在地图容器中

        function showInfo(e) {
            alert(e.point.lng + ", " + e.point.lat);
            //map.clearOverlays();
            map.addOverlay(new BMap.Marker(new BMap.Point(e.point.lng, e.point.lat)));
        }

        map.addEventListener("dblclick", showInfo);

        window.map = map;//将map变量存储在全局
    }

    //地图事件设置函数：
    function setMapEvent() {
        map.enableDragging();//启用地图拖拽事件，默认启用(可不写)
        map.disableScrollWheelZoom();//禁用地图滚轮放大缩小，默认禁用(可不写)
        map.disableDoubleClickZoom();//启用鼠标双击放大，默认启用(可不写)
        map.enableKeyboard();//启用键盘上下左右键移动地图
    }

    //地图控件添加函数：
    function addMapControl() {
        //向地图中添加缩放控件
        var ctrl_nav = new BMap.NavigationControl({anchor: BMAP_ANCHOR_TOP_LEFT, type: BMAP_NAVIGATION_CONTROL_LARGE});
        map.addControl(ctrl_nav);
        //向地图中添加缩略图控件
        var ctrl_ove = new BMap.OverviewMapControl({anchor: BMAP_ANCHOR_BOTTOM_RIGHT, isOpen: 1});
        map.addControl(ctrl_ove);
        //向地图中添加比例尺控件
        var ctrl_sca = new BMap.ScaleControl({anchor: BMAP_ANCHOR_BOTTOM_LEFT});
        map.addControl(ctrl_sca);
    }



    //标注点数组
//    var markerArr = [
//        {title: "1", content: "第1点", point: "119.972599|38.943134", isOpen: 0, icon: {w: 23, h: 25, l: 46, t: 21, x: 9, lb: 12}}
//        ,
//        {title: "2", content: "第2点", point: "122.980557|34.62405", isOpen: 0, icon: {w: 23, h: 25, l: 46, t: 21, x: 9, lb: 12}}
//        ,
//        {title: "3", content: "第3点", point: "123.974011|28.744675", isOpen: 0, icon: {w: 23, h: 25, l: 46, t: 21, x: 9, lb: 12}}
//        ,
//        {title: "4", content: "第4点", point: "125.069719|19.156204", isOpen: 0, icon: {w: 23, h: 25, l: 46, t: 21, x: 9, lb: 12}}
//        ,
//        {title: "5", content: "第5点", point: "115.069719|19.156204", isOpen: 0, icon: {w: 23, h: 25, l: 46, t: 21, x: 9, lb: 12}}
//    ];
    //创建marker
    function addMarker() {
        var marker = new BMap.Marker(new BMap.Point(71.12293, 41.96888));
        marker.addEventListener("click", function (ee)
        {
            $("#myLocation").html("我的位置：" + "(" + ee.point.lng + "," + ee.point.lat + ")");
            $('#myContent').append("<p style='color:#dd0000'>" + ee.point.lng + "/" + ee.point.lat + "</p>");
            doRequestUsingGET(71.12293, 41.96888);
        });
        map.addOverlay(marker);
        marker = new BMap.Marker(new BMap.Point(70.18544, 41.74363));
        marker.addEventListener("click", function (ee)
        {
            $("#myLocation").html("我的位置：" + "(" + ee.point.lng + "," + ee.point.lat + ")");
            $('#myContent').append("<p style='color:#dd0000'>" + ee.point.lng + "/" + ee.point.lat + "</p>");
            doRequestUsingGET(70.18544, 41.74363);
        });
        map.addOverlay(marker);
        marker = new BMap.Marker(new BMap.Point(71.95589, 41.82858));
        marker.addEventListener("click", function (ee)
        {
            $("#myLocation").html("我的位置：" + "(" + ee.point.lng + "," + ee.point.lat + ")");
            $('#myContent').append("<p style='color:#dd0000'>" + ee.point.lng + "/" + ee.point.lat + "</p>");
            doRequestUsingGET(71.95589, 41.82858);
        });
        map.addOverlay(marker);
        marker = new BMap.Marker(new BMap.Point(71.89159, 40.68332));
        marker.addEventListener("click", function (ee)
        {
            $("#myLocation").html("我的位置：" + "(" + ee.point.lng + "," + ee.point.lat + ")");
            $('#myContent').append("<p style='color:#dd0000'>" + ee.point.lng + "/" + ee.point.lat + "</p>");
            doRequestUsingGET(71.89159, 40.68332);
        });
        map.addOverlay(marker);

//        for (var i = 0; i < markerArr.length; i++) {
//            var json = markerArr[i];
//            var p0 = json.point.split("|")[0];
//            var p1 = json.point.split("|")[1];
//            var point = new BMap.Point(p0, p1);
//            var iconImg = createIcon(json.icon);
//            var marker = new BMap.Marker(point, {icon: iconImg});
//            var iw = createInfoWindow(i);
//            var label = new BMap.Label(json.title, {"offset": new BMap.Size(json.icon.lb - json.icon.x + 10, -20)});
//            marker.setLabel(label);
//            map.addOverlay(marker);
//            label.setStyle({
//                borderColor: "#808080",
//                color: "#333",
//                cursor: "pointer"
//            });
//
//            (function () {
//                var index = i;
//                var _iw = createInfoWindow(index);
//                var _marker = marker;
//                _marker.addEventListener("click", function () {
//                    this.openInfoWindow(_iw);
//                });
//                _marker.addEventListener("click", function () {
//                    showMyLocation(i);
//                });
//                _iw.addEventListener("open", function () {
//                    _marker.getLabel().hide();
//                });
//                _iw.addEventListener("close", function () {
//                    _marker.getLabel().show();
//                });
//                label.addEventListener("click", function () {
//                    _marker.openInfoWindow(_iw);
//                });
//                if (!!json.isOpen) {
//                    label.hide();
//                    _marker.openInfoWindow(_iw);
//                }
//            })();
//        }
    }
//    //创建InfoWindow
//    function createInfoWindow(i) {
//        var json = markerArr[i];
//        var iw = new BMap.InfoWindow("<b class='iw_poi_title' title='" + json.title + "'>" + json.title + "</b><div class='iw_poi_content'>" + json.content + "</div>");
//        return iw;
//    }
//    //创建一个Icon
//    function createIcon(json) {
//        var icon = new BMap.Icon("http://app.baidu.com/map/images/us_mk_icon.png", new BMap.Size(json.w, json.h), {imageOffset: new BMap.Size(-json.l, -json.t), infoWindowOffset: new BMap.Size(json.lb + 5, 1), offset: new BMap.Size(json.x, json.h)});
//        return icon;
//    }
    //显示marker位置（经纬度）
    function showMyLocation(i) {
        var json = markerArr[i - 1];
        var p0 = json.point.split("|")[0];
        var p1 = json.point.split("|")[1];
        $("#myLocation").html("我的位置：" + "(" + p0 + "," + p1 + ")");
        $('#myContent').append("<p style='color:#dd0000'>" + p0 + "/" + p1 + "</p>");

    }

    //创建xmlHttp
    function createXMLHttpRequest()
    {
        if(window.ActiveXObject)
        {
            xmlHttp=new ActiveXObject("Microsoft.XMLHTTP");
        }
        else if(window.XMLHttpRequest)
        {
            xmlHttp=new XMLHttpRequest();
        }
    }

    //使用get方式发送
    function doRequestUsingGET(lng,lat)
    {
        createXMLHttpRequest();
        var queryString="./RTreeServlet?";
        queryString=queryString + "&lng=" + lng + "&lat=" + lat;
        xmlHttp.onreadystatechange=handleStateChange;
        xmlHttp.open("GET",queryString,true);
        xmlHttp.send(null);
    }

    function handleStateChange()
    {
        if(xmlHttp.readyState==4)
        {
            if(xmlHttp.status==200)
            {
                //alert(xmlHttp.responseText);
                $('#myContent').append("<p style='color:#dd0000'>" + xmlHttp.responseText + "</p>");
            }
        }

    }

    initMap();//创建和初始化地图
</script>

</body>
</html>