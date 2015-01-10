var sqlite3 = require('sqlite3').verbose();
var fs = require("fs");
var file = '/Users/camh/Library/Messages/chat.db';
var exists = fs.existsSync(file);
if (!exists) {
	console.log('neg');
}
var db = new sqlite3.Database(file);
console.log(db);

db.serialize(function() {
	//db.run("CREATE TABLE lorem (info TEXT)");

	/*
	var stmt = db.prepare("INSERT INTO lorem VALUES (?)");
	for (var i = 0; i < 10; i++) {
		stmt.run("Ipsum " + i);
	}
	stmt.finalize();
	*/

	db.each("SELECT message.text, handle.id as handle_name FROM message JOIN handle ON message.handle_id = handle.ROWID WHERE message.service = 'iMessage'", function(err, row) {
			// console.log(err);
			// console.log(row);
			console.log(row.handle_name + ": " + row.text);
	});
/*
	db.each("SELECT id FROM handle \
		", function(err, row) {
		console.log(row.id);
	//	console.log(row.handle_id + ": " + row.text);
	});*/
});

db.close();