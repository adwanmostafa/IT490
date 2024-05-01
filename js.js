var timer = 10; 
var counter;
var file = document.getElementById('file').value

function startTimer() {
	counter = setInterval(countDown, 1000);
}

function countDown() {
	var display = document.getElementById("timer");
	display.innerHTML = timer;
	

	timer--;
	
	if (timer < 0) {
		clearInterval(counter);
		console.log(file);
		window.location.href = "download.php?file="+file;
	}
}		

startTimer();
			