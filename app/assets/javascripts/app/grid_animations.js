const handleGridAnimation = () => {
	var items = document.querySelectorAll('.grid-container .item');

	if(items.length){
		for(var i = 0; i < items.length; i++){
			items[i].addEventListener('click', function(){triggerAnimation(event,items)}, false);
		};
	};
};

const triggerAnimation = (event,items) => {
	var clicked_element = event.currentTarget;
	var element_active  = false;

	element_active      = clicked_element.classList.contains('active');

	if(element_active){
		return "nothing to do";
	} else {

		for(var i = 0; i < items.length; i++){
			var current_active = items[i].classList.contains('active');

			if(current_active){
				items[i].classList.remove('active');

				var paragrahps = items[i].querySelectorAll('p');

				for(var i = 0; i < paragrahps.length; i++){
					paragrahps[i].classList.add('hidden');
				};

			};
		};

		// update clicked element and childs
		var paragrahps = clicked_element.querySelectorAll('p');
		
		for(var i = 0; i < paragrahps.length; i++){
			paragrahps[i].classList.remove('hidden');
		};

		clicked_element.classList.add('active');
	};
};