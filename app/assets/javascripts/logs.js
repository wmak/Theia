var memory = [[1,1]];
var processor = [[1,1]];
var options = {"colors" : "#FF0000"}
var memregex = /KiB Mem:.*?\d*? total,.*?(\d*?) used/;
var cpuregex = /Cpu(?:.|\n)*Cpu\(s\):\s*(\d*\.\d*)/;
function updateMem() {
	$.get("logs/10", function( request ){
		memory = [];
		for (var i=0; i < request.length; i++){
			var myArray = memregex.exec(request[i].reading);
			memory.push([new Date (request[i].created_at), myArray[1]/1024]);
		}
		memChart.updateOptions({"file" : memory});
	}, "json");
}
function updateCpu() {
	$.get("logs/10", function( request ){
		processor = [];
		for (var i=0; i < request.length; i++){
			var result = cpuregex.exec(request[i].reading);
			if (result)
				processor.push([new Date (request[i].created_at), result[1]]);
		}
		cpuChart.updateOptions({"file" : processor});
	}, "json");
}
function updateLog(event) {
	updateMem();
	updateCpu();
}
function LogLoad(event) {
	memChart = new Dygraph(document.getElementById("mem_div"), memory, jQuery.extend({labels : ["Date", "Memory usage"]}, options));
	cpuChart = new Dygraph(document.getElementById("cpu_div"), processor, jQuery.extend({labels : ["Date", "CPU usage"]}, options));
	updateLog();
	setInterval(updateLog, 20000);
}