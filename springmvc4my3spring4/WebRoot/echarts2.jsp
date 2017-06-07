<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'echarts2.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <script type="text/javascript"  src="<%=basePath%>js/jquery.min.js"></script>
    <script type="text/javascript"  src="<%=basePath%>js/echarts.min.js"></script>
  </head>
  
  <body>
    <div style="height: 410px;min-height: 100px;margin: 0 auto;" id="main"></div>
   
    <script type="text/javascript">
    // 初始化Echarts
    var mychart = echarts.init(document.getElementById('main'));
    option = {
    title : {
        text: '清朝.乾隆秀女选秀年龄分布图',
        subtext: '玫瑰图',
        x:'center'
    },
    tooltip : {
        trigger: 'item',
        formatter: "{a} <br/>{b} : {c} ({d}%)"
    },
    legend: {
        x : 'center',
        y : 'bottom',
        data:['藏族 143','彝族 18','羌族 6']
    },
    toolbox: {
        show : true,
        feature : {
            mark : {show: true},
            dataView : {show: true, readOnly: false},
            magicType : {
                show: true,
                type: ['pie', 'funnel']
            },
            restore : {show: true},
            saveAsImage : {show: true}
        }
    },
    calculable : true,
    series : [
        {
            name:'半径模式',
            type:'pie',
            radius : [30, 110],
            center : ['25%', '50%'],
            roseType : 'radius',
            data:[
                {value:143, name:'藏族 143'},
                {value:18, name:'彝族 18'},
                {value:6, name:'羌族 6'},
            ]
        },
        {
            name:'面积模式',
            type:'pie',
            radius : [30, 110],
            center : ['75%', '50%'],
            roseType : 'area',
            data:[
                {value:143, name:'藏族 143'},
                {value:18, name:'彝族 18'},
                {value:6, name:'羌族 6'},
            ]
        }
    ]
};
     var arraydata=[];
     // 前后台分离 从后台通过ajax冬天的获取数据
     $.ajax({
     	type:"post",
     	async:true,
     	url:"<%=basePath%>getAllByPie.do",
     	data:{},
     	dataType:"json",
     	success:function(result){
     		if(result!=null&&result.length>0){
     			for(var i=0;i<result.length;i++){
     				arraydata.push(result[i].name);
     			}
     			mychart.hideLoading();//隐藏
     			mychart.setOption({
     				legend:{
     					data:arraydata
     				},
     				series :[
     					{
     					data:result
     					},
     					{
     					data:result
     					}
     				]
     			})
     		}
     	}
     })
     // 载入Echarts
     mychart.setOption(option);
    </script>
  </body>
</html>
