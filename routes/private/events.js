const db_connection = require('../../helpers/db/db_config.js').connect_local();
const moment    = require('moment')

module.exports = function (server) {
    server.get('/cpanel/events/', async function(req, res, next){
        try {
            let event_data = await get_all_events();
            let type_data = await get_all_types();
                
            res.render('private assets/pages/events/events', {
                event_data  : event_data,
                type_data   : type_data
            });

        } catch (error) {
            console.log(error)
        }          
    });

    server.get('/cpanel/events/:category_name', async function(req, res, next){
        let category_name = req.params.category_name;
        try {
            let event_data = await get_all_events(category_name);
            let type_data = await get_all_types();
                
            res.render('private assets/pages/events/events', {
                event_data  : event_data,
                type_data   : type_data
            });

        } catch (error) {
            console.log(error)
        }    
    })

    /// event create routes ///
    server.get('/cpanel/events/create/new', async function(req, res, next){
        let category_name = req.params.category_name;
        try {
            let event_data = await get_all_events(category_name);
            let type_data = await get_all_types();
                
            res.render('private assets/pages/events/event_create', {
                event_data  : event_data,
                type_data   : type_data
            });

        } catch (error) {
            console.log(error)
        }    
    });

    /// event update routes ///
    server.get('/cpanel/events/edit/:event_id', async function(req, res, next){
        let event_id = req.params.event_id;
        try {
            let event_data = await get_all_events(null, event_id);
            let type_data = await get_all_types();
                
            res.render('private assets/pages/events/event_update', {
                event_data  : event_data,
                type_data   : type_data
            });

        } catch (error) {
            console.log(error)
        } 
    });

    server.post('/cpanel/events/edit/:event_id', async function (req, res, next){
        let event_id        = req.params.event_id;
        
        let values =[
            event_name      = req.body.event_name,
            event_text      = req.body.event_text,
            event_dateStart = req.body.event_dateStart,
            event_dateEnd   = req.body.event_dateEnd,
            event_imagePath = req.body.event_imagePath,
            fk_event_type   = req.body.fk_event_type ]

        // console.log(values)

        try {
            let event_data = await post_new_event(event_id, values);


        } catch (error) {
            console.log(error)
        } 
    });
}
function post_new_event(event_id, values){
    
    console.log(values[0])
    let sql_post_new_event = `
            UPDATE
                tb_events
            SET
                event_name      = ${values[0]},
                event_text      = ${values[1]},
                event_dateStart = ${values[2]},
                event_dateEnd   = ${values[3]},
                event_imagePath = ${values[4]},
                fk_event_type   = ${values[5]}
                `

    if(event_id != null)
        sql_post_new_event += `WHERE event_id = ${event_id}`

    console.log(sql_post_new_event)

    return new Promise(function(resolve, reject){
        db_connection.execute(sql_post_new_event,  function (error, response) {
            if (error) 
                return reject(error)
            else
                resolve(response)
        });
    })
}
function get_all_events(category_name, event_id) {
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
    else if(event_id != null)
        sql_get_all_events += `WHERE event_id = '${event_id}'`

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
