const openPopUp = (event,uniq_pop_ups) => {
  var pop_up = document.querySelector('.' + event.currentTarget.getAttribute('id'));

  uniq_pop_ups.push(pop_up);

  uniq_pop_ups.forEach(element => {
    var pop_upable = false;
    pop_upable     = element.className.includes(event.currentTarget.getAttribute('id'));

    if (pop_upable){
      element.classList.add('active');
    } else {
      element.classList.remove('active');
    };
  });
};

const closeAllPopUps = (event,uniq_pop_ups) => {
  uniq_pop_ups.forEach(element => {
    element.classList.remove('active');
  });
  uniq_pop_ups = [];
};
