<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.amcharts.com/lib/5/index.js"></script>
<script src="https://cdn.amcharts.com/lib/5/percent.js"></script>
<script src="https://cdn.amcharts.com/lib/5/map.js"></script>
<script src="https://cdn.amcharts.com/lib/5/geodata/continentsLow.js"></script>
<script src="https://cdn.amcharts.com/lib/5/themes/Animated.js"></script>
<style type="text/css">
	
	
	#content_box{
		display:flex;
		justify-content:center;
		align-items:center;
		padding: 1px 16px;
		margin-left:15%;
	}
	
	.card_box{
		display:inline-block;
		flex: 1 1 auto;
	}
	
	.img-box{
		width: 50px;
		height: 50px;
		background-size: cover;
	}
	
	.img-box img{
		border-radius: 3px;
		
	}
	
	.card_text{
		font-size: 20px;
		padding: 10px;
		top: 50px
	}
	
	
	/* content 위치 조절 */
	
	.content_top{
		margin-right: 90px;
	}
	
	.content_bottom{
		position: relative;
		margin-left: 15%;
	}
	
	/* card 수정하기  */
	.card_main{
		display:flex;
		justify-content: space-around;
		align-items: center;
		margin-right: 50px;
		margin-top: 30px; 
	}
	
	
	.event_text{
		font-size: 21px;
		font-weight: bold;
	}
	
	.card-box1 img{
		width: 300px;
		height: 200px;
		border-radius: 5px;
	}
	
	.card_main_content{
		list-style: none;
	}
	
	.event_text1{
		font-size:20px;
		font-weight:bold;
		padding: 3px;
	}
	.event_text2{
		font-size:18px;
		font-weight: 500;
		margin: 2px;
	}
	.event_text3{
		font-size:14px;
		margin-top:5px;
		color:gray;
		padding:2px;
	}
	
	
	/* 차트 */
	#chartdiv {
	  width: 1000px;
	  height: 400px;
	  margin-left: 30%;
	  margin-bottom: 50px;
	  margin-top: 30px;
	}
	
	.map_name{
		display:inline-block;
		position: relative;
		left:50%;
		margin-bottom: 10px;
		font-size: 21px;
		font-weight: bold;
		color: black;
		border-radius: 3px;
		background: #BBDEFB;
	}
	
</style>

</head>
<body>
	<%@include file="adminInclude/admin_top.jsp" %>

	<%@include file="adminInclude/admin_aside.jsp" %>
	
	
	
	<div class="content_top">
		<span class="map_name">오늘의 여행자 분포도</span>
		<div id="chartdiv"></div>			
	</div>	
	
	<div class="content_bottom">
		<div>
			<span class="event_text">공지사항 및 이벤트</span>
			
			<ul class="card_main">
				<li class="card_main_content">
					<div class="card-box1">
						<a href="admin_notice_content.do?num=1&page=1"><img alt="보안" src="../resources/image/보안.jpg"></a>
						<div class="event_text1">공지사항</div>
						<div class="event_text2">오늘은 보안 점검이 있는 날입니다.</div>
						<div id="time_text1" class="event_text3"></div>
					</div>
				</li>
			
				<li class="card_main_content">
					<div class="card-box1">
						<a href="admin_notice_content.do?num=2&page=1"><img alt="유럽마을" src="../resources/image/유럽의 마을.jpg"></a>
						<div class="event_text1">이벤트</div>
						<div class="event_text2">좋아하는 여행지 고르시고 후기 남겨주세요.</div>
						<div id="time_text2" class="event_text3"></div>
					</div>
				</li>
			
				<li class="card_main_content">
					<div class="card-box1">
						<a href="admin_notice_content.do?num=3&page=1"><img alt="마일리지" src="../resources/image/마일리지.jpg"></a>
						<div class="event_text1">이벤트</div>
						<div class="event_text2">마일리지 상품을 쓰시면 10% 더 적립해드립니다.</div>
						<div id="time_text3" class="event_text3"></div>
					</div>
				</li>
			</ul>			
		</div>
	</div>
	
