const loader = (loader_svg,form) => {
  var button     = form.querySelector('input[type="submit"]');

  button.addEventListener('click', function(){
    button.insertAdjacentHTML('afterend',`<div class="absolute top-right loader-box">${loader_svg}</div>`);
  });
};