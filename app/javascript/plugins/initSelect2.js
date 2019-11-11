import "select2/dist/css/select2.css"
import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  $('#miles_profile_programme').select2(); // (~ document.querySelectorAll)
};

export { initSelect2 }
