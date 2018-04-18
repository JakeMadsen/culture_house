module.exports = function (server) {
    
    server.get('/nyheder', 
        function(req, res) {
            res.render('public assets/pages/news');
        }
    );
}
