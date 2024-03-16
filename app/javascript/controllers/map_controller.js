import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl' // Don't forget this!

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    mapboxgl.accessToken = this.apiKeyValue
    console.log(this.mapTarget)

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/dark-v11"
    })

    this.#addMarkersToMap()
    this.#fitMapToMarkers()
    this.#computeDistance()

    // this.map.addControl(
    //   new MapboxDirections({
    //   accessToken: mapboxgl.accessToken
    //   }),
    //   'top-left'
    //   );
    }


    #addMarkersToMap() {
      this.markersValue.forEach((marker) => {
        const popup = new mapboxgl.Popup().setHTML(marker.info_window_html)

        // Create a HTML element for your custom marker
        const customMarker = document.createElement("div")
        customMarker.innerHTML = marker.marker_html

        // Pass the element as an argument to the new marker
        new mapboxgl.Marker(customMarker)
          .setLngLat([marker.lng, marker.lat])
          .setPopup(popup)
          .addTo(this.map)
    })
  }
    #fitMapToMarkers() {
      const bounds = new mapboxgl.LngLatBounds()
      this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
      this.map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: .5 })
  }

  #computeDistance() {
    const itemLat = this.markersValue[0].lat
    const itemLng = this.markersValue[0].lng
    const userLat = this.markersValue[1].lat
    const userLng = this.markersValue[1].lng

    console.log(itemLat, itemLng, userLat, userLng);

    const url = `https://api.mapbox.com/directions/v5/mapbox/cycling/${itemLng},${itemLat};${userLng},${userLat}?access_token=${this.apiKeyValue}`;
    console.log(url);


    fetch(url)
    .then(response => response.json())
    .then((data) => {
    console.log(data);
    });
    }
}
