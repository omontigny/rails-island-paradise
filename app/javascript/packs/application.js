require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

// require("@rails/ujs").start()
require("turbolinks").start()
// require("@rails/activestorage").start()
// require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";
import { initFlatpickr } from "../plugins/init_flatpickr";
import "../plugins/moment";
import { initMapbox } from '../plugins/init_mapbox';
import { totalPriceCalculation } from '../components/total_price_calculation';
import { initSelect2 } from '../plugins/init_select2';
import { initUpdateNavbarOnScroll } from '../components/navbar';




// Internal imports, e.g:
//import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  initUpdateNavbarOnScroll();
  initFlatpickr();
  initSelect2();
  const urlShow = 'mapbox://styles/oliver498/ckhzau3cc15if19pgo8k4tynm';
  const urlIndex = 'mapbox://styles/oliver498/ckhzau3cc15if19pgo8k4tynm';
  initMapbox('map-island-index',urlIndex,0,0,12);
  initMapbox('map-island-show',urlShow,2,0,10);

  totalPriceCalculation();

});



