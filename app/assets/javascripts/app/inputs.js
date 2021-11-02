function formattingNumericInput() {
 $(".format-num").on("keypress keyup blur",function (event) {
    $(this).val($(this).val().replace(/[^\d.]/, ""));
  });
};

// handleFileInput called when file input is changed on DOM_handle-file-input //

// --------------------------------------
// 👇👇    HTML DROPDOWN EXAMPLE    👇👇
// --------------------------------------

// <div class="flex-start parent">
//   <%= f.label :picture, "add picture", class: 'upload-file flex-cent p-10' %>
//   <%= f.file_field :picture, direct_upload: true, onchange: "handleFileInput(event)" %>
// </div>


const handleFileInput = (event) => {
  var hash  = event.currentTarget.files,
      label = document.querySelector(`label[for=${event.currentTarget.getAttribute('id')}]`);

  Object.keys(hash).forEach(function (key) {
    var new_div        = document.createElement('div'),
        new_node       = document.createElement('div'),
        delete_node    = document.createElement('div'),
        reference_node = event.currentTarget.previousElementSibling,
        new_content    = document.createTextNode(`${hash[key].name}`),
        delete_content = document.createTextNode('✖️');

    // Set up hidden field with file name
    if (event.currentTarget.parentNode.parentNode.querySelector('.name')) {
      event.currentTarget.parentNode.parentNode.querySelector('.name').value = `${hash[key].name}`;
    };

    new_div.className     = "flex-start-cent";
    new_node.className    = "file";
    delete_node.className = "delete";

    // Insert the new node before the reference node
    reference_node.parentNode.insertBefore(new_div, reference_node);
    // Insert the new node into the new div
    new_div.insertAdjacentElement('beforeend', new_node);
    new_div.insertAdjacentElement('beforeend', delete_node);
    // Insert content inside the new node div
    new_node.appendChild(new_content);
    delete_node.appendChild(delete_content);
  });

  // Delete the selected file
  document.querySelectorAll('.delete').forEach(element => {
    element.addEventListener('click', function(event){
      if (event.currentTarget.closest('form').querySelector('.name')) {
        event.currentTarget.closest('form').querySelector('.name').value = "";
      };

      event.currentTarget.closest('form').querySelector('input[type=file]').value = "";
      event.currentTarget.parentNode.remove();
    });
  });
};


// handleFileInput2 called when file input is changed on DOM_validation-form //

// --------------------------------------
// 👇👇    HTML DROPDOWN EXAMPLE    👇👇
// --------------------------------------

// <div class="flex-start parent">
//   <%= f.label :picture, "add picture", class: 'upload-file flex-cent p-10' %>
//   <%= f.file_field :picture, direct_upload: true, onchange: "handleFileInput2(event)" %>
// </div>

const handleFileInput2 = (event) => {
  var hash  = event.currentTarget.files,
      label = document.querySelector(`label[for=${event.currentTarget.getAttribute('id')}]`);

  Object.keys(hash).forEach(function (key) {
    label.innerHTML = hash[key].name + '<span><svg class="ml-05" width="20" height="20" viewBox="0 0 35 35" fill="none" xmlns="http://www.w3.org/2000/svg"><path d="M17.5 0C7.85011 0 0 7.85011 0 17.5C0 27.1499 7.85011 35 17.5 35C27.1499 35 35 27.1499 35 17.5C35 7.85011 27.1499 0 17.5 0ZM26.3696 13.7915L16.8904 23.2705C16.606 23.5549 16.2327 23.698 15.8594 23.698C15.4861 23.698 15.1128 23.5549 14.8284 23.2705L10.0889 18.531C9.51851 17.9609 9.51851 17.0391 10.0889 16.469C10.659 15.8986 11.5805 15.8986 12.1509 16.469L15.8594 20.1775L24.3076 11.7295C24.8777 11.1591 25.7993 11.1591 26.3696 11.7295C26.9397 12.2996 26.9397 13.2211 26.3696 13.7915Z" fill="#38C93C"/></svg></span>';
  });
};
