const dropdownable = (active_dropdownable) => {
  if(active_dropdownable){
    active_dropdownable.forEach(function(element,index){
      element.addEventListener('click', function(){
        element.classList.toggle('active');
        $(element.parentNode).nextAll('.dropdown-element')[0].classList.toggle('dropdownable');
      });
    });
  };
};

const triggerSlideupDropdown = () => {
  var slideup_dropdown = document.querySelector(`.${event.currentTarget.id}`)
  slideup_dropdown.classList.toggle('active-20');
};
