#!/usr/bin/env ruby1.9.1
require File.expand_path('../../config/environment', __FILE__)

def read_sensors
	#read input from sensors http://lm-sensors.org/
	sensors = `sensors`
	#regex to interpret the fan, right now only grabbing the first fans RPM, don't have a machine with multiple to test with yet
	fan_re = /fan1: *?(\d*?) RPM/
	m = fan_re.match(sensors)
	if m
		fan = m[1]
	else
		fan = 0
	end

	temp_re = /: *?\+([1-9]\d*.\d)/
	m = sensors.scan(temp_re)
	average_temp = m.collect{|i| i[0].to_f}.inject{|sum,x| sum + x }/m.size

	@reading = Reading.new(:fan => fan.to_f,:temp => average_temp)
	@reading.save
end

read_sensors