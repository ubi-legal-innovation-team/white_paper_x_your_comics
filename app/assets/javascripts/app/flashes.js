const displayFlashes = () => {
  var notice = document.getElementById('notice'),
      alert  = document.getElementById('alert');

  if(notice){
    notice.classList.add('visible');
    setTimeout(function(){notice.classList.add('invisible')}, 3000)
    setTimeout(function(){notice.remove();}, 3500);
  };

  if(alert){
    alert.classList.add('visible');
    setTimeout(function(){alert.classList.add('invisible')}, 3000)
    setTimeout(function(){alert.remove();}, 3500);
  };
};
