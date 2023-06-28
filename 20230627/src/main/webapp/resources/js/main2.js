/**
 * main2.js
 */
console.log("main2.js");

// 버튼 : 클릭 이벤트 등록.
document.getElementById('saveBtn').addEventListener('click', function(e){
	let name = document.getElementById('name').value;
	let age = document.getElementById('age').value;
	let score = document.getElementById('score').value;
	//  <tr><td>홍길동</td><td>20</td><td>85</td></tr>
	let obj ={
		name : name,
		age : age,
		score : score
	}
	let tr = document.createElement('tr');
	//속성값.
	for(let prop in obj){  // prop는 속성. obj는 객체
		let td = document.createElement('td');
		td.innerText = obj[prop];
		tr.appendChild(td); 
	} //<tr><td>홍길동</td><td>20</td><td>85</td></tr>
	
	//삭제버튼. <tr><td><button>삭제</button></td></tr>
	let td = document.createElement('td');
	let btn = document.createElement('button');
	btn.innerText = '삭제';
	// 버튼의 삭제 이벤트.
	btn.addEventListener('click', function(e){
		console.log(e.target.parentElement.parentElement);
		e.target.parentElement.parentElement.remove();
	});
	td.appendChild(btn); //<td><button>삭제</button></td>
	tr.appendChild(td); //<tr><td>...</td></tr>
	
	console.log(tr);
	document.getElementById('target').appendChild(tr); // tbody의 id가 target임. <tbody><tr>...</tr></tbody> 이걸 의미.
	
	//initialize.
	document.getElementById('name').value = "";
	document.getElementById('age').value = "";
	document.getElementById('score').value = "";
	document.getElementById('name').focus();
})

