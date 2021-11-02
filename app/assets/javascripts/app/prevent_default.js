const preventDefault = () => {
  const disabled_links   = document.querySelectorAll('a.disabled');
  const disabled_buttons = document.querySelectorAll('button.disabled');

  disabled_links.forEach(element => {
    element.addEventListener('click', function(event){
      event.preventDefault();
    });
  });

  disabled_buttons.forEach(element => {
    element.addEventListener('click', function(event){
      event.preventDefault();
    });
  });
};
