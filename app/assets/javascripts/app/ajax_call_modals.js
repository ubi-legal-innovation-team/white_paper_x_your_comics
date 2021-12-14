function call_modal(modal_button) {
// ----- Add modal content to DOM -----
  $(modal_button).submit(function(event) {
    // Prevent redirection
    event.preventDefault();

    var form = $(this),
        url  = $(form).attr("action"),
        type = $(form).attr("method");

    $.ajax({
      url: url,
      type: type,
      data: $(form).serialize(),
      beforeSend: function() {
        // add loader
      },
      success: function(data) {
        $("body").append(data);

        var modal           = $(`#${$(form).attr('id').replace('_call','')}`),
            modal_container = $(modal).find('.modal-container-ajaxified');

        $(modal).addClass('active');
        setTimeout(function(){$(modal_container).addClass('active');}, 50);
        closeModal(modal,modal_container);
      },
      completed: function() {
        // remove loader
      },
      error: function(data) {
        alert("Fatal Error");
      },
    });
  });
};

// ----- Remove modal content to DOM -----
function closeModal(modal,modal_container){
  $(".close-modal").click(function(){
    $(modal_container).removeClass('active');
    setTimeout(function(){$(modal_container).remove();}, 200);
    setTimeout(function(){$(modal).remove();}, 200);
  });
};
