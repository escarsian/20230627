<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>basic2</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>

<script>
 /* $(document).ready(function ({
  $('li:nth-child(1)').css('background', 'yellow');
  });
  */
  $(document).ready(function(){
	  
 	//document.addEventLister('DOMContentLoaded', function(){
	 $('li:nth-child(1)').css('background-color', 'yellow');
	 let li = $('<li />').text('Melon');
	 console.log(li);
	
	 $('ul').append(li); //ul요소의 하위에 li 요소를 추가.
	 
	 //버튼 추가.
	 $('li').append($('<button />').text('삭제').on('click', delBtn));
	 
	 function delBtn(e) {
		 console.log(e);
		 //e.currentTarget : DOM 
		 //$(e.currentTarget) : jquery 객체.
		 $(e.currentTarget).parent().remove();
	 }
	 
	 //이벤트 on
	 $('#bt').on('click', function (){
		$('li:nth-child(1)').remove(); 
	});
	 
	
	 $('#addBtn').on('click', function (e) {
		let li = $('<li />').text($('#userInput').val())
		 					.append($('<button />').text('삭제')
		 							 			   .on('click', delBtn));
		//$('ul').prepend(li); 요소의 처음
		//li.appendTo($('ul')); 
		$('li:nth-child(2)').after(li);
		//init
		$('#userInput').val('');

	 })
	 
	 //$('button').wrap($('<div />')); button을 div로 감싸겠음.
 });
  
</script>

</head>
<body>

  <button id = "bt">요소제거</button>
  <input id = "userInput"><button id="addBtn">추가</button>
  <ul>
    <li>Apple</li>
    <li>Banana</li>
    <li>Cherry</li>
  </ul>
  
 
</body>
</html>