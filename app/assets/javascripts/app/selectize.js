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

      } else if($(selects[i]).data('option')){

        var options = [];

        options.push(
          { id: "Access to justice", model: "stakes", value: "Access to justice" },
          { id: "Deal with multiplicity of outcomes", model: "stakes", value: "Deal with multiplicity of outcomes" },
          { id: "Implement legal design", model: "stakes", value: "Implement legal design" },
          { id: "Informational design", model: "stakes", value: "Informational design" },
          { id: "Perception of law professionals", model: "stakes", value: "Perception of law professionals" },
          { id: "Application", model: "media", value: "Application" },
          { id: "Comics", model: "media", value: "Comics" },
          { id: "Document", model: "media", value: "Document" },
          { id: "Access to justice", model: "media", value: "Infographic" },
          { id: "Infographic", model: "media", value: "Lab" },
          { id: "Toolbox", model: "media", value: "Toolbox" },
          { id: "Training", model: "media", value: "Training" },
          { id: "Website", model: "media", value: "Website" }
        );

        var optgroups = [
          { id: "stakes", name: "stakes" },
          { id: "media", name: "media" },
        ];
        var optgroupOrder = ["stakes", "media"];

        $(`#${selects[i].id}`).selectize({
          options: options,
          optgroups: optgroups,
          persist: false,
          maxItems: null,
          labelField: "value",
          valueField: "id",
          optgroupField: "model",
          optgroupLabelField: "name",
          optgroupValueField: "id",
          optgroupOrder: optgroupOrder,
          searchField: ["value"],
          plugins: ["optgroup_columns"],
          render: {
            item: function(item, escape) {
              // Selected item
              return '<div class="item">' +
                      (item.id ? `<span class="value" data-model="${item.model}">` + escape(item.id) + '</span>' : '')
                     '</div>';
            }
          }
        });

        $(selects[i]).change(function(){
          $("#ajax_search").trigger("submit");
        });

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

