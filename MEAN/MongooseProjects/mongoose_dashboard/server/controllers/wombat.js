const mongoose = require('mongoose');
let Wombat = mongoose.model('Wombat');

module.exports = {
	show: function(req, res) {
		Wombat.find({}, function(err, wombats) {
			res.render('index', {wombats});
		})
	},
	create: function(req, res) {
		let wombat = new Wombat({name: req.body.name, sex: req.body.sex, weight: req.body.weight});
		wombat.save(function(err) {
			if(err) {
				console.log("wtf @ not creating");
			} else {
				console.log("not wtf");
				res.redirect('/');
			}
		});
	},
	get: function(req, res) {
		let id = req.params.id;
		Wombat.findOne({_id: id}, function(err, wombat) {
			if (err) {
				console.log("wtf @ getting id");
			} else {
				res.render("edit_one_wombat", {wombat});
			}
		})
	},
	update: function(req, res) {
		let id = req.params.id;
		Wombat.findOne({_id: id}, function(err, wombat) {
			wombat.name = req.body.name;
			wombat.sex = req.body.sex;
			wombat.weight = req.body.weight;
			wombat.save(function(err) {
				if(err) {
					console.log("wtf @ not updating");
				} else {
					console.log("not wtf");
					res.redirect('/');
				}
			});			
		});
	},
	delete: function(req, res) {
		let id = req.params.id;
		Wombat.remove({_id: id}, function(err) {
			if (err) {
				console.log("wtf @ not deleting");
			} else {
				res.redirect('/');
			}
		})
	}
};