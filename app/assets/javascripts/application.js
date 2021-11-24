//= require jquery
//= require jquery.turbolinks
//= require rails-ujs
//= require turbolinks
//= require selectize
//= require activestorage
//= require trix/dist/trix
//= require_tree ./app

const main = () => {

  var loader_svg = '<svg width="50" height="52" viewBox="0 0 15 16" fill="none" xmlns="http://www.w3.org/2000/svg"><g clip-path="url(#clip0)"><path d="M14.9953 7.77371C14.8318 -0.206075 4.22919 -3.16769 0.146895 4.29558L0.755804 4.7339C0.453137 5.36392 0.239438 6.03292 0.120833 6.72174C0.0409059 7.16588 0.000471233 7.61622 0 8.0675C4.19243e-08 10.0569 0.7903 11.9649 2.19705 13.3716C3.60379 14.7784 5.51175 15.5687 7.50118 15.5687C9.49062 15.5687 11.3986 14.7784 12.8053 13.3716C14.2121 11.9649 15.0024 10.0569 15.0024 8.0675C15.0024 7.97115 15 7.87322 14.9953 7.77371ZM13.7703 7.91586C13.7703 8.00116 13.7703 8.08645 13.7703 8.17175V8.21439C13.7347 9.01259 13.5624 9.79875 13.2609 10.5387C12.9204 11.3232 12.4248 12.0308 11.8038 12.6189C10.6554 13.7401 9.12898 14.3909 7.52488 14.4433C5.43042 14.5143 3.57526 13.415 2.42142 11.7683C2.06472 11.2975 1.78189 10.7749 1.58269 10.2188C1.49741 9.99427 1.43162 9.76281 1.38604 9.52698C1.2946 9.11306 1.24853 8.69042 1.24862 8.26652C1.24762 7.29683 1.48004 6.34116 1.92624 5.48023L1.27231 5.0585L1.94993 4.01364C2.15518 3.68763 2.39336 3.38356 2.66072 3.1062C3.43696 2.33584 4.40129 1.78203 5.45786 1.49981C6.51444 1.21759 7.62647 1.21677 8.68346 1.49745C10.0062 1.81169 11.1997 2.52642 12.1012 3.54409C13.0027 4.56175 13.5682 5.83279 13.7206 7.18375V7.24772C13.7206 7.27852 13.7206 7.30932 13.7206 7.34012C13.7206 7.42542 13.7348 7.51308 13.7395 7.60312C13.7395 7.63629 13.7395 7.66946 13.7395 7.70263C13.7395 7.7358 13.7395 7.80688 13.7395 7.86137L13.7703 7.91586Z" fill="#000"/><path d="M8.76639 7.81892C8.76639 8.47319 8.236 9.00357 7.58174 9.00357C6.92748 9.00357 6.39709 8.47319 6.39709 7.81892C6.39709 7.16466 6.92748 6.63428 7.58174 6.63428C8.236 6.63428 8.76639 7.16466 8.76639 7.81892Z" fill="#000"/><path class="rotate-slow-360" d="M7.58176 7.82362V2.13232" stroke="#000"/><path class="rotate-speed-360" d="M7.58176 7.81885H12.3251" stroke="#000"/></g><defs><clipPath id="clip0"><rect width="15" height="15.5615" fill="white"/></clipPath></defs></svg>';

  // ajax_calls_modals.js
  call_modal();

  // ajax_calls_dropdowns.js
  call_dropdown();

  // ajax_calls_popups.js
  call_popup();

  // ajax_search.js
  if (document.getElementById('ajax_search')) {
    search(loader_svg);
  };

  // carousel.js
  var labels = document.querySelectorAll('.carousel label'),
      right  = document.querySelector('.carousel .carousel-right'),
      left   = document.querySelector('.carousel .carousel-left'),
      count  = 1;

  if (labels) {
    labels.forEach(element => {
      element.addEventListener('click',function(){slidesNavigationCarousel(event,labels,this)}, false)
    });
  };

  if (right && left) {
    arrowNavigationCarousel(right,left,count,labels);
  };

  // dropdowns.js
  var active_dropdownable = document.querySelectorAll('.dropdownable-svg svg'),
      trigger_slideup     = document.querySelectorAll('.trigger-slideup-dropdown');

  if (active_dropdownable) {
    dropdownable(active_dropdownable);
  };

  if (trigger_slideup) {
    trigger_slideup.forEach(element => {
      element.addEventListener('click',function(){triggerSlideupDropdown(event)}, false);
    });
  };

  // flashes.js
  displayFlashes();

  // grid_animations.js
  handleGridAnimation();

  // pagy_items.js
  var select = document.getElementById('items_requesters') || document.getElementById('items_projects');

  if(select){
    select.addEventListener('change',selectItemsPerPage);
  };

  // prevent_default.js
  preventDefault();

  // selectize.js
  selectize($('select.selectize'));
  
};

Turbolinks.setProgressBarDelay(10);
document.addEventListener('turbolinks:load', main);

// prevent turbolinks unload when user refresh or reload the page
if (performance.navigation.type == 1 || performance.navigation.type == 0) {
  $(document).ready(main);
};
