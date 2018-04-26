/* Requires all needed node_modules for the WEB server. */
const   express     = require('express'),
        path        = require('path'),
        server      = express(),
        bodyParser  = require("body-parser"),
        fileUpload  = require('express-fileupload')
        fs          = require('fs'),
        host_settings   = require('./helpers/tools/oop_server_host'),
        https           = require('https');

/* Host contains usefull server configurations */
var host = new host_settings;
    host.server_name = "Kultur Huset";

const sslKeys = {
        key: fs.readFileSync('./ssl_keys/key.pem'),
        cert: fs.readFileSync('./ssl_keys/cert.crt')
    }
    
/* Setting up WEB server functionality. */
server.set(
    'view engine', 
    'ejs')
server.set('views', path.join(__dirname, '/public/views'));


server.use(express.static(__dirname + '/public'))
server.use('/static', express.static('public'));
server.use(express.static(path.join(__dirname + 'public')));

server.use(fileUpload());
server.use(bodyParser.urlencoded({ extended: true }));
server.use(bodyParser.json());

/* Requires public and private WEB routes. */
require('./routes/route_index_public')(server);
require('./routes/route_index_private')(server);



/* Executes listening function for WEB server. */
server.listen(host.port, function () {
    console.log('======== SERVER - RUNNING ========' +  '\n' + 
                'Server name: ' + host.server_name   +  '\n' + 
                'Server listening at: ' + 'http://'+host.ip_localhost+':'+host.port);
});

let port = host.port;
    port = port +1;

https.createServer(sslKeys, server).listen(port)