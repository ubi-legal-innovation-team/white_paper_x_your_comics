const addErrorMessage = (input) => {
  if (input.nodeName == "SELECT") {
    input.nextSibling.querySelector('.selectize-input').classList.add('border-red');
    input.closest('.parent').querySelector('label').insertAdjacentHTML('afterend',`<span class='error-message'>It can't be blank</span>`);
  } else if (input.nodeName == "TEXTAREA") {
    input.classList.add('border-red');
    input.closest('.parent').querySelector('label').insertAdjacentHTML('afterend',`<span class='error-message'>It can't be blank</span>`);
  } else if (input.type == "text") {
    input.classList.add('border-red');
    input.closest('.parent').querySelector('label').insertAdjacentHTML('afterend',`<span class='error-message'>It can't be blank</span>`);
  } else {
    input.closest('.parent').querySelector('label').insertAdjacentHTML('afterend',`<span class='error-message'>Choose an option</span>`);
  };
};

const formValidations = (e,r,o,b) => {
  $('span.error-message').remove();

  var formValid  = false,
      radios     = [],
      checkboxes = [],
      others     = [];

  if (r) {
    r.forEach((el,index) => {
      if (el.type == "radio") {
        // Sort radios inputs by name
        radios.push(document.getElementsByName(`${el.name}`));
      } else if (el.type == "checkbox") {
      // Sort checkboxes inputs by name
        checkboxes.push(document.getElementsByName(`${el.name}`));
      } else {
        // Sort other inputs
        others.push(document.getElementsByName(`${el.name}`));

        if (el.nodeName == "SELECT") {
            el.nextSibling.querySelector('.selectize-input').classList.remove('border-red');
        } else if (el.nodeName == "TEXTAREA") {
            el.classList.remove('border-red');
        } else if (el.type == "text") {
            el.classList.remove('border-red');
        };
      };
    });

    // Set up form validation on radios
    var radios_unique   = [...new Set(radios)],
        radiosValid     = radios_unique.length == 0 ? true : false,
        rb_checked      = false,
        rb_unchecked    = false;

    for (var i = 0; i < radios_unique.length; i++) {
      for (var j = 0; j < radios_unique[i].length; j++) {
        if (radios_unique[i][j].checked) {
          rb_checked   = true;
          break;
        };

        if ((j+1) == radios_unique[i].length) {
          rb_unchecked = true;
          addErrorMessage(radios_unique[i][j]);
        };
      };
    };

    if (rb_checked && !rb_unchecked) radiosValid = true ;

    // Set up form validation on checkboxes
    var checkboxes_unique     = [...new Set(checkboxes)],
        checkboxesValid       = checkboxes_unique.length == 0 ? true : false,
        cb_checked            = false,
        cb_unchecked          = false;

    for (var i = 0; i < checkboxes_unique.length; i++) {
      for (var j = 0; j < checkboxes_unique[i].length; j++) {
        if (checkboxes_unique[i][j].checked) {
          cb_checked   = true;
          break;
        };

        if ((j+1) == checkboxes_unique[i].length) {
          cb_unchecked = true;
          addErrorMessage(checkboxes_unique[i][j]);
        };
      };
    };

    if (cb_checked && !cb_unchecked) checkboxesValid = true ;

    // Set up form validation on others inputs (text and select)
    var others_filled = 0,
        othersValid   = false;

    for (var i = 0; i < others.length; i++) {
      for (var j = 0; j < others[i].length; j++) {
        if (others[i][j].value != "") others_filled += 1;

        if (others_filled == others.length) othersValid = true;

        if (others[i][j].value == "") {
          document.addEventListener('turbolinks:load', () => {
            addErrorMessage(others[i][j]);
          });
        };
      };
    };

    if (radiosValid && checkboxesValid && othersValid) formValid = true;

    // Enabled (or not) form submit
    if (!formValid) {
      e.preventDefault();
      document.querySelector("span.error-message").scrollIntoView({ behavior: 'smooth' });
    } else {
      return true;
    };
  };
};
