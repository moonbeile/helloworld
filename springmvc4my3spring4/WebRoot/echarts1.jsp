<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'echarts1.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
    <script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
  	<script type="text/javascript" src="<%=basePath%>js/echarts.min.js"></script>
  </head>
  
  <body>
  		<!-- 1.定义div初始化折线图 -->
        <div style="height:410px;min-height:100px;margin: 0 auto;" id="main"></div>
        <script type="text/javascript">
        //2. 加载dom之后初始化Echarts实例
        var mychart = echarts.init(document.getElementById("main"));
        
    option = {
    title: {
        text: '清朝.乾隆秀女选秀分数分布图',
        subtext: '模拟宫廷选秀数据'
    },
    tooltip: {
        trigger: 'axis'
    },
    legend: {
        data:['最高分数','最低分数']
    },
    toolbox: {
        show: true,
        feature: {
            dataZoom: {
                yAxisIndex: 'none'
            },
            dataView: {readOnly: false},
            magicType: {type: ['line', 'bar']},
            restore: {},
            saveAsImage: {}
        }
    },
    xAxis:  {
        type: 'category',
        boundaryGap: false,
        data: ['周一','周二','周三','周四','周五','周六','周日']
    },
    yAxis: {
        type: 'value',
        axisLabel: {
            formatter: '{value}分'
        }
    },
    series: [
        {
            name:'最高分数',
            type:'line',
            data:[11, 11, 15, 13, 12, 13, 10],
            markPoint: {
                data: [
                    {type: 'max', name: '最大值'},
                    {type: 'min', name: '最小值'}
                ]
            },
            markLine: {
                data: [
                    {type: 'average', name: '平均值'}
                ]
            }
        },
        {
            name:'最低分数',
            type:'line',
            data:[1, -2, 2, 5, 3, 2, 0],
            markPoint: {
                data: [
                    {name: '周最低', value: -2, xAxis: 1, yAxis: -1.5}
                ]
            },
            markLine: {
                data: [
                    {type: 'average', name: '平均值'},
                    [{
                        symbol: 'none',
                        x: '90%',
                        yAxis: 'max'
                    }, {
                        symbol: 'circle',
                        label: {
                            normal: {
                                position: 'start',
                                formatter: '最大值'
                            }
                        },
                        type: 'max',
                        name: '最高点'
                    }]
                ]
            }
        }
    ]
};
   // 在数据为动态加载之前建筑loading动画
   mychart.showLoading();
   // 对数据进行重新，变成动态数据
   var maxscores=[];
   var minscores=[];
   var snames=[];
   $.ajax({
   		type:"post",
   		async:true, // 异步请求
   		url:"<%=basePath%>getAllTwo.do",
   		data:{},
   		dataType:"json",
   		success:function(result) {
   			if(result!=null&&result.length>0){
   				for(var i=0;i<result.length;i++){
   					maxscores.push(result[i].maxscore);
   					minscores.push(result[i].minscore);
   					snames.push(result[i].sname);
   				}
   				// 隐藏加载动画
   			    mychart.hideLoading();
   			    mychart.setOption({
   			    	xAxis:{
   			    		data:snames //重写x轴
   			    	},
   			    	series:[
   			    	    {
   			    		name:'最高分',
   			    		data:maxscores,
   			    		color:['#FF3333']
   			    		},
   			    		{
   			    		name:'最低分',
   			    		data:minscores,
   			    		color:['#43cd81']
   			    		}
   			    	]
   			    	
   			    })
   			}
   		}
   });
  // 3.载入Echarts图标
  mychart.setOption(option);

</script>
    
    
  </body>
</html>
