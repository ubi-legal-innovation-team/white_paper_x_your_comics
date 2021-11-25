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
        setTimeout(function(){ $("#ajaxified_partial").html(data); }, 1000);
        // remove loader
        setTimeout(function(){ $('.loader-box').remove(); }, 1000);
	  	// ajax_calls_modals.js
	  	setTimeout(function(){ call_modal($('.modal-call')); }, 1000);
	  	
      },
      completed: function(){
        // remove loader
        setTimeout(function(){ $('.loader-box').remove(); }, 1000);
      },
      error: function(data){
        alert("Fatal Error");
      },
    });
  });
};