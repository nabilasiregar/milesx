import "bootstrap";

import $ from 'jquery'

import { airport } from '../plugins/airport-input'
import { initFlatpickr } from '../plugins/init_flatpickr'
import { initSelect2 } from '../plugins/initSelect2'

window.$ = $;
airport()
initFlatpickr()
initSelect2()
