import mapboxgl from 'mapbox-gl';

const buildMap = (mapElement) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map-island-index',
    style: 'mapbox://styles/mapbox/streets-v11'
    // style: 'mapbox://styles/mapbox/sattelite-v9'
  });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.infoWindow); // add this

    // Create a HTML element for your custom marker
    const element = document.createElement('div');
    element.className = 'marker';
    element.style.backgroundImage = `url('${marker.image_url}')`;
    element.style.backgroundSize = 'contain';
    element.style.width = '35px';
    element.style.height = '35px';

    new mapboxgl.Marker(element)
      .setLngLat([ marker.lng, marker.lat ])
      .setPopup(popup) // add this
      .addTo(map);
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, minZoom: 0, maxZoom: 12, duration: 0 });
};


const initMapbox = () => {
  const mapElement = document.getElementById('map-island-index');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map-island-index',
      //style: 'mapbox://styles/oliver498/ckhxzcik207l119rzwfttqb5i'
      style: 'mapbox://styles/mapbox/streets-v11',
      //style: 'mapbox://styles/mapbox/sattelite-v9'
      minZoom: 0,
      maxZoom: 12,
    });
    map.addControl(new mapboxgl.NavigationControl()); // Add + / - controls to zoom


    const markers = JSON.parse(mapElement.dataset.markers);
    addMarkersToMap(map,markers);
  //   markers.forEach((marker) => {
  //   new mapboxgl.Marker()
  //     .setLngLat([ marker.lng, marker.lat ])
  //     .addTo(map);
  // });

  fitMapToMarkers(map,markers);



  }
};

export { initMapbox };
