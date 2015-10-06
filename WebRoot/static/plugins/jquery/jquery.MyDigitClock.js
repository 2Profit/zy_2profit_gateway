/**
 * @author Paul Chan / KF Software House 
 * http://www.kfsoft.info
 *
 * Version 0.5
 * Copyright (c) 2010 KF Software House
 *
 * Licensed under the MIT license:
 * http://www.opensource.org/licenses/mit-license.php
 *
 */
	
(function($) {

    var _options = {};
	var _container = {};

	jQuery.fn.MyDigitClock = function(options) {
		var id = $(this).get(0).id;
		_options[id] = $.extend({}, $.fn.MyDigitClock.defaults, options);
		
		//time
		var currentDate = new Date(_options[id].time);
		_options[id].timeInMillis = currentDate.getTime();
		
		return this.each(function()
		{
			_container[id] = $(this);
			showClock(id);
		});
		
		function showClock(id)
		{
			_options[id].timeInMillis += 1000;
			var d = new Date();
			d.setTime(_options[id].timeInMillis);
			var h = d.getHours();
			var m = d.getMinutes();
			var s = d.getSeconds();
			var ampm = "";
			if (_options[id].bAmPm)
			{
				if (h>12)
				{
					h = h-12;
					ampm = " PM";
				}
				else
				{
					ampm = " AM";
				}
			}
			
			var templateStr = _options[id].timeFormat + ampm;
			templateStr = templateStr.replace("{HH}", getDD(h));
			templateStr = templateStr.replace("{MM}", getDD(m));
			templateStr = templateStr.replace("{SS}", getDD(s));
		
			var obj = $("#"+id);
			obj.css("fontSize", _options[id].fontSize);
			obj.css("fontFamily", _options[id].fontFamily);
			obj.css("color", _options[id].fontColor);
			obj.css("background", _options[id].background);
			obj.css("fontWeight", _options[id].fontWeight);
		
			//change reading
			obj.html(templateStr)
			
			//toggle hands
			if (_options[id].bShowHeartBeat)
			{
				obj.find("#ch1").fadeTo(800, 0.1);
				obj.find("#ch2").fadeTo(800, 0.1);
			}
			setTimeout(function(){showClock(id)}, 1000);
		}
		
		function getDD(num)
		{
			return (num>=10)?num:"0"+num;
		}
		
		function refreshClock()
		{
			setupClock();
		}
	}
	
	//default values
	jQuery.fn.MyDigitClock.defaults = {
		time : null,
		fontSize: '',
		fontFamily: '',
		fontColor: '',
		fontWeight: '',
		background: '',
		timeFormat: '{HH}<span id="ch1">:</span>{MM}<span id="ch2">:</span>{SS}',
		bShowHeartBeat: false,
		bAmPm:false
	};

})(jQuery);