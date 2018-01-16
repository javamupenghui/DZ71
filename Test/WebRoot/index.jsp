<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title></title>
<script src="js/jquery-1.11.1.js"></script>
<script src="js/echarts.min.js"></script>
</head>

<body>
	<div id="mychart" style="width: 900px;height: 500px;"></div>
</body>
<script>
		$(function (){
		var Arr = new Array();//名字   
		  var ArrNum = new Array();//值
		$.ajax({
			url:"<%=request.getContextPath()%>/show",
			success : function(result) {
				if (result != null) {
					var obj = eval(result);//转换为JSON对象    
					for ( var i = 0; i < obj.length; i++) {
						Arr.push(obj[i].name);//存入arr    
						ArrNum.push({
							"name" : obj[i].name,
							"value" : obj[i].value
						});//存入arrnum</span>    
					}
				}

				// 基于准备好的dom，初始化echarts图表
				var myChart = echarts.init(document.getElementById('mychart'));

				option = {//标题，每个图表最多仅有一个标题控件，每个标题控件可设主副标题  
					title : {
						text : '某站点用户访问来源',
						subtext : '纯属虚构',
						x : 'center',//水平安放位置，默认为左侧，可选为：'center' | 'left' | 'right' | {number}（x坐标，单位px）    
						y : 'top'//垂直安放位置，默认为全图顶端，可选为：'top' | 'bottom' | 'center' | {number}（y坐标，单位px）    

					},//提示框，鼠标悬浮交互时的信息提示 
					tooltip : {
						trigger : 'item',//触发类型，默认（'item'）数据触发，可选为：'item' | 'axis'
						formatter : "{a} <br/>{b} : {c} ({d}%)"
					},//图例，每个图表最多仅有一个图例  
					legend : {
						orient : 'vertical',
						x : 'left',
						data : Arr
					},//工具箱，每个图表最多仅有一个工具箱   
					toolbox : {
						show : true,
						feature : {
							//显示策略，可选为：true（显示） | false（隐藏），默认值为false
							mark : {
								show : true
							},
							//数据视图，打开数据视图，可设置更多属性,readOnly 默认数据视图为只读(即值为true)，可指定readOnly为false打开编辑功能    
							dataView : {
								show : true,
								readOnly : false
							},
							//magicType，动态类型切换，支持直角系下的折线图、柱状图、堆积、平铺转换    
							magicType : {
								show : true,
								type : [ 'pie', 'funnel' ],
								option : {
									funnel : {
										x : '25%',
										width : '50%',
										funnelAlign : 'left',
										max : 1548
									}
								}
							},
							restore : {
								show : true
							},//restore，还原，复位原始图表
							saveAsImage : {
								show : true
							}
						//saveAsImage，保存图片（IE8-不支持）,图片类型默认为'png' 
						}
					},
					calculable : true,//是否启用拖拽重计算特性，默认关闭(即值为false)
					series : [//sereis的数据: 用于设置图表数据之用。series是一个对象嵌套的结构；对象内包含对象
					{
						name : '访问来源',
						type : 'pie',
						radius : '55%',
						center : [ '50%', '60%' ],
						data : ArrNum
					} ]
				};

				// 为echarts对象加载数据 
				myChart.setOption(option);

			}
		});

	})
</script>

</html>
