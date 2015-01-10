var sqlite3 = require('sqlite3').verbose();
var fs = require("fs");
var file = '/Users/user/Library/Messages/chat.db';
var express = require("express");
var bodyparser = require("body-parser");
var exists = fs.existsSync(file);
if (!exists) {
	console.log('neg');
}
var db = new sqlite3.Database(file);
console.log(db);

var app = express();
app.use(bodyparser.json());
app.get('/all_messages', function(req, res) {
	db.serialize(function() {
		db.each("SELECT message.text, message.ROWID as message_id, handle.id as handle_name FROM message JOIN handle ON message.handle_id = handle.ROWID WHERE message.service = 'iMessage'", function(err, row) {
				// console.log(err);
				// console.log(row);
				console.log(row.handle_name + " #" + row.message_id + ": " + row.text);
		});
	});

	db.close();
	res.send("ok!");
	res.end();
});

app.post('/send_message', function(req, res) {
	res.send(req.body.message);
	res.end();
});

app.listen(3000);
