const mongoose = require('mongoose');

let WombatSchema = new mongoose.Schema({
	name: String,
	sex: String,
	weight: Number
}, {timestamps: true});

let Wombat = mongoose.model('Wombat', WombatSchema);