import mapboxgl from 'mapbox-gl';
import 'mapbox-gl/dist/mapbox-gl.css';

const buildMap = (mapElement, mapElementName, minZoom, maxZoom, styleUrl) => {
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    return new mapboxgl.Map({
        container: `${mapElementName}`,
        // style: 'mapbox://styles/mapbox/streets-v11',
        // style: 'mapbox://styles/mapbox/sattelite-v11',
        style: `${styleUrl}`,
        minZoom: minZoom,
        maxZoom: maxZoom,
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
            .setLngLat([marker.lng, marker.lat])
            .setPopup(popup) // add this
            .addTo(map);
    });
};

const fitMapToMarkers = (map, markers, myZoom) => {
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([marker.lng, marker.lat]));
    map.fitBounds(bounds, { padding: 70, zoom: myZoom, minZoom: 0, maxZoom: 12, duration: 0 });
};


const initMapbox = (divName, styleUrl, zoom, minZoom, maxZoom) => {
    const mapElement = document.getElementById(`${divName}`);
    //const mapElementShow = document.getElementById('map-island-show');

    if (mapElement) { // only build a map if there's a div#map to inject into
        const map = buildMap(mapElement, `${divName}`, minZoom, maxZoom, styleUrl)
        map.addControl(new mapboxgl.NavigationControl()); // Add + / - controls to zoom
        // const markers = JSON.parse(mapElement.dataset.markers);




        addMarkersToMap(map, markers);
        //const zoom = 0;
        fitMapToMarkers(map, markers, zoom);
    }

    // if (mapElementShow) { // only build a map if there's a div#map to inject into
    //   const mapShow = buildMap(mapElementShow,'map-island-show',5,12,urlShow)
    //   mapShow.addControl(new mapboxgl.NavigationControl()); // Add + / - controls to zoom
    //   const markersShow = JSON.parse(mapElementShow.dataset.markers);
    //   addMarkersToMap(mapShow,markersShow);
    //   const zoom = 3;
    //   fitMapToMarkers(mapShow,markersShow,zoom);
    // }
};




export { initMapbox };