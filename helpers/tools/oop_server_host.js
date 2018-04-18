let server_host = require('ip');

class Host {
    constructor(){
        this.server_name = ""
        this.ip_public = server_host.address();
        this.ip_localhost = "localhost";
        this.port = "3100";
    }
}

module.exports = Host