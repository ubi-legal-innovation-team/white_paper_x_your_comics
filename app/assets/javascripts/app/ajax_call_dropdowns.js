function call_dropdown(){
  // ----- Add dropdown content to DOM -----
  $(".dropdown-call").submit(function(event){
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
        // remove notification count
        if(event.currentTarget.id.includes('notifications')){
          $('#notifications_count').remove();
        }
      },
      success: function(data){
        $(form).removeClass('active');
        $(form).addClass('active');
        $('#dropdown_ajaxified').addClass('soft-ml-box-shadow');
        $("#dropdown_ajaxified").html(data);
      },
      completed: function(){
        // remove loader
      },
      error: function(data){
        alert("Fatal Error");
      },
    });

    // ----- Remove dropdown content to DOM -----
    window.addEventListener('click', function(event){
      $(form).removeClass('active');
      $('#dropdown_ajaxified').removeClass('soft-ml-box-shadow');
      $("#dropdown_ajaxified").html('');
    });
  });
};
