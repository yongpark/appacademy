function sum() {
  let args = Array.prototype.slice.call(arguments);
  return args.reduce((a,b) => a + b);
}


function sum(...args) {
  return args.reduce((a,b) => a + b);
}

// console.log(sum(1, 2, 3, 4, 5));


// Function.prototype.myBind = function(context) {
//   return () => this.prototype.call(context);
// };

Function.prototype.myBind = function(context){
  let args = Array.prototype.slice.call(arguments).slice(1);
  let that = this;
  return function() {
    let args2 = Array.prototype.slice.call(arguments);
    let args3 = args.concat(args2);
    that.apply(context, args3);
  };
};

// var catChase = dog.chase.mybind(cat, dog);
// catChase()

Function.prototype.myBind = function(context,...args){
  let that = this;
  return function(...args2) {
    let args3 = args.concat(args2);
    that.apply(context, args3);
  };
};

function curriedSum(numArgs){
  let numbers = [];
  function _curriedSum(num){
    numbers.push(num);
    numArgs --;
    if (numArgs === 0){
      return numbers.reduce((num1,num2) => num1 + num2);
    }
    else{
      return _curriedSum;
    }
  }
  return _curriedSum;
}
//
// const sum = curriedSum(4);
// console.log(sum(5)(30)(20)(1));


Function.prototype.curry = function(numArgs){
  let args = [];
  let that = this;
  function _curry(arg){
    args.push(arg);
    numArgs --;
    if (numArgs === 0){
      return that.apply(that, args);
    }
    else{
      return _curry;
    }
  }
  return _curry;
};


Function.prototype.curry = function(numArgs){
  let args = [];
  let that = this;
  function _curried(arg){
    args.push(arg);
    if (args.length === numArgs) {
      return that.apply(null, args);
    }else{
      return _curried;
    }
  }
  return _curried;
};


function sums(num1, num2, num3) {
  return num1 + num2 + num3;
}
console.log(sums.curry(3)(1)(2)(3));
