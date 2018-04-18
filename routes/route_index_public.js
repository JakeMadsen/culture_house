module.exports = (server) => {
    /* PUBLIC ROUTES */
    require("./public/index")(server);
    require("./public/events")(server);
    require("./public/contact")(server);
    require("./public/news")(server);
}