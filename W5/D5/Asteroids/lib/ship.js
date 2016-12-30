const MovingObject = require("./moving_object");
const Bullet = require("./bullet");
const Util = require("./util");

function Ship(){}

Util.inherits(Ship, MovingObject);

module.exports = Ship;
