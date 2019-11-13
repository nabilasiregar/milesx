import "bootstrap";

import $ from 'jquery'

import { airport } from '../plugins/airport-input'
import { initFlatpickr } from '../plugins/init_flatpickr'
import { initSelect2 } from '../plugins/initSelect2'

window.$ = $;
airport()
initFlatpickr()
initSelect2()


  const card = (flight) => {
  var image  = `/assets/airline_logos/${flight.airlineIata}.png`;

  return `
  <div class="my-2 d-flex justify-content-between" id="option-departure">
    <div>
      <input data-flight="${flight.airlineIata}${flight.flightNumber}" class="form-inputs mr-3" type="checkbox" />
      <img src='${image}' width=30 height=30>
      ${flight.airlineIata}${flight.flightNumber} - ${flight.departureTime} - ${flight.arrivalTime};
    </div>
  </div>

  `
  }

  const displayCard = (flight) =>{
    const box = document.querySelector("#flight-numbers")
     // the next line && statement is to display only the singapore airline flights
    if (flight.departureTime !== null && flight.airlineIata == "SQ") {
      box.insertAdjacentHTML("afterbegin", card(flight))
    }
  }

  async function processData(array) {
    let i = 0
    for (i; i < array.length; i++) {
      await displayCard(array[i])
    }
    return document.querySelectorAll('#option-departure input')
  }

  // const airlineName = document.querySelector("#airline-name").dataset.airline


  const departure = document.querySelector("#departure-iata").innerText
  const arrival = document.querySelector("#arrival-iata").innerText
  fetch(`https://aviation-edge.com/v2/public/routes?key=abe08f-cf2f23&departureIata=${departure}&arrivalIata=${arrival}`)
  .then(response => response.json())
  .then((data) => {
    console.log(data)
    if (data.errors == undefined){
      processData(data).then((inputs) =>
      inputs.forEach((input) =>{
        input.addEventListener('click', (e) =>{
          let flightNumber = e.target.dataset.flight
          inputs.forEach( checkbox => checkbox.checked = false )
          e.target.checked = true
          document.querySelector("#booking_flight_number").value = flightNumber
        })
      })
      )
    }
  });



  //
  // console.log(inputs)
