<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>검색조건</h3>
	시도 :<select id="search">
			
		 </select>
	<button id="searchBtn">조회</button>
	<br>
	<div id="show">
		<table border="1">
			<thead>
				<tr>
					<th>센터id</th>
					<th>센터명</th>
					<th>연락처</th>
					<th>시도</th>
					<th>우편번호</th>
				</tr>
			</thead>
			<tbody id="list">
			</tbody>
		</table>
	</div>

	<script>
	 let totalData = [];
	 let url = 
	   `https://api.odcloud.kr/api/15077586/v1/centers?page=1&perPage=284&serviceKey=CrEGWCaqDe4kDzBd7t41msThdpVroNij6WZqujhAIm7AxqDJC7xbFT1U7dAnWxTdeSxJC%2BL7v9T8MJ1I1YlV8g%3D%3D`;
	 
	 //Ajax 호출
	 let xhtp = new XMLHttpRequest();
	 xhtp.open('get', url);
	 xhtp.send();
	  
	 xhtp.onload = function () {
		let tbody = document.getElementById("list");
		let data = JSON.parse(xhtp.responseText);
		console.log(data.data);
		totalData = data.data;
		for (let i=0; i<data.data.length; i++){
	 	  tbody.appendChild(makeRow(data.data[i]));
			}
	 	
		//sido 정보 => sidoAry
		//totalData => [{},{},{}....{}]
		let sidoAry =[]
		for (let date of totalData){
			if(sidoAry.indexOf(date.sido) == -1){
				sidoAry.push(date.sido)
			}
		}
		console.log(sidoAry);
		for (let sido of sidoAry){
			//<option vaule="서울특별시">서울특별시</option>
			let option = document.createElement('option');
			option.value = sido;
			option.innerText = sido;
			let search = document.getElementById('search');
			search.appendChild(option);
		}
	 }
		
	
 	 // 보여줄 필드 생성
	 let fields = ['id', 'centerName','phoneNumber','sido', 'zipCode']
 	 
	 // 센터 정보 생성하기(tr)
	 function makeRow(obj = {}){
	   let tr = document.createElement('tr');
	   for (let field of fields) {
		 let td = document.createElement('td');
		 if(field == 'centerName'){
			 let ahref = document.createElement('a');
			 // ahref.href = 'map.jsp';
			 ahref.setAttribute('href', 'map.jsp?lat='+obj.lat+'&lng='+obj.lng);  
			 ahref.target = ('target', 'map.jsp?centerName='+obj.centerName);
			 ahref.innerText = obj[field];
			 td.appendChild(ahref);
		 }else{
			 td.innerText = obj[field];
		 }
		 tr.appendChild(td);
	   }
	   return tr;
	 }
	 
	 document.querySelector('#searchBtn').addEventListener('click', findFnc2);
	 
	 function findFnc2 () {
		 console.log(totalData);
		 // 1.기존 목록 clear 2.입력값 비교 vs totalData 3.tbody.appendChild(makeRow(obj))
		 document.getElementById('list').innerHTML = "";
		 for (let center of totalData){
			 if(center.sido == document.getElementById('search').value){
				 document.getElementById('list').appendChild(makeRow(center));
			 }
		 }
	 }
	 
	 function findFnc1 () {
		
		  let trs = document.querySelectorAll('tbody tr');
		  let ary = [];
		  for (let tr of trs) {
			 if(tr.children[3].innerText == document.getElementById('search').value){
				 ary.push(tr);
			 }
		  }
		  console.log(ary);
		  //
		  document.getElementById('list').innerHTML = "";
		  for (let tr of ary) {
			  document.getElementById('list').appendChild(tr);
		  }
		}
</script>
</body>
</html>