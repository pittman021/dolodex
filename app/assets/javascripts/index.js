// index.js contacts stuff //

document.addEventListener('turbolinks:load', function() {


	document.addEventListener('click', function(e) {

		if (event.target.matches('.groups')) {
			console.log(e.target);
		}
	});

});
