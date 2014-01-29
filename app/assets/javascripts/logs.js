var memory = [[1,1]];
var options = {"colors" : "#FF0000"}
var regex = /KiB Mem:.*?\d*? total,.*?(\d*?) used/;
function updateMem() {
	$.get("logs/50", function( request ){
		memory = [];
		for (var i=0; i < request.length; i++){
			var myArray = regex.exec(request[i].reading);
			memory.push([new Date (request[i].created_at), myArray[1]/1024]);
		}
		memChart.updateOptions({"file" : memory});
	}, "json");
}
function MemLoad(event) {
	memChart = new Dygraph(document.getElementById("mem_div"), memory, jQuery.extend({labels : ["Date", "Memory usage"]}, options));
	updateMem();
	setInterval(updateMem, 20000)
}