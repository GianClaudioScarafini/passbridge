import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl' // Don't forget this!

export default class extends Controller {
    static targets = [ "map", "distance", "link" ]
    static values  = {
        apiKey: String,
        markers: Array
    }

    connect() {
        mapboxgl.accessToken = this.apiKeyValue
        this.map = new mapboxgl.Map({
            container: this.mapTarget,
            style: "mapbox://styles/mapbox/dark-v11"
        })
        this.#addMarkersToMap()
        this.#fitMapToMarkers()
        this.#computeDistance()
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
        const price = document.getElementById('item-price').getAttribute('data-price')
        const url = `https://api.mapbox.com/directions/v5/mapbox/driving/${itemLng},${itemLat};${userLng},${userLat}?access_token=${this.apiKeyValue}&geometries=geojson`

        fetch(url)
        .then(response => response.json())
        .then((data) => {
            // display distance
            const distance = data.routes[0].legs[0].distance
            this.distanceTarget.innerText = `${(distance/1000).toFixed(1)} km`
            //adding distance to link
            const distanceLink = `?distance=${distance}`
            const priceLink = `&price=${price}`
            this.linkTarget.href = this.linkTarget.href + distanceLink + priceLink



            // draw directions
            const waypoints = data.routes[0].geometry.coordinates
            this.map.addSource('route', {
                'type': 'geojson',
                'data': {
                    'type': 'Feature',
                    'properties': {},
                    'geometry': {
                        'type': 'LineString',
                        'coordinates': waypoints
                    }
                }
            })

            this.map.addLayer({
                'id': 'route',
                'type': 'line',
                'source': 'route',
                'layout': {
                    'line-join': 'round',
                    'line-cap': 'round'
                },
                'paint': {
                    'line-color': '#888',
                    'line-width': 8
                }
            })
        })
    }
}
