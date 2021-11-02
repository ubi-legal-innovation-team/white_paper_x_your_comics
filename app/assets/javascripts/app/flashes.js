const displayFlashes = () => {
  var notice = document.getElementById('notice'),
      alert  = document.getElementById('alert');

  if(notice){
    setTimeout(function(){notice.style.right = '15px';}, 300);
    setTimeout(function(){notice.style.right = '-400px';}, 6000);
    setTimeout(function(){notice.remove();}, 7000);
  };

  if(alert){
    setTimeout(function(){alert.style.right = '15px';}, 300);
    setTimeout(function(){alert.style.right = '-400px';}, 6000);
    setTimeout(function(){alert.remove();}, 7000);
  };
};
