/**
 * main5.js
 */
document.querySelectorAll('#page-content-wrapper table')
	    .forEach(function(tbl){
				 tbl.innerHTML = "";
				});
document.querySelectorAll('#page-content-wrapper h3')
		.forEach(function(elem){
			elem.remove();
		});

/*document.getElementById('userInput').addEventListener('change', function(e){
	let divData = new divData();
	let spanData = new spanData();
	divData.append('span', document.getElementById('userInput').innerText);
	
})*/

const array1 = ['a', 'b', 'c'];
array1.forEach(function(element, idx, ary){
	console.log(element, idx, ary)
});