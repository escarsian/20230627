<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8' />
<script src='fullcalendar-6.1.8/dist/index.global.js'></script>
<script>
  let data =[
	  {
		  title: '회의',
		  start: '2023-01-02T13:00:00',
		  end: '2023-01-02T15:00:00'
	  }
  ]
  
  document.addEventListener('DOMContentLoaded', function() {
	  
	  //Ajax 호출. 비동기 방식
	  let xhtp = new XMLHttpRequest();
	  xhtp.open('get', 'eventList.do');
      xhtp.send();
	  xhtp.onload = function (){
		  let result = JSON.parse(xhtp.responseText);
		  for (let cal of result) {
			  let obj = {
					  	  title: cal.title,
					  	  start: cal.startDate,
					  	  end: cal.endDate
			  			}
			  data.push(obj);
			  } //end fo for
		  console.log(data);
		
    var calendarEl = document.getElementById('calendar');
    var calendar = new FullCalendar.Calendar(calendarEl, {
      headerToolbar: {
        left: 'prev next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek timeGridDay'
      },
      initialDate: new Date(), // '2023-01-12',
      navLinks: true, // can click day/week names to navigate views
      selectable: true,
      selectMirror: true,
      select: function(arg) {
        var title = prompt('일정을 등록하세요.');
        if (title) {
          console.log(arg);
          let addXhtp = new XMLHttpRequest();
          addXhtp.open('post', 'addEvnet.do');
          addXhtp.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
          addXhtp.send('title='+title+'&start='+arg.startStr+'&end='+arg.endStr);
          addXhtp.onload = function () {
        	  let result = JSON.parse(addXhtp.responseText);
        	  if (result.retCode = 'Success'){
        		  calendar.addEvent({
        	          title: title,
        	          start: arg.start,
        	          end: arg.end,
        	          allDay: arg.allDay
        	        })//성공하면 화면에 등록.  
        	  } else {
        		  alert('처리 실패.')
        	  }
          }//end of onload.
          
        }//end of if
        calendar.unselect()
      },
      eventClick: function(arg) {
        if (confirm('일정을 삭제하겠습니까?')) {
          console.log(arg); //title 값을 찾아서.
          let delAjax = new XMLHttpRequest();
          delAjax.open('post', 'removeEvnet.do');
          delAjax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
          delAjax.send("title="+arg.event._def.title);
          delAjax.onload = function (e) {
        	let result = JSON.parse(delAjax.responseText)
        	if (result.retCode == 'Success'){
        		calendar.removeEvent()
        	} else{
        		alert('실패.')
        	}
          }
        }
      },
      editable: true,
      dayMaxEvents: true, // allow "more" link when too many events
      events: data
    });

     calendar.render();
    
    }//end fo onload.
  });

</script>
<style>

  body {
    margin: 40px 10px;
    padding: 0;
    font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    font-size: 14px;
  }

  #calendar {
    max-width: 1100px;
    margin: 0 auto;
  }

</style>
</head>
<body>

  <div id='calendar'></div>

</body>
</html>
