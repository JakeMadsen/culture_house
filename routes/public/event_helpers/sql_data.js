const db_connection = require('../../../helpers/db/db_config.js').connect_local();

module.exports = {
    getAllEvents : () => {
        let sql_get_all_events = `
            SELECT event_id, event_name, event_text, event_dateStart, event_dateEnd, event_imagePath, type_id, type_name, type_text, type_imagePath, type_color,seating_id
            FROM 
                ((tb_events 
            INNER JOIN 
                tb_event_types ON type_id = fk_event_type)
            INNER JOIN 
                tb_seating ON seating_id = fk_seating)`
        
        return new Promise(function(resolve, reject){
            db_connection.query(sql_get_all_events, function (error, event_data) {
                if (error) 
                    return reject(error)
                else
                    resolve(event_data)
            });
        })
    },
    getAllCategories : () => {
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
}