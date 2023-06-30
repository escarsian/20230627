/**
 * main6.js 
 */
document.querySelectorAll('#page-content-wrapper table')
	.forEach(function (tbl) {
		tbl.innerHTML = "";
	});
document.querySelectorAll('#page-content-wrapper h3')
	.forEach(function (elem) {
		elem.remove();
	});

const str = 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Iste perferendis eum quaerat placeat ipsa possimus optio minima vel consequatur adipisci mollitia maxime, deserunt nulla sed inventore distinctio quae est necessitatibus?';

const strAry = str.split(' ');



/*document.querySelectorAll('.outer span').addEventListener( 'keydown' , function(e){
	if(e.key === 'Enter'){
		
	}
})*/

document.querySelector('#userInput').addEventListener('change', function(e){
	//this는 이벤트를 받는 element.
	let userVal = this.value;
	document.querySelectorAll('.outer span').forEach(function (item){
		if (item.innerText == userVal){
			item.remove();
		}
	})
	this.value = "";
})

let secs = 100;
let job = setInterval(function () {
	//document.getElementById('time').innerText = new Date();
	document.getElementById('time').innerText = secs--;
	if (secs < 0) {
		clearInterval(job);
	}
}, 1000)

let outer = document.querySelector('div.outer');
strAry.forEach(function (word) {
	let span = document.createElement('span');
	span.innerText = word;
	outer.appendChild(span);
})