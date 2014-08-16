$(document).ready(function () {
    // find all of the maps on the page
    var m = $('.map');
    
    if (m.length > 0) {
	// maps found on page, load Leaflet
	var l = $('<link rel="stylesheet" />');
	$('head').append(l);
	l.attr('href', 'http://cdn.leafletjs.com/leaflet-0.7.3/leaflet.css');
	$.getScript('http://cdn.leafletjs.com/leaflet-0.7.3/leaflet.js',
            function () {
		m.each(function () {
		    var $t = $(this);
		    var map = L.map(this);
		    map.setView([$t.attr('data-lat'), $t.attr('data-lon')], $t.attr('data-zoom'));

		    // Add Stamen Watercolor
		    L.tileLayer('http://{s}.tile.stamen.com/watercolor/{z}/{x}/{y}.jpg', {
			attribution: 'Map tiles by <a href="http://stamen.com">Stamen Design</a>, under <a href="http://creativecommons.org/licenses/by/3.0">CC BY 3.0</a>. Data by <a href="http://openstreetmap.org">OpenStreetMap</a>, under <a href="http://creativecommons.org/licenses/by-sa/3.0">CC BY SA</a>.'
		    }).addTo(map);

		    $.ajax({
			url: $t.attr('data-geojson'),
			dataType: 'json',
			success: function (data) {
			    L.geoJson(data, {
				onEachFeature: function (f, l) {
				    l.bindPopup(sprintf($t.attr('data-popup'), f.properties))
				}
			    }).addTo(map);
		    }});
		});
	    });
    }
});
			
