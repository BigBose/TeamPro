	window.onload = function() {
		var mymap = document.getElementById("map");
		var latlng = [ [ 37.570535, 126.983648 ], [ 37.569693, 126.983219 ],
				[ 37.570408, 126.981899 ], [ 37.570535, 126.983516 ],
				[ 37.569693, 126.985417 ] ];

		var gmap = new google.maps.Map(mymap, {
			zoom : 3,
			left : new google.maps.LatLng(latlng[0][0], latlng[0][1]),
			center : new google.maps.LatLng(latlng[0][0], latlng[0][1]),
			mapTypeId : google.maps.MapTypeId.ROADMAP
		});

		var marker, i;
		for (i = 0; i < latlng.length; i++) {
			marker = new google.maps.Marker({
				position : new google.maps.LatLng(latlng[i][0], latlng[i][1]),
				map : gmap,
			});
		}

		var directionsDisplay = new google.maps.DirectionsRenderer({
			map : gmap
		});

		var request = {
			destination : new google.maps.LatLng(latlng[0][0], latlng[0][1]),
			origin  :new google.maps.LatLng(latlng[3][0], latlng[3][1]),
			travelMode : google.maps.TravelMode.DRIVING
		};

		var directionsService = new google.maps.DirectionsService();
		directionsService.route(request, function(response, status) {
			if (status == google.maps.DirectionsStatus.OK) {
				// Display the route on the map.
				directionsDisplay.setDirections(response);
			}
		});
	};