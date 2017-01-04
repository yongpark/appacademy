const Util = require("./util");

let MovingObject = function(centerX, centerY, radius, color){
 this.centerX = centerX;
 this.centerY = centerY;
 this.radius = radius;
 this.color = color;
};

const HEX_DIGITS = "0123456789ABCDEF";

MovingObject.randomColor = function () {
  let color = "#";
  for (let i = 0; i < 6; i++) {
    color += HEX_DIGITS[Math.floor((Math.random() * 16))];
  }

  return color;
};

MovingObject.radius = function (maxX, maxY, numCircles) {
  let targetCircleArea = (maxX * maxY) / numCircles;
  let targetRadius = Math.sqrt(targetCircleArea / Math.PI);
  return 2 * targetRadius;
};

MovingObject.prototype.move = function(){
let dx = (Math.random() * 2) - 1;
let dy = (Math.random() * 2) - 1;

this.centerX = Math.abs((this.centerX + (dx * this.radius * 0.1)) % maxX);
this.centerY = Math.abs((this.centerY + (dy * this.radius) * 0.1) % maxY);

};

MovingObject.prototype.draw(ctx) = function(){

};

MovingObject.prototype.isCollidedWith(otherMovingObject) = function(){

};

MovingObject.prototype.isCollidedWith(otherMovingObject) = function(){

};

module.exports = MovingObject;
