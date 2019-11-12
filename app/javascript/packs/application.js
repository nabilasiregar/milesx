import "bootstrap";

import $ from 'jquery'

import { airport } from '../plugins/airport-input'
import { initFlatpickr } from '../plugins/init_flatpickr'
import { initSelect2 } from '../plugins/initSelect2'

window.$ = $;
airport()
initFlatpickr()
initSelect2()

    console.log(Rails)
  const card = (flight) => {
  var image  = `/assets/airline_logos/${flight.airlineIata}.png`;
  console.log(image)
  return `
  <div class="my-2">
  <input class="mr-3" type="checkbox" />
  <img src='${image}' width=30 height=30> ${flight.airlineIata}${flight.flightNumber} - ${flight.departureTime}
  </div>`
  }

  const displayCard = (flight) =>{
    const box = document.querySelector("#flight-numbers")
    box.insertAdjacentHTML("afterbegin", card(flight))
  }


  const departure = document.querySelector("#departure-iata").innerText
  const arrival = document.querySelector("#arrival-iata").innerText
  fetch(`http://aviation-edge.com/v2/public/routes?key=abe08f-cf2f23&departureIata=${departure}&arrivalIata=${arrival}`)
  .then(response => response.json())
  .then((data) => {
    console.log(data)
    if (data.errors == undefined){
      data.forEach((flight) =>{
      displayCard(flight)
      })

    }
  });

