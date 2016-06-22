/**
 * @require common:widget/jquery/jquery.js
 */
(function($, wp, wps, window, undefined) {
	'$:nomunge';
	var $w = $(window),
	waypoints = [],
	oldScroll = -99999,
	didScroll = false,
	didResize = false,
	eventName = 'waypoint.reached',
	methods = {
		init: function(f, options) {
			this.each(function() {
				var $this = $(this),
				ndx = waypointIndex($this),
				base = ndx < 0 ? $.fn[wp].defaults: waypoints[ndx].options,
				opts = $.extend({},
				base, options);
				opts.offset = opts.offset === "bottom-in-view" ?
				function() {
					return $[wps]('viewportHeight') - $(this).outerHeight();
				}: opts.offset;
				if (ndx < 0) {
					waypoints.push({
						element: $this,
						offset: $this.offset().top,
						options: opts
					});
				}
				 else {
					waypoints[ndx].options = opts;
				}
				f && $this.bind(eventName, f);
			});
			$[wps]('refresh');
			return this;
		},
		remove: function() {
			return this.each(function() {
				var ndx = waypointIndex($(this));
				if (ndx >= 0) {
					waypoints.splice(ndx, 1);
				}
			});
		},
		destroy: function() {
			return this.unbind(eventName)[wp]('remove');
		}
	};
	function waypointIndex(el) {
		var i = waypoints.length - 1;
		while (i >= 0 && waypoints[i].element[0] !== el[0]) {
			i -= 1;
		}
		return i;
	}
	function triggerWaypoint(way, dir) {
		way.element.trigger(eventName, dir)
		 if (way.options.triggerOnce) {
			way.element[wp]('destroy');
		}
	}
	function doScroll() {
		var newScroll = $w.scrollTop(),
		isDown = newScroll > oldScroll,
		pointsHit = $.grep(waypoints,
		function(el, i) {
			return isDown ? (el.offset > oldScroll && el.offset <= newScroll) : (el.offset <= oldScroll && el.offset > newScroll);
		});
		if (!oldScroll || !newScroll) {
			$[wps]('refresh');
		}
		oldScroll = newScroll;
		if (!pointsHit.length) return;
		if ($[wps].settings.continuous) {
			$.each(isDown ? pointsHit: pointsHit.reverse(),
			function(i, point) {
				triggerWaypoint(point, [isDown ? 'down': 'up']);
			});
		}
		 else {
			triggerWaypoint(pointsHit[isDown ? pointsHit.length - 1: 0], [isDown ? 'down': 'up']);
		}
	}
	$.fn[wp] = function(method) {
		if (methods[method]) {
			return methods[method].apply(this, Array.prototype.slice.call(arguments, 1));
		}
		 else if (typeof method === "function" || !method) {
			return methods.init.apply(this, arguments);
		}
		 else if (typeof method === "object") {
			return methods.init.apply(this, [null, method]);
		}
		 else {
			$.error('Method ' + method + ' does not exist on jQuery' + wp);
		}
	};
	$.fn[wp].defaults = {
		offset: 0,
		triggerOnce: false
	};
	var jQMethods = {
		refresh: function() {
			$.each(waypoints,
			function(i, o) {
				var adjustment = 0,
				oldOffset = o.offset;
				if (typeof o.options.offset === "function") {
					adjustment = o.options.offset.apply(o.element);
				}
				 else if (typeof o.options.offset === "string") {
					var amount = parseFloat(o.options.offset),
					adjustment = o.options.offset.indexOf("%") ? Math.ceil($[wps]('viewportHeight') * (amount / 100)) : amount;
				}
				 else {
					adjustment = o.options.offset;
				}
				o.offset = o.element.offset().top - adjustment;
				if (oldScroll > oldOffset && oldScroll <= o.offset) {
					triggerWaypoint(o, ['up']);
				}
				 else if (oldScroll < oldOffset && oldScroll >= o.offset) {
					triggerWaypoint(o, ['down']);
				}
			});
			waypoints.sort(function(a, b) {
				return a.offset - b.offset;
			});
		},
		viewportHeight: function() {
			return (window.innerHeight ? window.innerHeight: $w.height());
		},
		aggregate: function() {
			var points = $();
			$.each(waypoints,
			function(i, e) {
				points = points.add(e.element);
			});
			return points;
		}
	};
	$[wps] = function(method) {
		if (jQMethods[method]) {
			return jQMethods[method].apply(this);
		}
		 else {
			return jQMethods["aggregate"]();
		}
	};
	$[wps].settings = {
		continuous: true,
		resizeThrottle: 200,
		scrollThrottle: 100
	};
	$w.scroll(function() {
		if (!didScroll) {
			didScroll = true;
			window.setTimeout(function() {
				doScroll();
				didScroll = false;
			},
			$[wps].settings.scrollThrottle);
		}
	}).resize(function() {
		if (!didResize) {
			didResize = true;
			window.setTimeout(function() {
				$[wps]('refresh');
				didResize = false;
			},
			$[wps].settings.resizeThrottle);
		}
	}).load(function() {
		$[wps]('refresh');
		doScroll();
	});
})(jQuery, 'waypoint', 'waypoints', this);