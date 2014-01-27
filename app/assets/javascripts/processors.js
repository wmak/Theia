var processor = [[1,1]];
var options = {"colors" : "#FF0000"}
function updateCpu() {
	$.get("processors/50", function( request ){
		processor = [];
		for (var i=0; i < request.length; i++){
			processor.push([new Date (request[i].created_at), request[i].cpu]);
		}
		cpuChart.updateOptions({"file" : processor});
	}, "json");
}
function CpuLoad(event) {
	cpuChart = new Dygraph(document.getElementById("cpu_div"), processor, jQuery.extend({labels : ["Date", "Cpu usage"]}, options));
	updateCpu();
	setInterval(updateCpu, 20000)
}