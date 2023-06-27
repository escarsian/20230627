/**
 * main.js 
 */
console.log("main.js");
 
let obj = {name: "홍길동", age: 21, phone: "010-1111-2222"}
console.log(obj.name, obj['age']);
for(let prop in obj){
	console.log("속성: " + prop + ", 값: " + obj[prop]);
}

let ary = []
ary.push({name: "김민수", age: 24, phone: "010-2222-3333"});
ary.push(obj);
ary.push("황영길");
ary.pop();  //제일 마지막 꺼부터 제거.

console.log(ary);

for (let val of ary){
	for(let prop in val) {
		console.log(val[prop]);	
	}
}

let ulTag = document.createElement('ul'); 		//<ul />를 만들겠음.
for (let val of ary){
	let liTag = document.createElement('li');   //<li />를 만들겠음.
	liTag.innerText = val['name'];
	ulTag.appendChild(liTag);
	//button.
	let btn = document.createElement('button'); //<button>클릭</button>
	btn.innerText = '클릭';
	liTag.appendChild(btn);
}
console.log(ulTag);

document.getElementById('page-content-wrapper').appendChild(ulTag);

