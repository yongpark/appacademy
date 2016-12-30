Function.prototype.inherits = function(SuperClass){
    function Surrogate() {}
    Surrogate.prototype = SuperClass.prototype;
    this.prototype = new Surrogate();
    this.prototype.constructor = this;
  };
