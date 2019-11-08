import flatpickr from "flatpickr";

const initFlatpickr = () => {
  const departureDateInput = document.getElementById('depart-date');
  const returnInput = document.getElementById('return-date');
  const birthDayInput = document.getElementById('birth-date');
  departureDateInput && flatpickr(departureDateInput)
  returnInput && flatpickr(returnInput)
  birthDayInput && flatpickr(birthDayInput)
}


export { initFlatpickr }
