/**
 * main4.js
 */
let jsonData = `[{"id":1,"first_name":"Sherwood","last_name":"Wield","email":"swield0@chron.com","gender":"Male","salary":2099},
{"id":2,"first_name":"Corly","last_name":"Lumber","email":"clumber1@blogger.com","gender":"Female","salary":1141},
{"id":3,"first_name":"Archie","last_name":"Budgeon","email":"abudgeon2@wikipedia.org","gender":"Male","salary":4553},
{"id":4,"first_name":"Irma","last_name":"O'Bradden","email":"iobradden3@list-manage.com","gender":"Female","salary":1049},
{"id":5,"first_name":"Clark","last_name":"Allenby","email":"callenby4@state.gov","gender":"Male","salary":2395},
{"id":6,"first_name":"Dorey","last_name":"Banbury","email":"dbanbury5@phpbb.com","gender":"Female","salary":4873},
{"id":7,"first_name":"Marion","last_name":"Southcombe","email":"msouthcombe6@ucoz.com","gender":"Female","salary":1325},
{"id":8,"first_name":"Tristam","last_name":"Kirckman","email":"tkirckman7@t.co","gender":"Male","salary":1247},
{"id":9,"first_name":"Kaitlyn","last_name":"Perfili","email":"kperfili8@fema.gov","gender":"Female","salary":1473},
{"id":10,"first_name":"Redd","last_name":"De Hooch","email":"rdehooch9@pbs.org","gender":"Male","salary":4575},
{"id":11,"first_name":"Josi","last_name":"Ciobotaru","email":"jciobotarua@cam.ac.uk","gender":"Female","salary":3449},
{"id":12,"first_name":"Sheffie","last_name":"Spiby","email":"sspibyb@sakura.ne.jp","gender":"Male","salary":2266},
{"id":13,"first_name":"Brooks","last_name":"Spykins","email":"bspykinsc@vimeo.com","gender":"Male","salary":3987},
{"id":14,"first_name":"Cathleen","last_name":"Kindleysides","email":"ckindleysidesd@instagram.com","gender":"Non-binary","salary":4607},
{"id":15,"first_name":"Hendrik","last_name":"Haitlie","email":"hhaitliee@tumblr.com","gender":"Male","salary":1727}]`;

let data = JSON.parse(jsonData);
//console.log(data);

let xhtp = new XMLHttpRequest();
xhtp.open('get', 'chartData.do');
xhtp.send();
xhtp.onreadystatechange = function(){
	if(xhtp.readyState == 4 && xhtp.status == 200){
		console.log(xhtp.responseText);
		let data = JSON.parse(xhtp.responseText);
		console.log(data);
	}
}