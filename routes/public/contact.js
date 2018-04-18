module.exports = function (server) {
    
    server.get('/kontakt', 
        function(req, res) {
            res.render('public assets/pages/contact');
        }
    );
}
