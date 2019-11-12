import $ from 'jquery';
import 'select2';

const initSelect2 = () => {
  if ($('#miles_profile_programme')) {
    $('#miles_profile_programme').select2(); // (~ document.querySelectorAll)
  }
};

export { initSelect2 }
