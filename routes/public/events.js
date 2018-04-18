const db_connection = require('../../helpers/db/db_config.js').connect_local()


module.exports = function (server) {
    server.get('/events', 
        function(req, res) {
            let get_event_data  = get_all_events(function(results){
                console.log(results)
                return results
            })
            let get_type_data

            console.log("========", event_data)
            
            res.render('public assets/pages/events', {
                event_data  : event_data,
                type_data   : type_data
            });
        }
    );
}

function get_all_events (callback) {
    let sql_get_all_events = `
        SELECT event_id, event_name, event_text, event_dateStart, event_dateEnd, event_imagePath, type_id, type_name, type_text, type_imagePath, type_color,seating_id
        FROM 
            ((tb_events 
        INNER JOIN 
            tb_event_types ON type_id = fk_event_type)
        INNER JOIN 
            tb_seating ON seating_id = fk_seating)`
        
    db_connection.query(sql_get_all_events, function (error, event_data) {
        // console.log(event_data)
        if (error) 
            throw(error)
        if (callback) 
            callback(event_data)
    });
}
function get_all_types(callback){
    let sql_get_all_event_types = `SELECT * FROM tb_event_types`
    db_connection.query(sql_get_all_event_types, function (error, type_data) {
        if (error) 
            throw(error)
        if (callback) 
            callback(event_data)
    });
}