<script type="text/javascript">
	
	
	/* 시간을 구하는 공식 */
	let today = new Date();
	
	let year = today.getFullYear();
	let month = ('0' + (today.getMonth() + 1)).slice(-2);
	let day = ('0' + today.getDate()).slice(-2);

	let dateString = year + '-' + month + '-' + day;
	
	document.querySelector('#time_text1').innerHTML = dateString;
	document.querySelector('#time_text2').innerHTML = dateString;
	document.querySelector('#time_text3').innerHTML = dateString;
	
	
	/* 차트   */
	
	
	am5.ready(function() {
	
	// Create root and chart
	var root = am5.Root.new("chartdiv"); 
	
	// Set themes
	root.setThemes([
	  am5themes_Animated.new(root)
	]);
	
	
	// ====================================
	// Create map
	// ====================================
	
	var map = root.container.children.push(
	  am5map.MapChart.new(root, {
	    panX: "none",
	    projection: am5map.geoNaturalEarth1()
	  })
	);
	
	// Create polygon series
	var polygonSeries = map.series.push(
	  am5map.MapPolygonSeries.new(root, {
	    geoJSON: am5geodata_continentsLow,
	    exclude: ["antarctica"],
	    fill: am5.color(0xbbbbbb)
	  })
	);
	
	var pointSeries = map.series.push(
	  am5map.MapPointSeries.new(root, {
	    // ...
	  })
	);
	
	pointSeries.bullets.push(function(root, series, x) {
	  
	  var chartData = x.dataContext.data;
	  
	  var chart = root.container.children.push(am5percent.PieChart.new(root, {
	    width: chartData.width,
	    height: chartData.height,
	    radius: am5.p100,
	    centerX: am5.p50,
	    centerY: am5.p50
	  }));
	  
	  var series = chart.series.push(am5percent.PieSeries.new(root, {
	    valueField: "value",
	    categoryField: "category"
	  }));
	  
	  series.labels.template.set("forceHidden", true);
	  series.ticks.template.set("forceHidden", true);
	  series.data.setAll(chartData.pieData);
	 
	  return am5.Bullet.new(root, {
	    sprite: chart
	  });
	});
	
	pointSeries.bullets.push(function(root, series, x) {
	  
	  var chartData = x.dataContext.data;
	 
	  return am5.Bullet.new(root, {
	    sprite: am5.Label.new(root, {
	      text: chartData.title,
	      centerX: am5.p50,
	      centerY: am5.p100,
	      dy: chartData.height * -0.5
	    })
	  });
	});
	
	
	// ====================================
	// Create pie charts
	// ====================================
	
	var charts = [{
	  "title": "북아메리카",
	  "latitude": 39.563353,
	  "longitude": -99.316406,
	  "width": 100,
	  "height": 100,
	  "pieData": [{
	    "category": "미국",
	    "value": 1200
	  }, {
	    "category": "캐나다",
	    "value": 500
	  }, {
	    "category": "멕시코",
	    "value": 765
	  }, {
	    "category": "그린란드",
	    "value": 260
	  }]
	}, {
	  "title": "유럽",
	  "latitude": 50.896104,
	  "longitude": 19.160156,
	  "width": 50,
	  "height": 50,
	  "pieData": [{
	    "category": "영국",
	    "value": 200
	  }, {
	    "category": "프랑스",
	    "value": 600
	  }, {
	    "category": "독일",
	    "value": 350
	  },{
	    "category": "이탈리아",
	    "value": 450
	  }]
	}, {
	  "title": "아시아",
	  "latitude": 47.212106,
	  "longitude": 103.183594,
	  "width": 80,
	  "height": 80,
	  "pieData": [{
	    "category": "일본",
	    "value": 352
	  }, {
	    "category": "중국",
	    "value": 166
	  }, {
	    "category": "대한민국",
	    "value": 112
	  }, {
	    "category": "필리핀",
	    "value": 199
	  },{
	    "category": "태국",
	    "value": 499
	  },{
	    "category": "베트남",
	    "value": 699
	  }]
	}, {
	  "title": "아프리카",
	  "latitude": 11.081385,
	  "longitude": 21.621094,
	  "width": 50,
	  "height": 50,
	  "pieData": [{
	    "category": "이집트",
	    "value": 200
	  }, {
	    "category": "튀니지",
	    "value": 300
	  }, {
	    "category": "아랍",
	    "value": 599
	  }, {
	    "category": "모로코",
	    "value": 512
	  }]
	}];
	
	for (var i = 0; i < charts.length; i++) {
	  var chart = charts[i];
	  pointSeries.data.push({
	    geometry: { type: "Point", coordinates: [chart.longitude, chart.latitude] },
	    title: chart.title,
	    data: chart
	  });
	}
	
	}); // end am5.ready()
	
	
</script>	
</body>
</html>