function search(loader_svg){
  $("#ajax_search").submit(function(event){
    // Prevent redirection
    event.preventDefault();

    var form = $(this),
        url  = $(form).attr("action"),
        type = $(form).attr("method");

    $.ajax({
      url: url,
      type: type,
      data: $(form).serialize(),
      beforeSend: function(){
        // add loader
        $("#ajax_search").append(`<div class="absolute centered loader-box">${loader_svg}</div>`);
      },
      success: function(data){
        $(form).find('input:submit').removeAttr('disabled');
        $("#ajaxified_partial").html(data);
        // remove loader
        $('.loader-box').remove();
	  	// ajax_calls_modals.js
	  	call_modal($('.modal-call'))
	  	
      },
      completed: function(){
        // remove loader
        $('.loader-box').remove();
      },
      error: function(data){
        alert("Fatal Error");
      },
    });
  });
};