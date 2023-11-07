const dotenv = require('dotenv');
dotenv.config();

const express = require('express');
const app = express();

// Set the view engine to ejs
app.set("view engine", "ejs");


/*app.get('/', (req, res) => { // 'GET' as a HTTP VERB, not as a 'getter'!
    let clientIp = req.ip;
    res.send(`Hello, dear ${clientIp}. I am a nodejs website...`); 
    res.end(); // optional
});*/

// index page
app.get('/', function (req, res) {
    res.render('pages/index');
})

// about page
app.get('/about', function (req, res) {
    res.render('pages/about');
})

app.listen(process.env.WEB_PORT, '0.0.0.0',
    function() { console.log("Listening on "+process.env.WEB_PORT); }
);