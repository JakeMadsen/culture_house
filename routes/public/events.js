const db_connection = require('../../helpers/db/db_config.js').connect_local();
const data_handler = require('./event_helpers/sql_data.js');

module.exports = function (server) {
    server.get('/events', async function(req, res, next){
        try {
            let event_data = await get_all_events();
            let type_data = await get_all_types();
                
            res.render('public assets/pages/events', {
                event_data  : event_data,
                type_data   : type_data
            });

        } catch (error) {
            console.log(error)
        }      
    });

    server.get('/events/:category_name', async function(req, res, next){
        let category_name = req.params.category_name;
        console.log("name_"+category_name)
        try {
            let event_data = await get_all_events(category_name);
            let type_data = await get_all_types();
                
            res.render('public assets/pages/events', {
                event_data  : event_data,
                type_data   : type_data
            });

        } catch (error) {
            console.log(error)
        }    

    })
}



function get_all_events(category_name) {
    let sql_get_all_events = `
            SELECT event_id, event_name, event_text, event_dateStart, event_dateEnd, event_imagePath, type_id, type_name, type_text, type_imagePath, type_color,seating_id
            FROM 
                ((tb_events 
            INNER JOIN 
                tb_event_types ON type_id = fk_event_type)
            INNER JOIN 
                tb_seating ON seating_id = fk_seating)`
    if(category_name != null)
        sql_get_all_events += `WHERE type_name = '${category_name}'`
    
    return new Promise(function(resolve, reject){
        db_connection.query(sql_get_all_events, function (error, event_data) {
            if (error) 
                return reject(error)
            else
                resolve(event_data)
        });
    })
}
function get_all_types(){
    let sql_get_all_event_types = `SELECT * FROM tb_event_types`
    
    return new Promise(function(resolve, reject){
        db_connection.query(sql_get_all_event_types, function (error, type_data) {
            if (error) 
                return reject(error)
            else
                resolve(type_data)
        });
    })
}