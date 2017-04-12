var wombats = require('../controllers/wombat.js');

module.exports = function(app) {
	app.get('/', function(req, res) {
		wombats.show(req, res);
	});

	app.get('/wombats/new', function(req, res) {
		res.render('new');
	});

	app.post('/wombats', function(req, res) {
		wombats.create(req, res);
	});

	app.get('/wombats/edit/:id', function(req, res) {
		wombats.get(req, res);
	});

	app.post('/wombats/:id', function(req, res) {
		wombats.update(req, res);
	});

	app.post('/wombats/destroy/:id', function(req, res) {
		wombats.delete(req, res);
	});

};