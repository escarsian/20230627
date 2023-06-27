<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      let aryData = [];
      aryData.push(['Department', 'Cnt']); //배열에 데이터를 넣겠다.
      
      let xhtp = new XMLHttpRequest(); // 비동기처리방식: Ajax.
      xhtp.open('get', 'chartData.do');
      xhtp.send();
      xhtp.onload = function (){
    	  let data = JSON.parse(xhtp.responseText); //json -> object. 
    	  console.log(data);
    	  for(let i=0;i<data.length;i++){
    		let obj = data[i]; //{Administrator: 1} {필드 : 필드값}
    		for(let prop in obj) { //obj 값만큼 반복하기 위해서 for in 씀.
    		  console.log(prop, obj[prop])	
    		  aryData.push([prop, obj[prop]])
    		}
    	  }
    	  console.log(aryData);
    	  google.charts.load('current', {'packages':['corechart']});
          google.charts.setOnLoadCallback(drawChart);
      } //end of onload.
    
    
      function drawChart() {

        var data = google.visualization.arrayToDataTable(aryData);  //여기 aryData 값이 배열 안의 배열로 만들어서 넣기 위해 위에서 저렇게 만듬.

        var options = {
          title: '부서별 인원 현황'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
    </script>
  </head>
  <body>
    <div id="piechart" style="width: 900px; height: 500px;"></div>
  </body>
</html>
