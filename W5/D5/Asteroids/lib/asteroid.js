// spacerock constructor
const Util = require("./util");
const MovingObject = require("./moving_object");
const Ship = require("./ship");
const Bullet = require("./bullet");


function SpaceRock (){}

Util.inherits(SpaceRock, MovingObject);

module.exports = Asteroid;
