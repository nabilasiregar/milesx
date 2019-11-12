import flatpickr from "flatpickr";

const initFlatpickr = () => {
  const departureDateInput = document.getElementById('depart-date');
  const returnInput = document.getElementById('return-date');
  const birthDayInput = document.getElementById('birth-date');
  const bookingDepartInput = document.getElementById('booking_departure_date')
  const bookingReturnInput = document.getElementById('booking_return_date')
  departureDateInput && flatpickr(departureDateInput)
  returnInput && flatpickr(returnInput)
  birthDayInput && flatpickr(birthDayInput)
  bookingDepartInput && flatpickr(bookingDepartInput)
  bookingReturnInput && flatpickr(bookingReturnInput)
}


export { initFlatpickr }
