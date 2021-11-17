function selectize(selects){

  if(selects.length){
    
    for(var i = 0; i < selects.length; i++){

      if($(selects[i]).data('multiple')){


        var $select = $(`#${selects[i].id}`).selectize({
          persist: false,
          maxItems: null
        });

        var control = $select[0].selectize;
        control.setValue($(`.${selects[i].id}`).data('value'));

      } else {

        var $select = $(`#${selects[i].id}`).selectize({
          persist: false,
          maxItems: 1
        });

        var control = $select[0].selectize;
        control.setValue($(`.${selects[i].id}`).data('value'));

      };
    };
  };
};