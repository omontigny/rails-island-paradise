import mapboxgl from 'mapbox-gl';

const buildMap = (mapElement) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v11'
    // style: 'mapbox://styles/mapbox/sattelite-v9'
  });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .addTo(map);
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
  map.fitBounds(bounds, { padding: 70, minZoom: 3, maxZoom: 15, duration: 0 });
};

// const initMapbox = () => {
//   const mapElement = document.getElementById('map-island-index');
//   if (mapElement) {
//     const map = buildMap(mapElement);
//     const markers = JSON.parse(mapElement.dataset.markers);
//     addMarkersToMap(map, markers);
//     fitMapToMarkers(map, markers);
//   }
// };


const initMapbox = () => {
  const mapElement = document.getElementById('map-island-index');

  if (mapElement) { // only build a map if there's a div#map to inject into
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map-island-index',
      style: 'mapbox://styles/mapbox/streets-v10',
      //style: 'mapbox://styles/mapbox/sattelite-v9'
      zoom: 13,
    });

    const markers = JSON.parse(mapElement.dataset.markers);
    markers.forEach((marker) => {
    new mapboxgl.Marker()
      .setLngLat([ marker.lng, marker.lat ])
      .addTo(map);
      // map.addControl(new mapboxgl.NavigationControl()); // Add + / - controls to zoom
  });

  fitMapToMarkers(map,markers);



  }
};

export { initMapbox };
