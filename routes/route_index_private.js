module.exports = (server) => {
    /* PUBLIC ROUTES */
    require("./private/events")(server);
    require("./private/index")(server);
}