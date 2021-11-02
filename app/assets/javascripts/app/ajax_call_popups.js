function call_popup(){
  // ----- Add popup content to DOM -----
  $(".popup-call").submit(function(event){
    // Prevent redirection
    event.preventDefault();

    var form = $(this);
    var url  = $(form).attr("action");
    var type = $(form).attr("method");

    $.ajax({
      url: url,
      type: type,
      data: $(form).serialize(),
      beforeSend: function(){
      },
      success: function(data){
        form.find('.popup_ajaxified').addClass('soft-ml-box-shadow');
        form.find('.popup_ajaxified').html(data);
      },
      completed: function(){
        // remove loader
      },
      error: function(data){
        alert("Fatal Error");
      },
    });

    // ----- Remove popup content to DOM -----
    window.addEventListener('click', function(event){
      $('.popup_ajaxified').removeClass('soft-ml-box-shadow');
      $(".popup_ajaxified").html('');
    });
  });
};
