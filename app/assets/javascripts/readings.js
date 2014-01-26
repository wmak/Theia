var j = 10
var temperatures = [];
var fan = [];
var options = {"colors" : "#FF0000"}
function updateData(info) {
	$.get("readings/" + j, function( request ){
		temperatures = [];
		fan = [];
		for (var i=0; i < request.length; i++){
			temperatures.push([new Date (request[i].created_at), request[i].temp]);
			fan.push([new Date (request[i].created_at), request[i].fan]);
		}
		tempChart.updateOptions({"file" : temperatures});
		fanChart.updateOptions({"file" : fan});
	}, "json");
}
window.onload = function WindowLoad(event) {
	tempChart = new Dygraph(document.getElementById("temp_div"), temperatures, jQuery.extend({labels : ["Date", "Temperatures"]}, options));
	fanChart = new Dygraph(document.getElementById("fan_div"), fan, jQuery.extend({labels : ["Date", "Fan RPM"]}, options));
	updateData();
	setInterval(updateData, 20000)
}