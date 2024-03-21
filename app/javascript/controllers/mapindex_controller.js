import { Controller } from "@hotwired/stimulus"
import mapboxgl from 'mapbox-gl' // Don't forget this!

export default class extends Controller {
    static targets = [ "map", "distance" ]
    static values  = {
        apiKey: String,
        markers: Array
    }

    connect() {
        const itemLat = this.markersValue[0].lat
        const itemLng = this.markersValue[0].lng
        const userLat = this.markersValue[1].lat
        const userLng = this.markersValue[1].lng
        const url = `https://api.mapbox.com/directions/v5/mapbox/driving/${itemLng},${itemLat};${userLng},${userLat}?access_token=${this.apiKeyValue}&geometries=geojson`

        fetch(url)
        .then(response => response.json())
        .then((data) => {
            // display distance
            const distance = data.routes[0].legs[0].distance
            if (distance < 100000) {
                this.distanceTarget.innerText = `${(distance/1000).toFixed(1)}km`
            } else {
                this.distanceTarget.innerText = `> 100 km`
            }
            // this.distanceTarget.innerText = `${(distance/1000).toFixed(1)}km`
        })
    }
}
