const triggerPrintable = (link) => {
	link.addEventListener('click', function(event){
	  event.preventDefault();

	  var source     = document.querySelectorAll('action-text-attachment figure img');
	  var sources    = [];
	  var questions  = [];
	  var project_id = this.getAttribute('data-project');

	  for(var i = 0; i < source.length; i++){
	    sources.push(source[i].src);
	    questions.push(source[i].closest('section').id)
	  }

	  window.open(`https://legaldesign-community.com/projects/${project_id}.pdf?sources=${sources}&questions=${questions}`)
	});
};