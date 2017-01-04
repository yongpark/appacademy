const readline = require('readline');
const reader = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

function addNumbers(sum = 0, numsLeft, completionCallback) {
  // Notice how nowhere do I return anything here! You never return in
  // async code. Since the caller will not wait for the result, you
  // can't return anything to them.
  if (numsLeft === 0) {
    return sum;
    reader.close();
  } else {
    reader.question("Please enter a number.", function (number) {
      const num1 = parseInt(number);
      console.log(sum+num1);
      return addNumbers(sum+num1, numsLeft-1, completionCallback);
    });
  }
}

addNumbers(0, 3, sum => console.log(`Total Sum: ${sum}`));
