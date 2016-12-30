// spacerock constructor
const Util = require('./util.js');
const MovingObject = require('./movingObecßt.js');


function Bullet (){}

Util.inherits(Bullet, MovingObject);

module.exports = Bullet;
