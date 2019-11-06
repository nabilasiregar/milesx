import flatpickr from "flatpickr";

const initFlatpickr = () => {
  const departureDateInput = document.getElementById('depart-date');
  const returnInput = document.getElementById('return-date');
  departureDateInput && flatpickr(departureDateInput)
  returnInput && flatpickr(returnInput)
}


export { initFlatpickr }
