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

		// update the current active and childs
		for(var i = 0; i < items.length; i++){
			var current_active = items[i].classList.contains('active');

			if(current_active){
				items[i].classList.remove('active');

				var paragrahps = items[i].querySelectorAll('p');
				var read_more  = items[i].querySelector('span');

				for(var i = 0; i < paragrahps.length; i++){
					paragrahps[i].classList.add('hidden');
				};

				read_more.classList.remove('hidden');

			};
		};

		// update clicked element and childs
		var paragrahps = clicked_element.querySelectorAll('p');
		var read_more  = clicked_element.querySelector('span');
		
		for(var i = 0; i < paragrahps.length; i++){
			paragrahps[i].classList.remove('hidden');
		};

		read_more.classList.add('hidden');

		const yOffset = -100; 
		const y       = clicked_element.getBoundingClientRect().top + window.pageYOffset + yOffset;

		clicked_element.classList.add('active');
		window.scrollTo({top: y, behavior: 'smooth'});
	};
};