function call_modal() {
// ----- Add modal content to DOM -----
  $(".modal-call").submit(function(event) {
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
        $('body').css('overflow','hidden');
        $("body").append(data);

        var modal           = $(`#${$(form).attr('id').replace('_call','')}`),
            modal_container = $(modal).find('.modal-container-ajaxified ');

        $(modal).addClass('active');
        setTimeout(function(){$(modal_container).addClass('active');}, 50);
        closeModal(modal,modal_container);
        // inputs.js
        formattingNumericInput();

        var form_v = document.querySelectorAll('.DOM_validation-form');

        if(form_v){
          form_v.forEach(f => {
            var button = f.querySelector('input[type="submit"]') || f.querySelector('button[type="submit"]');
            var required_inputs = f.querySelectorAll('.required-input').length > 0 ? f.querySelectorAll('.required-input') : null;

            button.addEventListener('click', function(){formValidations(event,required_inputs,button)}, false);
          });
        };
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
    $('body').css('overflow','auto');
    $(modal_container).removeClass('active');
    setTimeout(function(){$(modal_container).remove();}, 200);
    setTimeout(function(){$(modal).remove();}, 200);
  });
};
